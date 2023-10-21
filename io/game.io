#!/usr/bin/env io
"Select lower bound: " print
lower := File standardInput readLine asNumber
"Select upper bound: " print
upper := File standardInput readLine asNumber
ans := Random value(lower, upper) round
prev := nil
loop(
	"Guess: " print
	guess := File standardInput readLine asNumber
	if(guess == ans, break, 
		if(prev != nil,
			if(((ans - prev) abs) > ((ans - guess) abs), "hotter" println, "colder" println)	
		)
		prev = guess
	)
)
"Congrats, you guessed correctly!" println
