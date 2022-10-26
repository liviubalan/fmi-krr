parent(ion,maria).
parent(ana,maria).
parent(ana,dan).
parent(maria,elena).
parent(maria,radu).
parent(elena,nicu).
parent(radu,george).
parent(radu,dragos).

% parent(ana,maria).
% parent(ion,radu).
% parent(X,maria).
% parent(X,Y).
% parent(X,Y), parent(Y,radu).

pred(X,Y) :- parent(X,Y).
pred(X,Z) :- parent(X,Y), pred(Y,Z).

% 1+2 == 2+1.
% 1+2 =:= 2+1.
% 1+2 \== 2+1.
% 1+2 \== 1+2.
% X is 3+2.

% [1,2,3]=[1|[2,3]].
% [1,2|[3]]=[1,2,3|[]].

boy(liviu, 37).
boy(rares, 22).
ageboys(L):-findall(Age, boy(Name,Age), L).
sum(S):-ageboys(L),sum(L,S).
sum([],0).
sum([H|T],S):-sum(T,S1), S is S1+H.
% sum(Age).
