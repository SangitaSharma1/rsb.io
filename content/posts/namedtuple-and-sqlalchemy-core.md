---
title: Using namedtuple with SQLAlchemy Core
date: "2015-10-05"
tags: ["python", "sqlalchemy"]
slug: namedtuple-and-sqlalchemy
---

Namedtuple 
```
import json
import sqlalchemy
from collections import namedtuple
from sqlalchemy import Column, Table, Integer, Text

connection_string = 'postgresql:///example'
db = sqlalchemy.create_engine(connection_string)
engine = db.connect()
meta = sqlalchemy.MetaData(engine)

Table("users", meta,
    Column('id', Integer),
    Column('name', Text),
    Column('email', Text),)
meta.create_all()

table = sqlalchemy.table("jsontable",
    Column('id', Integer),
    Column('name', Text),
    Column('email', Text),)
```

```
# add test data
for stmt in [
    table.insert().values(id=1, name="Alice Test", email="alice@test.com"),
    table.insert().values(id=1, name="Bob Test", email="bob@test.com"),
    table.insert().values(id=1, name="Charles Test", email="charles@test.com"),
    table.insert().values(id=1, name="Diane Test", email="diane@test.com"),
]:
    engine.execute(stmt)
```

```
alice = table.select().where(name == "Alice Test").fetchone()
print("User: {}".format(alice[1]))
```

This is quite un-fun; remembering indices is easy to get wrong. It can be the
source of really annoying (and sometimes sneaky) errors down the road if the
data in multiple columns looks similar.

Along comes `namedtuple` to help us out.

```
User = namedtuple('User', ["id", "name", "email"])
alice = User(alice)
print("User: {}".format(alice.name))
```
