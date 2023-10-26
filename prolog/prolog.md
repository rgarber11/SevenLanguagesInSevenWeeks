# Prolog
----------
## Day 1
Prolog is my first experience with a logic programming language. I remember seeing excerpts of it in my freshman year Discrete Mathematics, where it seemed some foreign, strange thing, solving the propositional logic puzzles that would be on the upcoming test. Seeing it here makes me excited, even if I now rarely have to solve similar logical conundra. Maybe the scheduling example will inspire me. Because of today' knowledge base style do problems, I now have a significant amount of Prolog code, even if none of it is particularly impressive. For now though:
* To create the knowledge base, I used the relations `book()` and `author()` to represent the different members, and then `wrote(X, Y)` for the relations between books and authors.
* After including `books.pl`, in my REPL, I simply ran:
```prolog
| ?- wrote(brandon_sanderson, What).

What = the_way_of_kings ? a

What = words_of_radiance

What = oathbringer

What = rhythm_of_war

yes
```
to get my answer.
* The hardest part of this was getting enough musicians in varied genres and playing different instruments. I didn't include any singleton relationships this time, using `genre(X, Y)` and `instrument(X, Z)` to represent the data. I also learned via a tutorial that atoms can also be made with single quotes, leading to a nicer interface:
```prolog
...
genre('Elizabeth Zeltser', classical).
genre('Eric Clapton', rock).
genre('Ethan Bensdorf', classical).
genre('Fiona Simon', classical).
...
```
Including this in a REPL, I was able to run:
```prolog
| ?- instrument(Who, guitar).

Who = 'Brian May' ? a

Who = 'David Gilmour'

Who = 'Eddie Van Halen'

Who = 'Eric Clapton'

Who = 'Jeff Beck'

Who = 'Jimi Hendrix'

Who = 'Jimmy Page'

Who = 'Sister Rosetta Tharpe'

no
```
and was able to get a nice looking answer for all the guitarists who were in my knowledge base.
## Day 2
Wow, this day was really difficult for me. I guess I'm not overly used to describing these sort of problems in a recursive, declarative, manner. As such, these took me a long time, especially relative to the terseness of the code.
* Reversing was certainly the easiest of the three problems. All it took was understanding the `[Head|Tail]` notation, and noting that the List without its head is equivalent to the reverse list without its last element. The base case is that two empty lists are reverses of each other.
* Finding the smallest element was difficult for me because I didn't really understand the accumulator pattern. I kept getting errors related to `is/2` Now that I understand that the base case is trying to unify the final answer with the final state of the intermediate steps, this problem makes much more sense. It has the working list as its first argument, the middle is the current minimum, and the last is the final minimum. Every time it runs, it removes the head off the list, compares it with the current minimum, and replaces it if its smaller. Then it runs again on the tail. Once it reaches the base case of an empty list, it can unify and generate the final minimum.
* At first, I tried using the code from the second problem to generate a selection sort. This led to a stack overflow when sorting a list of 3 elements. I then implemented insertion sort. This again uses the accumulator pattern, along with insertion code similar to the removal code I made for selection sort (If the head is greater, you just stick it on, if not, you run the same code with the tail). 
