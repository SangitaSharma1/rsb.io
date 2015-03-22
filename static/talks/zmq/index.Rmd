---
title       : ØMQ - Fast Good and Fast
subtitle    : Did I mention fast?
author      : Ryan S. Brown
framework   : io2012
highlighter : highlight.js
hitheme     : github
widgets     : []
mode        : selfcontained
---

## Buzzword Bingo

ØMQ (also seen as ZeroMQ, 0MQ, zmq) looks like an embeddable networking library
but acts like a concurrency framework. It gives you sockets that carry atomic
messages across various transports like in-process, inter-process, TCP, and
multicast. You can connect sockets N-to-N with patterns like fanout, pub-sub,
task distribution, and request-reply. It's fast enough to be the fabric for
clustered products. Its asynchronous I/O model gives you scalable multicore
applications, built as asynchronous message-processing tasks. It has a score of
language APIs and runs on most operating systems. ØMQ is from iMatix and is
LGPLv3 open source.

---

## 10,000 Foot View

* Sockets. Exposed to severe 1950's comic book radioactivity.
* Multiple available transports (in-process, TCP, etc)
* Flexible topologies
* Fast
* Async - Runs in background threads
* Crossplatform

```{c}
zmq_bind (socket, "tcp://*:5555");
zmq_bind (socket, "udp://*:9999");
zmq_bind (socket, "inproc://myipc");
```

---

## ØMQ is NOT

* A messaging server
* A replacement for sockets
* A message queue (I know, you're saying "what?")
* A Eureka/Zookeeper replacement

---

## ØMQ IS

* Awesome
* Connectionless
* One simple API (distributed topologies with one wierd trick!)
* Language-independent wire representation
* Stop message floods in a single bound
* A tool to build awesome routing topologies

---

## Very Crossplatform

* 40+ language bindings
* C, C++, C#, Python, Go, Java, Ruby...
* Linux, Windows, OS X, BSD...

---

## What can I send?

Bytes. All the bytes.

Wire format: `5hello`

Big messages are sent in multiple parts

All-or-nothing delivery

---

## Simple Patterns

* REQ and REP
* PUB and SUB
* PUSH and PULL
* PAIR and PAIR

---

## REQ-REP - Request/Reply

* Remote Procedure Call
* Task Distribution
* Blocks in lock-step. Only one message can be "open" at a time

![Request Reply](https://raw.github.com/imatix/zguide/master/images/fig2.png)

---

## Hello There

```{python}
import zmq

context = zmq.Context()

#  Socket to talk to server
print "Connecting to hello world server…"
socket = context.socket(zmq.REQ)
socket.connect ("tcp://localhost:5555")

#  Do 10 requests, waiting each time for a response
for request in range (10):
    print "Sending request ", request,"…"
    socket.send ("Hello")

    #  Get the reply.
    message = socket.recv()
    print "Received reply ", request, "[", message, "]"
```

---

## REQ-REP - Continued

* One "open" message per connection
* Server can have a lot of clients/open jobs

![Request Reply](https://raw.github.com/imatix/zguide/master/images/fig47.png)

---

## PUB-SUB - Publish/Subscribe

* N - N
* Push data
* Publishers can have many Subscribers, and Subscribers can have many Publishers
* Publisher can go offline and Subscribers await his return (partition tolerance you say?)
* Subscribers can't tell the publisher anything "hey, I went offline, can I have the last X messages?"
* Word of the day is still "idempotency"

---

## PUSH-PULL

* More queue-like
* Great for fan in or fan out messaging
* One-way. If a client dies it's up to you to notice the job didn't get to the end of the pipeline

---

## PUSH-PULL - Continued

![Fan In Fan Out](https://raw.github.com/imatix/zguide/master/images/fig5.png)

---

## PAIR-PAIR

* Closely related to a normal socket
* Write arbitrarily
* Least interesting of the patterns

---

## Advanced Patterns

* REQ and ROUTER
* DEALER and REP
* DEALER and ROUTER
* DEALER and DEALER
* ROUTER and ROUTER

---

## Router and Dealer

* 1-N
* Ships messages from front to back, no blocking
* Messages gain a connection ID as they go through so the REP can come back
* Only the Router and Dealer know about those IDs

![Router and Dealer](https://raw.github.com/imatix/zguide/master/images/fig16.png)

---

## References

* [The zmq Guide](http://zguide.zeromq.org/page:all)
