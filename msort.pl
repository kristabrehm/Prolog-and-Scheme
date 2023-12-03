%Krista Brehm
%Merge Sort Implementation

%L1 is the list we are working with where S2 is a sorted list
% the half-sized lists are P1 and P2

% merge sort base cases
mergeSort([], []).
mergeSort([X], [X]).


% merge sort rule
mergeSort(L1, L2) :-
    split(L1, P1, P2),
    mergeSort(P1, S1),
    mergeSort(P2, S2),
    merge(S1, S2, L2).

% split rule
split([], [], []).
split([X], [X], []). 
split([X, Y | Tail1], [X | Tail2], [Y | Tail3]) :-
    split(Tail1, Tail2, Tail3).

% merge rule - recursive calls
merge([], L, L).
merge(L, [], L).
merge([X|Xs], [Y|Ys], [X|Tail]) :-
    X =< Y,
    merge(Xs, [Y|Ys], Tail).
merge([X|Xs], [Y|Ys], [Y| Tail]) :-
    X > Y,
    merge([X|Xs], Ys, Tail).
