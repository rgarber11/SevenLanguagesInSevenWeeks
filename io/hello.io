#!/usr/bin/env io
prefixer := Object clone do (
 println ::= method(str, str println)
)
prefixer println("Hello World")

