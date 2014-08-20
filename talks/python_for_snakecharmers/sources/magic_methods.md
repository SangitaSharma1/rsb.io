# Do You Believe in Magic?

## Creation
* \__init__
* \__new__

## Equality
* \__eq__ #equal to
* \__lt__ #less than
* \__le__ #less than or equal to
* \__gt__ #greater than
* \__ge__ #greater than or equal to

---
# Magic Methods Continued

## Class/Object
* \__module__ #the module an object is a part of
* \__class__ #the fully qualified class of an object
* \__base__ #base class of the object
* \__bases__ #a list of base classes
* \__subclasscheck__ #pass in an object to see if it is a subclass of this one
* \__subclasses__ #find everything that is a subclass of this one
* \__instancecheck__ #pass in an object to see if it is an of this class
* \__call__ #shorthand of this is ()
* \__dict__ #returns a dict of (by default) all the attributes of an instance

---
# Magic Methods, Still

## Attributes
* \__getattribute__
* \__setattr__
* \__delattr__

## Coercion
* \__repr__ #return a representation of an object <object at 0x7f4e3b92c270\>
* \__str__ #stringify the object
* \__format__ #default object formatter
* \__name__ #string of the name of the object
