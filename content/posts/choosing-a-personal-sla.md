---
title: Choosing a Personal SLA
date: "2015-09-23"
tags: ["productivity", "work"]
slug: personal-sla
---

Email is absolutely a [monster][monster], and nobody loves their inbox. I
certainly don't, but it's a critical communication medium and mailing lists are
the life-blood of Open Source projects like OpenStack. Ignoring them is not an
option.

I've tried to restrict email to certain times of the day in the past, but it's
never really stuck because it's just so easy to leave your email client open
all day and check in every so often. Part of the reason I failed so miserably
to corral my email is because I felt like I *had* to respond to everyone as
soon as I could.

Then I hit two mostly-simultaneous realizations.

I realized that my inbox was becoming a [todo list][todohbr], which isn't great
because email clients are huge distractions that anyone can add to. Then I read
a post about downtime that would require AWS DynamoDB to be perfect for
[60 years][sixty] to meet their SLA.

![sixty years](/img/sixty_years.png)

I haven't actually managed to find DynamoDB's SLA, so take that number with a
grain of salt. If true, sixty years of *perfect* 5-millisecond response is a
high bar.

With that, I decided that an SLA was exactly what I needed to take the pressure
off myself about email. If someone needs quick response, they will likely be
able to reach out on IRC or by phone. So I drafted a much more lenient SLA for
my own email responses.

1. Every email sent directly to me will be read within 4 business-hours*
1. Every list email will be read within 2 business days
1. Every email requiring a response will receive one within 1 business day

Here, "business hours" and "business day", are defined as 8am-5pm US Eastern
Time (currently EDT). This gives me enough flexibility that I can check email 3
times a day and meet my SLA entirely.

Achieving an SLA this generous hasn't been all that difficult. As a
[pomodoro][pomodoro] user it's easy to schedule in three pomodoros each day for
"email and overhead" tasks. This includes writing replies to short emails, or
adding action items to [TaskWarrior][t] for replies that need more research.

I've been happy with the results thus far - I spend less total time looking at
my email client, and I'm better able to focus on other tasks when I need to.
At work, sometimes things are on fire, which requires me to check email more
frequently, but since that's not the normal case my standard SLA is
satisfactory most of the time.

[monster]: http://theoatmeal.com/comics/email_monster
[pomodoro]: http://pomodorotechnique.com/
[t]: http://taskwarrior.org/
[todohbr]: https://hbr.org/2014/03/stop-using-your-inbox-as-a-to-do-list
[sixty]: https://twitter.com/Opacki/status/645610294266322944
