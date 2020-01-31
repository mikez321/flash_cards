require './lib/card'
require './lib/deck'



  print "Enter a question:  "
  question = gets.chomp

  print "\nEnter the answer:  "
  answer = gets.chomp

  print "\nEnter the category:  "
  category = gets.chomp.capitalize.to_sym

  card = Card.new(question, answer, category)
  deck = Deck.new(card)

  require "Pry"; binding.pry

print "\nEnter another card?  Y/N  "
answer = gets.chomp.upcase

if answer == "Y"
  print "Enter a question:  "
  question = gets.chomp

  print "\nEnter the answer:  "
  answer = gets.chomp

  print "\nEnter the category:  "
  category = gets.chomp.capitalize.to_sym

  card = Card.new(question, answer, category)
  require "Pry"; binding.pry
  deck.add_card(card)
elsif answer == "N"
  print "Let's Do This!"
end




# text = "Press a letter: "
#
# print text
# input = gets.chomp
#
# if input == "y"
# print "YEAS"
# else
#   until input == "y"
#     print text
#     input = gets.chomp
#     if input == "y"
#     print "YEAS"
#     break
#   end
# end
# end
