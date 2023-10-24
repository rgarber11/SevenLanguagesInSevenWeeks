#!/usr/bin/env io
squareBrackets := method(
	l := List clone
	call message arguments foreach(arg,
		l append(doMessage(arg))
	)
	l
)
f := [1, 2, 3]
f println
