#!/usr/bin/env io
addUp := method(arr, flatten(arr) reduce(+))
TwoDArr := list clone do(
	dim := method(x, y, 
		y repeat(
			temp := list clone
			x repeat(temp append(nil))
			self append(temp)
		)
	)
	set := method(x,y,value, 
		self at(x) atPut(y, value)
	)
	get := method(x,y,
		self at(x) at(y)
	)
	transpose := method(
		returner := self clone 
		returner dim((self size), (self at(0) size))
		self foreach(i, l, l foreach(j, v, returner set(j, i, v)))
		return returner
	)
	write := method(filename,
		file := File clone openForUpdating(filename)
		file remove
		file = File clone openForUpdating(filename)
		file rewind
		file write((self size asString), "\n")
		file write(((self at(0) size) asString), "\n")
		self foreach(l, l foreach(v, (file write(v asString, "\n"))))
		file close
	)
	read := method(filename,
		file := File clone openForReading(filename)
		y := file readLine asNumber
		x := file readLine asNumber
		self dim(x, y)
		for(i,0,y-1,
			for(j, 0,x-1,
				contents := file readLine
				if(contents == "nil", set(i, j, nil), set(i, j, (contents asNumber)))
			)
		)
		file close
	)
)
matrix := TwoDArr clone
matrix dim(2,2)
matrix set(0,0,1)
matrix set(0,1,1)
matrix get(0, 1) println
new_matrix := matrix transpose
matrix type println
new_matrix type println
new_matrix get(0, 1) println
new_matrix get(1, 0) println
matrix println
new_matrix println
matrix write("Hello.out")
other_matrix := TwoDArr clone
other_matrix read("Hello.out")
other_matrix println
