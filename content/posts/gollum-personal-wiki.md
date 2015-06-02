---
title: "Gollum as a Secure Personal Knowledge Base"
date: "2015-05-27"
tags: ["tools"]
slug: gollum-personal-wiki
---

After stumbling across [gollum][1], I decided it was about time I started
tracking things I find and learn in a more structured way. Especially tracking
tasks I don't do often.

My requirements were:

1. Must have search.
1. Plaintext. No specific data formats.
1. Ability to add to it from my ChromeBook.
1. Secure.

Gollum nails the first 3, with its beautiful web interface and git-backed
markdown goodness.

So let's start by going for 3-out-of-4. First, decide how you're going to
install gollum. I used [rvm][3] for the first pass, so let's go with that. Get
a shell as the user you want to be running gollum as, and let's get going.

```
# If you haven't installed RVM yet, go ahead and do that
# curl -L https://get.rvm.io | bash -s stable --ruby=2.0.0
# You may need to (on Fedora) install libicu-devel for internationalization
$ gem install gollum
$ mkdir wiki.yoursite.com && cd wiki.yoursite.com
$ echo "#Hello

This is my first wiki article ever" > Home.md
$ git add . && git commit -m 'initial commit'
$ gollum
```

Now you should be set with gollum running on (by default) port 4567. Check it
out, see if it works. Now let's go after the security bit.

Thinking about the security part was the hardest, because I didn't want to
raise the barrier to adding info by requiring a password or 2-factor auth.
Client certificate authentication came to mind, and so far it's worked
excellently. The idea of using a client certificate came from
[startssl.com][2], which installs a cert in your browser when you sign up and
requires it for any future transactions

With that, I set off make myself a signing certificate (because real ones are
mad $$$) and make certs for my devices. I used the `openssl` command line tool,
it's kind of clunky, but it'll get you there.

First, we need to make our signing cert.

```bash
openssl genrsa -aes256 -out ca.key 4096
openssl req -new -x509 -days 365 -key ca.key -out ca.crt
```

Now that we've generated our signing cert, we can use this script to sign the
individual certificates for each client.

```bash
#!/bin/bash
# mk_client_keys.sh
HOST=mycomputer #a shortname for a given client
SERIAL=01 # increment this with each host
mkdir $HOST && cd $HOST # make a directory for all the cert/key files related to that host
openssl genrsa -aes256 -out $HOST.key 2048
openssl req -new -key $HOST.key -out $HOST.csr
openssl x509 -req -days 365 -in $HOST.csr -CA ../client_signing_ca.crt -CAkey ../client_signing_ca.key -set_serial $SERIAL -out $HOST.crt
openssl pkcs12 -export -in $HOST.crt -inkey $HOST.key -out $HOST
```

So now we can run that script for as many clients as we need. It's time to
configure nginx to actually check the certificates and send requests along to
gollum. This example assumes nginx is installed on the same machine you just
installed gollum. Add the config below to nginx's `/etc/nginx/sites.d/`,
`/etc/nginx/sites-enabled/`, or directly to `/etc/nginx.conf` depending on how
your site is configured.

If starting with a fresh nginx install, there are some [nginx boilerplate][4]
configurations available to get your nginx server going with some sane
defaults.

```
server {
        listen 80;
        server_name wiki.yoursite.com;
        rewrite ^ https://$server_name$request_uri? permanent;
}
server {
        listen 443 ssl;
        server_name wiki.yoursite.com;
        # if you don't have a serverssl cert, skip the next 2 lines
        ssl_certificate      /etc/nginx/certs/server.crt; 
        ssl_certificate_key  /etc/nginx/certs/ssl.key;
        # this will be the CA cert we created earlier
        ssl_client_certificate /etc/nginx/certs/client_signing_ca.crt;
        ssl_verify_client on; # require that the client cert be signed by us, otherwise throw a nasty 400
        location / {
                proxy_pass   http://127.0.0.1:4567/;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header Host $host;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_buffering on;
                proxy_redirect off;
        }
}
```

After adding this file, restart nginx and test that gollum is accessible by
clients with the certificate. The best way to do this is
`curl -k -v -L --cert mycomputer/mycomputer.p12 https://wiki.mysite.com`.

Now to get the certificate into your browser. In Chromium/Google Chrome the
certificate can be imported in **Settings > HTTPS/SSL > Import Identity Certificate**.
Bam, you're done now. Head over and start using your personal wiki to record
ideas, reference docs, drafts of blog posts, or journal entries. Best of all,
never enter a password to get in; but know that your data is safe.

[1]: https://github.com/gollum/gollum
[2]: https://www.startssl.com/
[3]: http://rvm.io/
[4]: https://github.com/Umkus/nginx-boilerplate
