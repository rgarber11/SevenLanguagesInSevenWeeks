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
