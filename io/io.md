# Io
----------

## Day 1
Io is the language that I know the least about from this book, and also probably the one I was least excited for. While I understand how powerful the message-passing paradigm can be, it feels more limiting than more functional languages, or partially imitated by the traditional "struct with methods" style of OOP. I understand that Io is more famous for its introspection, having some form of homoiconicity, but I think I'd prefer that in a Lisp-style language (We're coming for you Closure) where composition is more obvious. That being said, I haven't really worked much in message-passing languages, so maybe these few days will turn me around.
### Answer Answers
Since this has an Answer section, I'll also give those.
* Io is strongly typed, with every piece of data being associated with a type, and no conversions to `void *`.
* While 0 and "" are true, `nil` is false. I tested this with if statements:
```io
Io> if(0, "true" println, "false" println)
true
==> true
Io> if("", "true" println, "false" println)
true
==> true
Io> if(nil, "true" println, "false" println)
false
==> false
```
* For a given Object, you find what slots its prototype supports with `proto hasSlot` and then checking the list. Alternatively, if you just want to see them, `proto slotNames` gives you a list of all the slots on the prototype.
* `=` compiles to `updateSlot`, which means that it only does assignment, and not declaration. `:=` compiles to `setSlot`. It can create or assign a slot, but does not create a setter. `::=` compiles to `newSlot`, and does everything `:=`, but also adds a setter, allowing for the following syntax:
```io
Vehicle := Object clone do (
    setting ::= 3
)
Vehicle setSetting(4)
```
### Do Answers
For this, I combined both tasks into a single program, called hello.io. This creates an object `prefixer`, and a slot `println`, which takes a Sequence, and prints it using println. I use it to print Hello World in a way more similar to other languages. This probably would be better as a freestanding function, as it doesn't depend on the state of the Object at all, but it still demonstrates the ability for slots to contain methods, and execute with arguments.
