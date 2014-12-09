# rsb.io

The source of my personal website, built with [hugo](http://gohugo.io/)

## static files

The contents of the `public` directory (not included in the repo) can be
generated either with the `make static` or `hugo` commands.

## file server

To build the (optional) server you'll need to install [esc][esc] like this:

    go install github.com/mjibson/esc

The `make server` command builds a self-contained (statically compiled w/
embedded assets) binary to serve the whole site. It uses [esc][escblog] static
asset embedder for [go][go] to first gzip all the files in `public/` and then
make them accessible over http.

At the time of this writing, with 7MB of content, the final binary weighs in at
11MB and serves the content wicked fast(tm).

To change the port content is served on, edit the `PORT` variable in the
makefile.


[go]: https://github.com/golang/go
[escblog]: http://mattjibson.com/blog/2014/11/19/esc-embedding-static-assets/
[esc]: https://github.com/mjibson/esc
