loves(romeo, juliet).
loves(juliet, romeo) :- loves(romeo, juliet).

male(albert).
male(bob).
male(bill).
male(carl).
male(charlie).
male(dan).
male(edward).
 
female(alice).
female(betsy).
female(diana).

happy(albert).
happy(alice).
happy(bob).
happy(bill).
with_albert(alice).

runs(albert) :- happy(albert).

dances(alice) :-
  happy(alice),
  with_albert(alice).

does_alice_dance :- dances(alice),
       write('When Alice is happy and with Albert she dances').

% swims(bob) :-
%   happy(bob),
%   near_water(bob).

swims(bill) :-
  happy(bill).

% Does not apply because the same predicate is defined above 
swims(bill) :-
  near_water(bill).

parent(albert, bob).
parent(albert, betsy).
parent(albert, bill).
 
parent(alice, bob).
parent(alice, betsy).
parent(alice, bill).
 
parent(bob, carl).
parent(bob, charlie).

get_grandchild :-
    parent(albert, X),
    parent(X, Y),
    write('Alberts grandchild is '),
    write(Y), nl.

get_grandparent :-
    parent(X, carl),
    parent(X, charlie),
    format('~w ~s grandparent~n', [X, "is the"]).

brother(bob, bill).

grand_parent(X, Y) :-
    parent(Z, X),
    parent(Y, Z).

blushes(X) :- human(X).
human(derek).

stabs(tybalt,mercutio,sword).
hates(romeo, X) :- stabs(X, mercutio, sword).

what_grade(5) :-
  write('Go to kindergarten').
what_grade(6) :-
  write('Go to first grade').
what_grade(Other) :-
  Grade is Other - 5,
  format('Go to grade ~w', [Grade]).

owns(albert, pet(cat, olive)).

customer(tom, smith, 20.55).
customer(sally, smith, 120.55).

get_cust_bal(FName, LName) :- customer(FName, LName, Bal),
  write(FName), tab(1),
  format('~w owes us $~2f ~n', [LName, Bal]).

vertical(line(point(X, Y), point(X, Y2))).
horizontal(line(point(X, Y), point(X2, Y))).

warm_blooded(penguin).
warm_blooded(human).
 
produce_milk(penguin).
produce_milk(human).
 
have_feathers(penguin).
have_hair(human).
 
mammal(X) :-
  warm_blooded(X),
  produce_milk(X),
  have_hair(X).

related(X, Y) :- parent(X, Y).
related(X, Y) :-
  parent(X, Z),
  related(Z, Y).

double_digit(X,Y) :- Y is X*2.
is_even(X) :- Y is X//2, X =:= 2 * Y.

say_hi :-
  write('What is your name? '),
  read(X),
  write('Hi '),
  write(X).

fav_char :-
  write('What is your favorite character? '),
 
  % Receives a char and saves its ascii value to X
  get(X),
  format('The Ascii value ~w is ', [X]),
 
  % Outputs Ascii value as the char
  put(X),nl.

write_to_file(File, Text) :-
  open(File, write, Stream),
  write(Stream, Text), nl,
  close(Stream).
read_file(File) :-
        open(File, read, Stream),
 
        % Get char from the stream
        get_char(Stream, Char1),
 
        % Outputs the characters until end_of_file
        process_stream(Char1, Stream),
        close(Stream).
 
process_stream(end_of_file, _) :- !. 
process_stream(Char, Stream) :-
        write(Char),
        get_char(Stream, Char2),
        process_stream(Char2, Stream).

count_to_10(10) :- write(10), nl.
 
count_to_10(X) :-
  write(X),nl,
  Y is X + 1,
  count_to_10(Y).
 
count_down(Low, High) :-
  % Assigns values between Low and High to Y
  between(Low, High, Y),
  % Assigns the difference to Z
  Z is High - Y,
  write(Z),nl,
  % Continue looping until Y = 10
  Y = 10.
 
count_up(Low, High) :-
  between(Low, High, Y),
  Z is Y + Low,
  write(Z), nl,
  Y = 10.
 
guess_num :- loop(start).
loop(15) :- write('You guessed it!'). 
loop(X) :-
  x \= 15,
  write('Guess Number '),
  read(Guess),
  write(Guess),
  write(' is not the number'), nl,
  loop(Guess).

:- dynamic(father/2).
:- dynamic(likes/2).
:- dynamic(friend/2).
:- dynamic(stabs/3).

father(lord_montague,romeo).
father(lord_capulet,juliet).
 
likes(mercutio,dancing).
likes(benvolio,dancing).
likes(romeo,dancing).
likes(romeo,juliet).
likes(juliet,romeo).
likes(juliet,dancing).
 
friend(romeo,mercutio).
friend(romeo,benvolio).

stabs(tybalt,mercutio,sword).
stabs(romeo,tybalt,sword).

write_list([]).
write_list([Head|Tail]) :-
  write(Head), nl,
  write_list(Tail).

join_str(Str1, Str2, Str3) :-
 
  % Convert strings into lists
  name(Str1, StrList1),
  name(Str2, StrList2),
 
  % Combine string lists into new string list
  append(StrList1, StrList2, StrList3),
 
  % Convert list into a string
  name(Str3, StrList3).
