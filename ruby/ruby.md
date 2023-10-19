# Ruby 
----------
## Day 1 
Most of these were pretty easy, and similar to their equals in langauges like Python. One interesting thing is the fact that the standard `a..b` range is inclusive, unlike in Python and C++ where [a,b) is the standard. `a...b` gives the uninclusive range. For the game. I decided to go a bit further, allowing to set the upper and lower bounds. `loop do` is also a feature that I'm used to in Rust, and allows for a simple infinite loop.
## Day 2 
Finally, something a bit more interesting! Code blocks as anonymous functions seem so cool, and really a feature that made this section worth it.
* While `each_slice` is certainly more user friendly than `each` in this case, I really like the composability of `with_index.` While it certainly compares to Python's `enumerate(),` the fact that Ruby lets you leave off parentheses really simplifies the syntax, and looks nicer.
* I chose to solve this with class functions, maintaining the original initializer. As such, I used two functions. One of these is only used for children, so I read online how to make it private. One of the issues I find with older dynamic languages is the proliferation of different ways to do similar things (Though as a C++ developer, I feel a bit hypocritical) `private_class_method` and `class << self` along with `private` made me feel a bit bad. However, I'm nitpicking, and I think this solution is still very nice.
* The first grep I think really shows the power of blocks, and the beauty of the Ruby File API. `ARGV[0]` is weird to me. In all languages that I've used, that would be the name of the program, not the first command-line argument. Not too bad of a change though. 
The problem with this grep, however, is that most people have binary files in their folders, which will cause an argument error. I could have solved this with a `begin...rescue...end`, but I also decided to use [ruby-filemagic](https://github.com/blackwinter/ruby-filemagic) to select for only text files. This makes this grep actually usable (even if a recursive option would be needed for me.)
## Day 3

