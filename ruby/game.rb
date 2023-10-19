#!/usr/bin/ruby
print "Welcome to the guessing game! Please select the bounds of the guessing!\nLower Bound: "
lower_bound = gets.to_i
print "Upper Bound: "
upper_bound = gets.to_i
random = rand(lower_bound..upper_bound)
loop_count = 0
print "Alrighty! "
loop do
  print "Guess a number: "
  guess = gets.to_i
  loop_count = loop_count + 1
  if guess < random
    puts "Sorry, you guessed too low!"
  elsif guess > random
    puts "Sorry, you guessed too high!"
  else 
    puts "Correct! Good job, and only in #{loop_count} guesses!"
    break
  end
end

