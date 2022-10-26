% 1) Write the max predicate that calculates the maximum between 2 values.
% See: https://www.swi-prolog.org/pldoc/doc_for?object=f(max/2)
% Using max function
% X is max(1, 2). % X = 2.
% X is max(2, 1). % X = 2.

% See: https://www.youtube.com/watch?v=ASHr-LcjtvU&ab_channel=TutorialsPoint%28India%29Ltd.
get_max(X, Y, X) :- X >= Y.
get_max(X, Y, Y) :- X < Y.
% CLI testing:
% consult('lab01.pl').
% get_max(1, 2, X). % X = 2.
% get_max(2, 1, X). % X = 2.

% https://www.youtube.com/watch?v=n4cm2zZb1Xo&ab_channel=TutorialsPoint%28India%29Ltd. - Using cut
get_max2(X, Y, X) :- X >= Y, !.
get_max2(X, Y, Y).
% CLI testing:
% consult('lab01.pl').
% get_max2(10, 2, X). % X = 10.
% get_max2(10, 10, X). % X = 10.
% get_max2(2, 10, X). % X = 10.

get_max3(X, Y, Max) :- X >= Y, !, Max = X; Max = Y.
% CLI testing:
% consult('lab01.pl').
% get_max3(10, 2, X). % X = 10.
% get_max3(10, 10, X). % X = 10.
% get_max3(2, 10, X). % X = 10.



% 2) Write the member and concat predicates.
% See: https://en.wikibooks.org/wiki/Prolog/Lists#The_member_predicate
% member(2, [1, 2, 3]). % true
% member(-2, [1, 2, 3]). % false

% See: http://tau-prolog.org/documentation/prolog/lists/member/2
get_member(X,[X|_]).
get_member(X,[_|Xs]) :- get_member(X,Xs).
% CLI testing:
% consult('lab01.pl').
% get_member(2, [1, 2, 3]). % true
% get_member(-2, [1, 2, 3]). % false




% 3) Calculate the alternate sum of the elements of a list.
% See: https://stackoverflow.com/questions/27077064/sum-of-alternating-elements-of-a-list
get_altsum([], 0).
get_altsum([A], S) :-
   S is A.
get_altsum([A,B|ABs],S0) :-
   get_altsum(ABs, S1),
   S0 is A-B+S1.
% CLI testing:
% consult('lab01.pl').
% get_altsum([1,2,3,4], X). % X = -2.




% 4) Eliminate an element from a list(one/all the occurrences of that element).
% See: https://stackoverflow.com/questions/12175377/deleting-all-occurrences-of-an-element-from-a-list
del_member(X, [], []) :- !.
del_member(X, [X|Xs], Y) :- !, del_member(X, Xs, Y).
del_member(X, [T|Xs], Y) :- !, del_member(X, Xs, Y2), append([T], Y2, Y).
% CLI testing:
% consult('lab01.pl').
% del_member(2, [1, 2, 3], X). % X = [1, 3].




% 5) Reverse a list; generate all the permutations of the elements of a list.
% 5.1
% See: https://stackoverflow.com/questions/19471778/reversing-a-list-in-prolog
get_reverse([],Z,Z).
get_reverse([H|T],Z,Acc) :- get_reverse(T,Z,[H|Acc]).
% CLI testing:
% consult('lab01.pl').
% get_reverse([1, 2, 3], H, T). % H = [3, 2, 1|T].

% 5.2
% See: https://stackoverflow.com/questions/4578755/permuted-combinations-of-the-elements-of-a-list-prolog
get_permute([],[]) :- !.
get_permute(L,[X|R]) :-
    get_omit(X,L,M),
    get_permute(M,R).

get_omit(H,[H|T],T).
get_omit(X,[H|L],[H|R]) :-
    get_omit(X,L,R).
% CLI testing:
% consult('lab01.pl').
% get_permute([1, 2, 3], X).
% X = [1, 2, 3] ;
% X = [1, 3, 2] ;
% X = [2, 1, 3] ;
% X = [2, 3, 1] ;
% X = [3, 1, 2] ;
% X = [3, 2, 1] ;




% 6) Find the number of occurrences of an element in a list.
% See: https://stackoverflow.com/questions/9088062/count-the-number-of-occurrences-of-a-number-in-a-list
get_count([],X,0).
get_count([X|T],X,Y):- get_count(T,X,Z), Y is 1+Z.
get_count([X1|T],X,Z):- X1\=X,get_count(T,X,Z).
% CLI testing:
% consult('lab01.pl').
% get_count([1,2,2,1,3,2,3], 2, X). % X = 3




% 7) Insert an element on a certain position in a list.
% See: https://gist.github.com/ivpusic/4336091
insert_at(El, L, 1, [El | L]).
insert_at(El, [G | R], P, [G | Res]):-
	P1 is P - 1,
	insert_at(El, R, P1, Res).
% CLI testing:
% consult('lab01.pl').
% insert_at(30, [1,2,3], 2, X). % X = [1, 30, 2, 3]




% 8) Merge two ascending ordered lists.
% See: https://www.cs.umd.edu/class/spring2016/cmsc330/lectures/prolog2.pdf
get_merge(Xs, [], Xs).
get_merge([], Ys, Ys).
get_merge([X|Xs], [Y|Ys], [X|Zs]) :- X < Y, get_merge(Xs, [Y|Ys], Zs).
get_merge([X|Xs], [Y|Ys], [X,Y|Zs]) :- X = Y, get_merge(Xs, Ys, Zs).
get_merge([X|Xs], [Y|Ys], [Y|Zs]) :- X > Y, get_merge([X|Xs], Ys, Zs).
% CLI testing:
% consult('lab01.pl').
% get_merge([1,2,3], [1,4,5,6], X). % X = [1, 1, 2, 3, 4, 5, 6]
