# british_royal_family_prolog
This is the Prolog language implementation for defining relations between members of the British Royal Family.\
Here are the predicates and facts I have already defined:\
  parent(Parent,Child)\
  male(Person)\
  married(Person, Person)\
  female(Person)\
  divorced(Person, Person) \
  husband(Person,Wife)\
  wife(Person,Husband)\
  father(Parent,Child)\
  mother(Parent,Child)\
  child(Child,Parent)\
  son(Child,Parent)\
  daughter(Child,Parent)\
  grandparent(GP,GC)\
  grandmother(GM,GC)\
  grandfather(GF,GC)\
  grandchild(GC,GP)\
  grandson(GS,GP)\
  granddaughter(GD,GP)\
  sibling(Person1,Person2)\
  brother(Person,Sibling)\
  sister(Person,Sibling)\
  aunt(Person,NieceNephew)\
  uncle(Person,NieceNephew)\
  niece(Person,AuntUncle)\
  nephew(Person,AuntUncle)
