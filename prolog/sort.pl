my_sort(Sorted, List) :- my_sort(Sorted, [], List).
my_sort(Acc, Acc, []).
my_sort(Sorted, Acc, [Head|Tail]) :- insert(Head, Acc, NewAcc), my_sort(Sorted, NewAcc, Tail).
insert(X, [], [X]).
insert(X, [Head|Tail], [X, Head|Tail]) :- X =< Head.
insert(X, [Head|Tail], [Head|NewTail]) :- X > Head, insert(X, Tail, NewTail).
