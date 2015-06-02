---
title: "Declarative Orchestration: Lessons in Scaling Ops"
date: "2015-05-02"
tags: ["heat"]
slug: why-declarative-orchestration
---

Disclaimer: I work at Red Hat on [OpenStack Heat][heat], a declarative
orchestration tool so *of course* I think they're the way to go.

As more and more organizations move to cloud infrastructure instead of
traditional physical or virtual systems, tools to handle large complex
workloads are getting more important. The only wrinkle is that an operational
system will tend towards higher complexity unless it is carefully designed.

Orchestration aims to make complex systems simpler to run by masking some of
the complexity of actually creating all the pieces of a large application like:
instances, DNS names, load balancers, databases, and private networks. Modeling
all these in code makes management easier, changes more transparent, and are
self-documenting ways to express interdependencies between your application's
infrastructure.

You can think of declarative models like a thermostat: you pick a temperature,
and it handles heating & cooling to maintain it. Similarly, Heat lets you
specify the desired state of your infrastructure (N servers with private IPs
and open ports for HTTP traffic) and not worry about *how* they get there. Huge
of operational complexity move inside your orchestration service out of your
hands, and you get repeatability and reusability of components for "free" if
you write the template once.

The best part about being able to talk about infrastructure as a declarative
template with some parameters is that you can share the *entire* set of
dependencies for your application -- not just the code. Amazon uses
CloudFormation to publish reference architectures and the final product of some
tutorials, and the [Murano][murano] and [App Catalog][catalog] projects in
OpenStack aim to create an App Store-like way of sharing Heat templates,
images, and other components.

## Lessons Learned

Now that Heat has been out in the wild for some time, the team has learned a
few lessons. First among the lessons learned is the Law of Unintended Use
Cases. When users can take your software and use it in ways you didn't
consider, that's a good sign. It means that you've built composable tools that
people want to use, and given them enough information that they can learn to
use your product well.

The value of composability and common interfaces are a lesson we already learned
from the UNIX philosophy. Making a single small tool that composes well makes
users much happier than a big tool that doesn't interoperate.

[heat]: http://docs.openstack.org/developer/heat/
[murano]: https://wiki.openstack.org/wiki/Murano
[catalog]: http://apps.openstack.org/
