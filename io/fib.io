#!/usr/bin/env io
fib := method(n, if((n <= 2), 1, fib(n - 2) + fib(n - 1))) 
fibLoop := method(n, 
	if(n <= 2, return 1)
	prev := 1
	curr := 1
	(n-2) repeat( 
		temp := prev + curr
		prev = curr
		curr = temp
	)
	return curr
)
fib(1) println
fib(4) println
fib(3) println
fibLoop(1) println
fibLoop(4) println
fibLoop(3) println
