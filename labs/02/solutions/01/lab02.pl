% 1) Compute the greatest common divisor of two integers – gcd/3;
% gcd(0,X,X):-!.
% gcd(X,0,X):-!.
% gcd(A,B,C):-A=<B, D is B-A, gcd(D,A,C).
% ... the case for A>B – consider using !.

% See: https://rosettacode.org/wiki/Greatest_common_divisor#Prolog
gcd(0, X, X) :- !.
gcd(X, 0, X) :- !.
gcd(X, Y, D) :- X =< Y, !, Z is Y - X, gcd(X, Z, D).
gcd(X, Y, D) :- gcd(Y, X, D).

% CLI testing:
% consult('lab02.pl').
% gcd(10, 20, X). % X = 10.
% gcd(10, 10, X). % X = 10.
% gcd(20, 10, X). % X = 10.




% 2) Split a list into 2 lists, according to a given value: the elements that are less than the value are
% placed in the first list and the elements greater or equal than the value are placed in the second
% list – split/4;
% split([],H,[],[]).
% split([H1|T],H,[H1|A],B):-H1=<H,!, split(T,H,A,B).
% ... the case for H1>H – consider using !.
%?-split([3,2,6,1,5],4,L1,L2)

split([], H, [], []).
split([H1|T], H, [H1|A], B) :- H1 =< H, !, split(T, H, A, B).
split([H1|T], H, A, [H1|B]) :- H1 > H, !, split(T, H, A, B).

% CLI testing:
% consult('lab02.pl').
% split([3, 2, 6, 1, 5], 4, L1, L2).
% L1 = [3, 2, 1],
% L2 = [6, 5].




% 5) Given the following knowledge base:
% There are 5 houses, each of a different color (red, white, blue, yellow, green).
% In each house, there is only one person, of a different nationality (British, Swedish, Danish,
% Norwegian, German).
% Each person of each house drinks a certain drink (milk, beer, tea, water, coffee), smokes a certain
% brand of cigarettes (PallMall, Winfield, Marlboro, Dunhill, Rothmans) and owns a certain animal
% (bird, dog, horse, cat, fish).
% Each of the 5 people drinks a different drink, smokes a different brand of cigarettes and owns a
% different kind of animal.
% The British man lives in the red house.
% The Norwegian lives next to the blue house.
% The green house is to the (immediate) left of the white house.
% The owner of the green house drinks coffee.The owner of the house in the middle drinks milk.
% The owner of the yellow house smokes Dunhill.
% The Norwegian lives in the first house.
% The Swedish man has a dog.
% The person who smokes Pall Mall has a bird.
% The Marlboro smoker lives next to the one with a cat.
% The Winfield smoker drinks beer.
% The person who owns a horse lives next to the one who smokes Dunhill.
% The German smokes Rothmans.
% The Marlboro smoker has a neighbor who drinks water.
% write a Prolog program that answers the question “Who has the fish?”.
% Suggestions for implementation:
% einstein(Sol) :- Sol=[[1,N1,C1,P1,D1,S1],
% [2,N2,C2,P2,D2,S2],
% [3,N3,C3,P3,D3,S3],
% [4,N4,C4,P4,D4,S4],
% [5,N5,C5,P5,D5,S5]],
% member([_,englishman,red,_,_,_],Sol), % The Britishman lives in the red house
% member([WH,_,white,_,_,_],Sol),
% member([GH,_,green,_,_,_],Sol),
% GH =:= WH - 1,
% ...
% %implement here the rest of the rules
% % The green house is on the immediate left of the white houseOR
% einstein(Sol) :- Sol=[[N1,C1,P1,D1,S1],
% [N2,C2,P2,D2,S2],
% [N3,C3,P3,D3,S3],
% [N4,C4,P4,D4,S4],
% [N5,C5,P5,D5,S5]], ..... implement here all the rules making use of the predicate member
% and define additional predicates to check different positions of elements in a list (e.g. next, left, first).
right_of(X, Y) :- X is Y+1.
left_of(X, Y) :- right_of(Y, X).

next_to(X, Y) :- right_of(X, Y).
next_to(X, Y) :- left_of(X, Y).

solution(Street, FishOwner) :-
    Street = [
           house(1, Nationality1,  Color1,     Pet1,   Drinks1,    Smokes1),
           house(2, Nationality2,  Color2,     Pet2,   Drinks2,    Smokes2),
           house(3, Nationality3,  Color3,     Pet3,   Drinks3,    Smokes3),
           house(4, Nationality4,  Color4,     Pet4,   Drinks4,    Smokes4),
           house(5, Nationality5,  Color5,     Pet5,   Drinks5,    Smokes5)],
    member(house(_, brit,          red,        _,      _,          _           ), Street),
    member(house(_, swede,         _,          dog,    _,          _           ), Street),
    member(house(_, dane,          _,          _,      tea,        _           ), Street),
    member(house(A, _,             green,      _,      _,          _           ), Street),
    member(house(B, _,             white,      _,      _,          _           ), Street),
    left_of(A, B),
    member(house(_, _,             green,      _,      coffee,     _           ), Street),
    member(house(_, _,             _,          birds,  _,          pall_mall   ), Street),
    member(house(_, _,             yellow,     _,      _,          dunhill     ), Street),
    member(house(3, _,             _,          _,      milk,       _           ), Street),
    member(house(1, norweigan,     _,          _,      _,          _           ), Street),
    member(house(C, _,             _,          _,      _,          blend       ), Street),
    member(house(D, _,             _,          cats,   _,          _           ), Street),
    next_to(C, D),
    member(house(E, _,             _,          horse,  _,          _           ), Street),
    member(house(F, _,             _,          _,      _,          dunhill     ), Street),
    next_to(E, F),
    member(house(_, _,             _,          _,      bluemaster, beer        ), Street),
    member(house(_, german,        _,          _,      _,          prince      ), Street),
    member(house(G, norweigan,     _,          _,      _,          _           ), Street),
    member(house(H, _,             blue,       _,      _,          _           ), Street),
    next_to(G, H),
    member(house(I, _,             _,          _,      _,          blend       ), Street),
    member(house(J, _,             _,          _,      water,      _           ), Street),
    next_to(I, J),
    member(house(_, FishOwner,     _,          fish,   _,          _           ), Street).