#!/usr/bin/env io
OperatorTable addAssignOperator(":", "atPutNumber")

Map atPutNumber := method(
    self atPut(
        call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
        call evalArgAt(1)
    )
)
        
curlyBrackets := method(
    r := Map clone
    call message arguments foreach(arg,
        r doMessage(arg)
    )
    r
)
Builder := Object clone
Builder tabCount := 0
Builder forward := method(
	tabCount repeat(write("\t"))
	write("<", call message name)
	call message arguments foreach(
		i,
		arg,
		if(i != 0, 
			content := self doMessage(arg); 
			if(content type == "Sequence", 
				tabCount repeat(write("\t")); 
				writeln(content)
			),
			if(arg name == "curlyBrackets",
				m := doMessage(arg);
				m foreach(k, v, write(" ", k, "=\"", v, "\""));
				writeln(">");
				self tabCount := tabCount + 1,
				writeln(">");
				self tabCount := tabCount + 1;
				content := self doMessage(arg);
				if(content type == "Sequence",
					tabCount repeat(write("\t"));
					writeln(content)
				)
			)
		)
		
	)
	self tabCount = self tabCount - 1
	tabCount repeat(write("\t"))
	writeln("</", call message name, ">"))
s := File with("builder.txt") openForReading contents
doString(s)

