% Problem 01
% Last element of list
my_last(X, [A|[]]) :- X = A.
my_last(X, [_|B]) :- my_last(X, B).

% Problem 02
% zweitletzes element finden
second(X, [A,_|[]]) :- X = A.
second(X, [_|B]) :- second(X, B).

% Problem 03
% find Kth element of the list
element_at(X, [A|_], 0) :- X = A.
element_at(X, [_|B], K) :- K1 is K - 1, element_at(X, B, K1).

% Problem 04
% Number of elements of a list
numberOfElements(X, A) :- numberOfElements_(X, A, 0).
numberOfElements_(X, [], K) :- X = K.
numberOfElements_(X, [_|B], K) :- K1 is K + 1, numberOfElements_(X, B, K1).

% Problem 05
% Reverse a list
reverse_(Lnew, Lold) :- reverse__([], Lold, X), Lnew = X.
reverse__(Res, [], X) :- X = Res.
reverse__(Res, [A|R], X) :- reverse__([A|Res], R, X).

% Problem 06
% Is List Palindrome ?
palindrome(List) :- reverse_(X, List), X == List.

% Problem 07
% Flatten list
my_flatten(X, [X]) :- \+ is_list(X).
my_flatten([], []).
my_flatten([A|B], X) :- my_flatten(A, X2), my_flatten(B, X1), append(X1, X2, X).

% Problem 08
% entferne aufeinander folgende duplikate aus liste
compress([], X) :- X = [].
compress([A|[]], X) :- X = [A].
compress([A, A|B], X) :- compress([A|B], X1), X = X1.
compress([A|B], X) :- compress(B, X1), X = [A|X1].

% Problem 09
% aufeinander folgende duplikate in subliste packen
pack([], X) :- X = [].
pack([A|[]], X) :- X = [A].
pack([A, A|B], X) :- pack([A|B], X1), X = [[A]| X1].
pack([A|B], X) :- pack(B, X1), X = [[A]|[X1]].

removeFromList([], _, Res, _) :- Res = [].
removeFromList([A|B], A, Res, X) :- removeFromList(B, A, Res1, X1), Res = [A|Res1], X = X1.
removeFromList(B, _, Res, X) :- Res = [], X = B.