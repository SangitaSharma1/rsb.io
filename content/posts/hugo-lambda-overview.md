---
title: An Overview of Hugo-Lambda
date: "2015-03-25"
tags: ["code"]
series: ["hugo-lambda"]
slug: overview-of-hugo-lambda
---

When Amazon introduced [AWS Lambda][lambda] I saw tons of interesting
possibilities. Being able to react to events without needing to constantly run
(and pay for) EC2 instances. I built [hugo-lambda][hugolambda] to take
advantage of Lambda to rebuild my static site whenever I made a change.

*If you've read much about lambda, skip this paragraph.*

Lambda is still in an AWS (developer preview) product that consumes events from
Kinesis (stream processing), S3 events, DynamoDB changes, and more. You can use
it to make advanced materialized views out of DynamoDB tables, react to
uploaded images, or archive old content. In short, you write a function
(currently only in node.js) and it is presented with JSON containing
information about the event's source and content.

There are, of course some limitations. Functions must complete in under 60
seconds, and debugging Lambda functions is a bit clunky since CloudWatch
doesn't provide logs in real time.

For this blog, I use the top-shelf [Hugo][hugo] static site generator to turn
content (in markdown) into a halfway presentable site. Up until now, I've
always made my changes, run `hugo` and then syncing the content to be served
from S3.

Recall this bit about lambda:

> React to events without needing to constantly run (and pay for) instances

Hugo just performs a set of simple transformations to my content before it can
be served, on my (totally unscientific laptop) benchmarks Hugo takes less than
0.1 seconds to run, and the only input it requires are the templates and
content for the site.

After a bit of digging, I discovered the [lambdash][lambdash] project, which
explored the environment a Lambda function runs in. Turns out, it's a 64-bit
Amazon Linux installation with a `/tmp` directory to work in. That sounds like
plenty to install Hugo's dependencies. The joke here is, of course, that Go
statically compiles its binaries so there are no dependencies.

Under the hood, hugo-lambda is divided into two parts. The replication of
static content is handled by one function, and another generates the "dynamic"
parts of the site from your templates/content. It already runs this site, so
give it a shot and raise some [issues][issues].

Coming soon: more under-the-hood details and a how-to post to migrate your
site.

[hugo]: http://gohugo.io/
[hugolambda]: https://github.com/ryansb/hugo-lambda
[issues]: https://github.com/ryansb/hugo-lambda/issues
[lambda]: https://aws.amazon.com/lambda/
[lambdash]: https://github.com/alestic/lambdash
