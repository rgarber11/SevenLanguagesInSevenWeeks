# Io
----------

## Day 1
Io is the language that I know the least about from this book, and also probably the one I was least excited for. While I understand how powerful the message-passing paradigm can be, it feels more limiting than more functional languages, or partially imitated by the traditional "struct with methods" style of OOP. I understand that Io is more famous for its introspection, having some form of homoiconicity, but I think I'd prefer that in a Lisp-style language (We're coming for you Clojure) where composition is more obvious. That being said, I haven't really worked much in message-passing languages, so maybe these few days will turn me around.
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
## Day 2
Wow, was this a long day! This day brought the amount of code I wrote for Ruby and for Io to near parity. Overall, I think this mostly confirmed my opinion of message-passing languages not really being for me, but at least some of the openness of the platform (like evidenced in changing the '/' operator) does appeal to the tinkerer inside of me.
* These were mostly simple, with setting a base case, followed by either a `repeat` or a `fib()` recursive call. I wouldn't be surprised if there was a way to do this with more introspection, but that seemed a bit much for a problem like this.
* While it took me an embarassingly long time to realize you can save the old functionality of `/` in a different object, after that it was smooth sailing. I think the freedom of such operator overloading really appeals to me. While I know that people really abuse these things, setting them up as something no sane person would assume was an operator, infix notation is natural enough that I do think it deserves ways to be implemented programmatically.
* My answer here feels mostly like cheating, as I do not do it iteratively, but rather with `flatten` and `reduce` as built into the standard library. On the other hand, this makes for very legible and nice code, as opposed to a set of `for` or `foreach` loops as an iterative method would require.
* Thanks to reduce, creating your own arithmetic mean was very easy and nice. While I did not implement my own exception, I will note that the way my code is written raises an exception by default if one of the elements of the list is not of type `Number`. Overall though, Io makes such simple arithmetic operations really easy.
* As Io's list is fairly robust, making a two dimensional list proved fairly easy. The `repeat` keyword allowed easy looping, while using `List` as a prototype made the rest easy. The other way would be to preallocate with `dim`, and then keep x and y as runtime constants, rather than using nil. In principle, my version has no checks for simply adding more space using the traditional list append.
* For transpose, I constructed a new list, rather than redefining the current list. To me, this feels more at home with creating `new_matrix`, as opposed to editing the original list. This did make this problem fairly easy, if with an imperative answer.
* I think Io's file API is pretty fine (though there is no default way to overwrite a file, you delete then rewrite, or rewind, write, then truncate). In terms of format, I chose a simple one, of first writing out `y` on one line, then `x` on one line, then the value of the matrix, each on their own line, working through each nested list. This made it easy to write a compatible `read` api on my `TwoDMatrix` prototype class.
* It's pretty smart to make the `File` and standard I/O APIs homogeneous, and readLine works as expected. Using `loop` made writing the code simple, and I even added the feature that you can choose upper and lower bounds. 
## Day 3
Today's problems were really fun! I like how we've graduated from fairly standard questions to things where Io really shines. As such, I really enjoyed these few problems. 
* Adding in proper indentation wasn't too difficult. We simply keep a variable `tabCount`, which we increment after printing the opening tag, and decrement before the closing tag. Before we print, we first do a `tabCount repeat(write("\t"))`, which sets the correct indentation. This did prove that I need to change my terminal's tabwidth from the default 8 spaces, but aside from that, I think this was a success. (Side note: I normally do use spaces instead of tabs (With the tab key remapped to 4 spaces), but I chose the route with no multiplication for this problem.)
* Creating the list notation was similarly a breath of fresh air. I based my code off of the `curlyBrackets` code in the phonebook example. We create a list, then append each argument, but not before calling `doMessage`.
* Adding the methods was surprisingly difficult, even if a large part of the code is equivalent to the phonebook problem. I used nested if statements, which aren't the most legible. If this was production code, it would've been best to split this up (The `Sequence` printing code is doubled). Another issue I had was that it would only work if entirely in a string, or in a separate file. In hindsight, this makes sense, as `Sequence :` is not defined, but I am embarassed at how much time I spent debugging this specific problem.
----------
My time with Io was not as positive as my time with Ruby. I tend to like sugar, and tend to prefer solutions that rely less of hierarchy, and more on straight composition. On the other hand, I can see why others would like Io. The ability to change syntax so drastically, while having access to futures and coroutines is compelling, and makes it feel like Io would be the perfect language for problems where simple additions constantly need to be added to a robust codebase. In those situations, having these pre-made easy building blocks of syntax would feel like a superpower, if the rest of the project is well architected at least.    
I am probably not going to use Io in the future. The language has too small of a support base, and I am just not enough of a fan to try to push it in other contexts. But I do appreciate the vision, and at least some of the ideas. [@iolanguage](https://twitter.com/iolanguage "Or is it X?") is still active on Twitter, so maybe the language will still have its day in the sun. 
