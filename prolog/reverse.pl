my_reverse([], []). 
my_reverse([Head|Tail], RevList) :- my_reverse(Tail, ReverseT), [ReverseT|Head] = RevList.
