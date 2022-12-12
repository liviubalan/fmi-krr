% https://www.youtube.com/watch?v=QOt_ipXv9kQ&list=PLWPirh4EWFpFLjsd3IUqymnCVBaz1Yagg&index=7&ab_channel=TutorialsPoint
female(pam).
female(liz).
female(pat).
female(ann).

male(jim).
male(bob).
male(tom).
male(peter).

parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).
parent(bob, peter).
parent(peter, jim).

mother(X, Y) :- parent(X, Y), female(X).
father(X, Y) :- parent(X, Y), male(X).
haschild(X) :- parent(X, _).
sister(X, Y) :- parent(Z, X), parent(Z, Y), female(X), X\==Y.
brother(X, Y) :- parent(Z, X), parent(Z, Y), male(X), X\==Y.

% https://www.youtube.com/watch?v=iDVi7affguo&list=PLWPirh4EWFpFLjsd3IUqymnCVBaz1Yagg&index=8&ab_channel=TutorialsPoint
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
grandmother(X, Z) :- mother(X, Y), parent(Y, Z).
grandfather(X, Z) :- father(X, Y), parent(Y, Z).
wife(X, Y) :- parent(X, Z), parent(Y, Z), female(X), male(Y).
uncle(X, Z) :- brother(X, Y), parent(Y, Z).

% https://www.youtube.com/watch?v=2QqQAiNmycI&list=PLWPirh4EWFpFLjsd3IUqymnCVBaz1Yagg&index=9&ab_channel=TutorialsPoint
predecessor(X, Z) :- parent(X, Z).
predecessor(X, Z) :- parent(X, Y), predecessor(Y, Z).

% https://www.youtube.com/watch?v=0STTLN7a5eE&list=PLWPirh4EWFpFLjsd3IUqymnCVBaz1Yagg&index=12&ab_channel=TutorialsPoint
% haschild(X) :- parent(X, Y). % Warning: Singleton variables: [Y]
% haschild(X) :- parent(X, _).

% https://www.youtube.com/watch?v=ASHr-LcjtvU&list=PLWPirh4EWFpFLjsd3IUqymnCVBaz1Yagg&index=14&ab_channel=TutorialsPoint
max(X, Y, X) :- X >= Y.
max(X, Y, Y) :- X < Y.

min(X, Y, X) :- X =< Y.
min(X, Y, Y) :- X > Y.

% https://www.youtube.com/watch?v=1SHrI2lMK4A&list=PLWPirh4EWFpFLjsd3IUqymnCVBaz1Yagg&index=16&ab_channel=TutorialsPoint
series(X, Y, Z) :- Z is (X + Y).
parallel(X, Y, Z) :- Z is ((X * Y) / (X + Y)).

vertical(seg(point(X,_), point(X,_))).
horizontal(seg(point(_,Y), point(_,Y))).
oblique(seg(point(X1,Y1), point(X2,Y2))) :-
    X1 \== X2,
    Y1 \== Y2.

% https://www.youtube.com/watch?v=T095SaEhHas&list=PLWPirh4EWFpFLjsd3IUqymnCVBaz1Yagg&index=17&ab_channel=TutorialsPoint
% TODO

% https://www.youtube.com/watch?v=JmUqld0O3dc&list=PLWPirh4EWFpFLjsd3IUqymnCVBaz1Yagg&index=19&ab_channel=TutorialsPoint
list_member(X, [X|_]).
list_member(X, [_|TAIL]) :- list_member(X, TAIL).

% https://www.youtube.com/watch?v=cdIWKuqdTIs&list=PLWPirh4EWFpFLjsd3IUqymnCVBaz1Yagg&index=20&ab_channel=TutorialsPoint
list_length([], 0).
list_length([_|TAIL], N) :- list_length(TAIL, N1), N is N1+1.

% https://www.youtube.com/watch?v=3ilS5rR3z2s&list=PLWPirh4EWFpFLjsd3IUqymnCVBaz1Yagg&index=21&ab_channel=TutorialsPoint
concatenation([], L, L).
concatenation([X1|L1], L2, [X1|L3]) :- concatenation(L1, L2, L3).

% https://www.youtube.com/watch?v=c0pULN5p2BU&list=PLWPirh4EWFpFLjsd3IUqymnCVBaz1Yagg&index=22&ab_channel=TutorialsPoint
interm(0, zero).
interm(1, one).
interm(2, two).
interm(3, three).
interm(4, four).
interm(5, five).
interm(6, six).
interm(7, seven).
interm(8, eight).
interm(9, nine).

inwords([], []).
inwords([X|TAIL], [T|Z]) :- interm(X,T), inwords(TAIL,Z).

% https://www.youtube.com/watch?v=iPx4mAPdhWY&list=PLWPirh4EWFpFLjsd3IUqymnCVBaz1Yagg&index=23&ab_channel=TutorialsPoint
del(Y, [Y], []).
del(X, [X|LIST1], LIST1).
del(X, [Y|LIST], [Y|LIST1]) :- del(X, LIST, LIST1).

/*
CLI Usage

[db01].
parent(X, jim).
mother(X, Y).
haschild(X).
brother(X, Y).

mother(X,Y).
trace.
mother(pam,Y).
mother(pam,bob).
mother(pam,ann).
notrace.
uncle(X, Y).
wife(X, Y).

predecessor(peter, liz).
predecessor(peter, X).
trace.
predecessor(peter, X).
notrace.

max(100, 200, X).
max(200, 100, X).
min(100, 200, X).
min(200, 100, X).

parallel(10, 40, X).
series(8, 12, Y).
parallel(20, 30, Z).
parallel(10,40,X), series(X,12,Y), parallel(30,Y,Z).

vertical(seg(point(10,20), point(10,30))).
vertical(seg(point(10,20), point(15,30))).
oblique(seg(point(10,20), point(15,30))).
oblique(seg(point(10,30), point(15,30))).
horizontal(seg(point(10,30), point(15,30))).

list_member(a, [a,b,c,d,e,f]).
list_member(X, [a,b,c,d,e,f]).
member(X, [a,b,c,d,e,f]).
member(a, [a,b,c,d,e,f]).

list_length([a,b,c,d,e,f], L).
list_length([], L).

concatenation([a,b,c], [d,e,f,g], L).
concatenation([a,b,c], L, [a,b,c,d,e,f,g]).
concatenation([], L, [a,b,c,d,e,f,g]).
concatenation([a,b,c], [], L).
concatenation([], [], L).

inwords([0,3,2,5,6,9,8,7,4,1], X).
inwords(X, [one,two,nine,six]).

del(c, [a,b,c,d,e,f], X).
del(X, [a,b,c,d,e,f], [a,b,c,e,f]).
del(c, [c], X).
*/
