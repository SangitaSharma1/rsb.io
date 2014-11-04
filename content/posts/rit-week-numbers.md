---
title: RIT Week Numbers
date: "2012-10-01"
slug: rit-week-numbers
---

Over the weekend I found a fun [PHP form] [1] that will build week numbers
(Monday-Sunday) for arbitrary date ranges. Using it to make a base of week
number ICAL files for each of the RIT quarters, I made liberal use of Perl to
convert from Monday-Sunday numbered weeks to Monday-Friday numbered weeks, and
factored in RIT breaks. The [ICAL file] [2] is available, and has week numbers
for Fall-Spring of the 12-13 academic year.

Using it is easy: make a new calendar in Google Calendar, then import the [ICAL
file] [3] to that calendar. Now week numbers will show up as appropriate.

Maybe in the future I'll write a python script to parse RIT's
[calendar] [4] and add breaks in as well. Another time, perhaps.

[1]: http://optics.eee.nottingham.ac.uk/matt/weeknumbers/weeknumbers_form.php
[2]: http://www.ryansb.com/static/resources/rit_week_numbers_12-13.ical
[3]: http://www.ryansb.com/static/resources/rit_week_numbers_12-13.ical
[4]: http://www.rit.edu/calendar/
