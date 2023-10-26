smallest(Small, [Head|Tail]) :- smallest(Tail, Head, Small).
smallest([], Min, Min).
smallest([Head|Tail], Min1, Min) :- NewMin is min(Head, Min1), smallest(Tail, NewMin, Min).
