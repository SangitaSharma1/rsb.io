---
title: Using namedtuple with SQLAlchemy Core
date: "2015-10-05"
tags: ["python", "sqlalchemy"]
slug: namedtuple-and-sqlalchemy
---

[SQLAlchemy][sqla] is solidly in my top 5 favorite Python libraries, and has a
starring role in many of my work and personal projects. OpenStack runs on
SQLAlchemy.

As much as the ORM helps me, sometimes SQLAlchemy Core is plenty for my the
project of the moment. I have a few pieces of data that map to a table easily,
and relations aren't important. For that case, the humble
[collections.namedtuple][namedtuple] is invaluable. Declaring a namedtuple that
matches column names is an easy way to add a little syntax sugar on top of
SQLAlchemy Core without using the ORM.

Before we get to that, let's set up a data model. We'll just track user names
and email addresses, so the `namedtuple` will look like this:

```
from collections import namedtuple
User = namedtuple('User', ["id", "name", "email"])
someone = User(1, "Some Body", "some@one.com")
```

Simple, and making a user looks a lot like if `User` were a normal object. Now
let's build the persistence portion.

## Setting the Stage

```
import json, sqlalchemy

connection_string = 'postgresql:///example'
db = sqlalchemy.create_engine(connection_string)
engine = db.connect()
meta = sqlalchemy.MetaData(engine)

columns = (
    sqlalchemy.Column('id', sqlalchemy.Integer),
    sqlalchemy.Column('name', sqlalchemy.Text),
    sqlalchemy.Column('email', sqlalchemy.Text),
)

sqlalchemy.Table("users", meta, *columns)
meta.create_all()

table = sqlalchemy.table("users", *columns)
```

Now we have a table to back the data model. From here, we can start adding
data.

```
# add test data
statements = [
    table.insert().values(user)
    for user in (
        User(1, "Alice", "alice@test.com"),
        User(2, "Bob", "bob@test.com"),
        (3, "Chuck", "Chuck@test.com"),
        (4, "Diane", "diane@test.com"),
    )
]
[engine.execute(stmt) for stmt in statements]
```

Note that some of the tuples are the `User` namedtuple, while others are raw
tuples. As long as the data in the tuples match the schema, SQLAlchemy will
save either properly.

## Reading the Data

```
alice = engine.execute(table.select().where(table.c.name == "Alice")).fetchone()
print("User: {}".format(alice[1]))
```

This isn't so great, remembering indices is easy to get wrong. Worse, it can be
the source of really annoying (and sometimes sneaky) errors down the road if
the data in multiple columns looks similar. For us, mixing up email addresses
and names will be easy to notice since most people don't have ".com" in their
surname.

## Using Named Tuples

With `namedtuple`, accessing data and even debugging becomes easier.

```
tuple_alice = User(*alice)
print("User: {}".format(tuple_alice.name))
# User: Alice
print(alice)
# (1, 'Alice', 'alice@test.com')
print(tuple_alice)
# User(id=1, name='Alice', email='alice@test.com')
```

This uses the tuple we got from the database to populate the `namedtuple` from
earlied, and now we can access properties by name. The caveat here is that
tuples are immutable, so we can't *alter* the data we get, but that does help
enforce ownership, and which functions have the ability to mutate state.

With `namedtuple`, it's easy to create an application that is a series of
functions over immutable data that saves either final or incremental results,
and has strong separation of concerns. Additionally, without an ORM concerns
about exactly when database queries happen disappear because no property
accesses can trigger lazy loads.

[namedtuple]: https://docs.python.org/3/library/collections.html#collections.namedtuple
[sqla]: http://www.sqlalchemy.org/
