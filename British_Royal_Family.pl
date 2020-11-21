male('PrincePhillip').
male('PrinceCharles').
male('CaptainMarkPhillips').
male('TimothyLaurence').
male('PrinceAndrew').
male('PrinceEdward').
male('PrinceWilliam').
male('PrinceHarry').
male('PeterPhillips').
male('MikeTindall').
male('JamesViscountSevern').
male('PrinceGeorge').

female('QueenElizabethII').
female('PrincessDiana').
female('CamillaParkerBowles').
female('PrincessAnne').
female('SarahFerguson').
female('SophieRhys-jones').
female('KateMiddleton').
female('AutumnKelly').
female('ZaraPhillips').
female('PrincessBeatrice').
female('PrincessEugenie').
female('LadyLouiseMonthbatten-Windsor').
female('PrincessCharlotte').
female('SavanahPhillips').
female('IslaPhillips').
female('MiaGraceTindall').

parent('QueenElizabethII', 'PrinceCharles').
parent('QueenElizabethII', 'PrincessAnne').
parent('QueenElizabethII', 'PrinceAndrew').
parent('QueenElizabethII', 'PrinceEdward').
parent('PrincePhillip', 'PrinceCharles').
parent('PrincePhillip', 'PrincessAnne').
parent('PrincePhillip', 'PrinceAndrew').
parent('PrincePhillip', 'PrinceEdward').

parent('PrincessDiana', 'PrinceWilliam').
parent('PrincessDiana', 'PrinceHarry').
parent('PrinceCharles', 'PrinceWilliam').
parent('PrinceCharles', 'PrinceHarry').
parent('CaptainMarkPhillips', 'PeterPhillips').
parent('CaptainMarkPhillips', 'ZaraPhillips').
parent('PrincessAnne', 'PeterPhillips').
parent('PrincessAnne', 'ZaraPhillips').
parent('SarahFerguson', 'PrincessBeatrice').
parent('SarahFerguson', 'PrincessEugenie').
parent('PrinceAndrew', 'PrincessBeatrice').
parent('PrinceAndrew', 'PrincessEugenie').
parent('SophieRhys-jones', 'JamesViscountSevern').
parent('SophieRhys-jones', 'LadyLouiseMonthbatten-Windsor').
parent('PrinceEdward', 'JamesViscountSevern').
parent('PrinceEdward', 'LadyLouiseMonthbatten-Windsor').

parent('PrinceWilliam', 'PrinceGeorge').
parent('PrinceWilliam', 'PrincessCharlotte').
parent('KateMiddleton', 'PrinceGeorge').
parent('KateMiddleton', 'PrincessCharlotte').
parent('AutumnKelly', 'SavanahPhillips').
parent('AutumnKelly', 'IslaPhillips').
parent('PeterPhillips', 'SavanahPhillips').
parent('PeterPhillips', 'IslaPhillips').
parent('ZaraPhillips', 'MiaGraceTindall').
parent('MikeTindall', 'MiaGraceTindall').

married('QueenElizabethII', 'PrincePhillip').
married('PrincePhillip', 'QueenElizabethII').
married('PrinceCharles', 'CamillaParkerBowles').
married('CaptainMarkPhillips', 'PrinceCharles').
married('PrincessAnne', 'TimothyLaurence').
married('TimothyLaurence', 'PrincessAnne').
married('PrinceEdward', 'SophieRhysjones').
married('SophieRhys-jones', 'PrinceEdward').
married('PrinceWilliam', 'KateMiddleton').
married('KateMiddleton', 'PrinceWilliam').
married('AutumnKelly', 'PeterPhillips').
married('PeterPhillips', 'AutumnKelly').
married('ZaraPhillips', 'MikeTindall').
married('MikeTindall', 'ZaraPhillips').

divorced('PrinceCharles', 'PrincessDiana').
divorced('PrincessDiana', 'PrinceCharles').
divorced('PrincessAnne', 'CaptainMarkPhillips').
divorced('CaptainMarkPhillips', 'PrincessAnne').
divorced('SarahFerguson', 'PrinceAndrew').
divorced('PrinceAndrew', 'SarahFerguson').

husband(Person, Wife) :-
    married(Person, Wife),
    male(Person).
wife(Person, Husband) :-
    married(Person, Husband),
    female(Person).
father(Parent, Child) :-
    male(Parent),
    parent(Parent, Child).
mother(Parent, Child) :-
    female(Parent),
    parent(Parent, Child).
child(Child, Parent) :-
    parent(Parent, Child).
son(Child, Parent) :-
    male(Child),
    parent(Parent, Child).
daughter(Child, Parent) :-
    female(Child),
    parent(Parent, Child).
grandparent(GP, GC) :-
    parent(GP, X),
    parent(X, GC).
grandmother(GM, GC) :-
    female(GM),
    parent(GM, X),
    parent(X, GC).
grandfather(GF, GC) :-
    male(GF),
    parent(GF, X),
    parent(X, GC).
grandchild(GC, GP) :-
    grandparent(GP, GC).
grandson(GS, GP) :-
    male(GS),
    grandchild(GS, GP).
granddaughter(GD, GP) :-
    female(GD),
    grandchild(GD, GP).
sibling(Person1, Person2) :-
  setof((Person1,Person2), P^(parent(P,Person1),parent(P,Person2), \+Person1=Person2), Sibs),
  member((Person1,Person2), Sibs),
  \+ (Person2@<Person1, member((Person2,Person1), Sibs)).
brother(Person, Sibling) :-
    male(Person),
    sibling(Person, Sibling).
sister(Person, Sibling) :-
    female(Person),
    sibling(Person, Sibling).
aunt(Person, NieceNephew) :-
    (female(Person),
    parent(X, NieceNephew),
    sibling(X, Person));
    (female(Person),
    married(Person, Y),
    male(Y),
    brother(Y, Z),
    parent(Z, NieceNephew));
    (female(Person),
    married(Person, Someone),
    sibling(P1, P2),
    (parent(P1, Someone), parent(P2, SomeoneElse)),
    parent(SomeoneElse, NieceNephew)).
uncle(Person, NieceNephew) :-
    (male(Person),
    parent(X, NieceNephew),
    sibling(X, Person));
    (male(Person),
    married(Person, Y),
    female(Y),
    sister(Y, Z),
    parent(Z, NieceNephew));
    (male(Person),
    married(Person, Someone),
    sibling(P1, P2),
    (parent(P1, Someone), parent(P2, SomeoneElse)),
    parent(SomeoneElse, NieceNephew)).
niece(Person, AuntUncle) :-
    (uncle(AuntUncle, Person); aunt(AuntUncle, Person)),
    female(Person).
nephew(Person, AuntUncle) :-
    (uncle(AuntUncle, Person); aunt(AuntUncle, Person)),
    male(Person).
