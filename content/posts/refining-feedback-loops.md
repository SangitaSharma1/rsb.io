---
title: "Pomodoro: Feedback Loops Refined"
date: "2015-09-24"
tags: ["productivity"]
slug: pomodoro-feedback-loops
---

Making a habit out of not just doing work, but doing the *right* work is
critical to succeeding on a yearly basis. It's easy to settle into a routine
that makes each day look like a win on its own, but when you look back over the
year you must be able to answer "well what did I do?"

Did you build a business from X dollars to X + Y dollars? Did you get (and
figure out how to stay) in shape? Did you learn a skill? Did you get organized?

That last one, get organized, is a trick. Being organized isn't an
accomplishment on its own. Organization helps you win at other things, like
better follow-through on tasks, or less time spent looking for a document. It's
important, but don't confuse it with a goal.

Having a winning feedback loop is key. What makes a winning feedback loop?

1. Speed. The faster you can get through one iteration, the better.
1. Context. The loop has make sense in the context of your goals. If the
   feedback loop you settle on is "send X emails" you had better be an email
   marketer, because that's the only profession I know of that succeeds
   directly by sending emails.

Without context, you will find yourself shuffling busywork back and forth
across your desk. Without speed, you won't see enough benefit to stick to the
program.

For me, context is abundant because OpenStack is governed in a transparent way
and makes it easy for me to see what actions I can take to help myself and the
community succeed. The simplest thing I can do is to fix bugs, which is an easy
process to refine into short loops. 

1. Find a bug
1. Write a test to isolate the bug
1. Fix the bug
1. Commit the code

In OpenStack, there is requisite lag between step 3 and 4 due to code review.
It is possible to make steps 1-3 into a feedback loop of reasonable speed
and that makes sense in the broader context of the project. To break these down
into even shorter feedback cycles, I use the [Pomodoro Technique][pomodoro] to
focus work on a problem into small 25-minute sprints.

Really, this is two loops. The bug-fix loop above, and the Pomodoro loop. This
loop looks like:

1. Start a pomodoro
1. Finish a pomodoro and take a break
1. Repeat 1-2 all day
1. Review metrics in [Clockwork Tomato][tomato] and [TaskWarrior][t] to compare
   time worked and tasks completed
1. Repeat 1-4 tomorrow

I highly recommend trying out [Clockwork Tomato][tomato] as a Pomodoro timer,
it's not only configurable, but it also lets you associate tasks with each
Pomodoro, so you can get a broader view of where your time is going every day.
With that information, you can refine the other feedback loops you use to
encourage you to spend more of your time actually moving the needle.

[t]: http://taskwarrior.org/
[pomodoro]: http://pomodorotechnique.com/
[tomato]: https://play.google.com/store/apps/details?id=net.phlam.android.clockworktomato
