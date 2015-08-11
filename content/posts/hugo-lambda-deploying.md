---
title: Deploying Hugo-Lambda
date: "2015-03-26"
tags: ["code"]
series: ["hugo-lambda"]
slug: deploying-hugo-lambda
---

Last post, I [announced][intro] the [hugo-lambda][hugolambda] project, a way to
use a static site generator without actually running it. Since Lambda is just a
developer preview, it isn't the easiest to work with or debug at the moment.

To help with that, Mitch Garnaat has released [kappa][kappa], a tool that
streamlines the process pretty significantly. Each function gets a config file
that defines its name, IAM roles, and event sources (triggers). With that
information, kappa lets you deploy, test, and audit your function with a few
simple commands.

To deploy hugo-lambda, I chose kappa in concert with a [CloudFormation][cfn]
template to create the IAM roles, Route53 records, and S3 buckets necessary to
serve your site statically.

The template itself creates:

1. Route53 records for www.your.website and your.website
1. S3 buckets for your raw content (input.your.website) and the published site
   (your.website)
1. IAM users to be used by the Lambda functions

At the time of this writing, CloudFormation doesn't support Lambda but I expect
that do be added sometime after it leaves developer preview.

Thanks to all this automation, actually deploying hugo-lambda is just two
steps. First, you need to replace [rsb.io](http://rsb.io/) with your domain in
the CloudFormation template and the kappa config files. The filenames in the
repo are:

* `hugo-lambda.cfn`
* `generate/config.yml`
* `static-sync/config.yml`

Once you've done that, you can run `make deploy` and the functions will be
uploaded and the resources created.

The Makefile papers over a few steps. First, libraries (`s3` and `async`) the
function depends on are downloaded, as is the latest `hugo` release binary.
With the dependencies downloaded, it generates a CloudFormation JSON template
from the YAML in `template.yml` and deploys the CFN template to AWS to build
the needed buckets, DNS records, and aliases.

To run, you need to have AWS credentials accessible in your environment that
have permissions to create S3 buckets, Route53 records, IAM users, and Lambda
functions and event sources. I haven't built a minimum viable permissions (the
[other][mvplayer] [other][mvprod] MVP) IAM policy yet, but it'll be added soon.

Once the underlying resources are deployed, you're almost ready to go. You
still need one thing though...a web site! For demo purposes you can download
the [Hugo documentation][hugodocs], which is itself a Hugo static site. Make
sure you check out version 0.14, because the documentation fails to build with
the latest stable version.

To actually deploy your site, all you need to do is put the site in the
`input.your.site` bucket. I use the [awscli][awscli] [s3 sync][sync] command.
Another option is [boto-rsync][boto-rsync]

```
$ git clone https://github.com/spf13/hugo
$ cd hugo/docs
$ aws s3 sync --exclude '.git/*' . s3://input.your.site/
```

The new files in the input bucket will trigger the hugo-lambda functions that
were uploaded with `make deploy` and within a minute of the final uploaded file
you will be able to navigate to the site and see the output site.

Thanks for using hugo-lambda! For more info, check out [this overview][intro],
[the project page][hugolambda], and report any [issues on GitHub][issues].

[hugolambda]: https://github.com/ryansb/hugo-lambda
[issues]: https://github.com/ryansb/hugo-lambda/issues
[intro]: http://rsb.io/posts/overview-of-hugo-lambda/
[kappa]: https://github.com/garnaat/kappa
[cfn]: https://aws.amazon.com/cloudformation/
[mvplayer]: https://en.wikipedia.org/wiki/Most_valuable_player
[mvprod]: https://en.wikipedia.org/wiki/Minimum_viable_product
[hugodocs]: https://github.com/spf13/hugo/tree/master/docs
[awscli]: http://docs.aws.amazon.com/cli/latest/reference/index.html#cli-aws
[sync]: http://docs.aws.amazon.com/cli/latest/reference/s3/sync.html
[boto-rsync]: https://github.com/seedifferently/boto_rsync
