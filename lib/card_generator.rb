class CardGenerator
  attr_reader :file, :created_cards
  def initialize(file)
    @file = file
    @created_cards = []
  end

  def cards
    template = File.open(file)
    until template.eof?
      line = template.readline.split","
      line[1].to_sym
      line[2] = line[2].chomp
      card = Card.new(line[0],line[1],line[2])
      @created_cards << card
    end
    created_cards
  end


end


# From: /Users/mike/turing/mod1/projects/flash_cards/lib/card_generator.rb @ line 14 CardGenerator#cards:
#
#     12: def cards
#     13:   cards = []
#  => 14:   require "Pry"; binding.pry
#     15:   File.open("cards.txt").read.split"\n"
#     16:
#     17: end
#
# [1] pry(#<CardGenerator>)> filename = "cards.txt"
# => "cards.txt"
# [2] pry(#<CardGenerator>)> card_template = File.open(filename)
# => #<File:cards.txt>
# [3] pry(#<CardGenerator>)> each_card = card_template.readline.split","
# => ["What is 5 + 5?", "10", "STEM\n"]
# [4] pry(#<CardGenerator>)> each_card[0]
# => "What is 5 + 5?"
# [5] pry(#<CardGenerator>)> each_card[1]
# => "10"
# [6] pry(#<CardGenerator>)> each_card[2]
# => "STEM\n"
# [7] pry(#<CardGenerator>)> each_card[2].pop
# NoMethodError: undefined method `pop' for "STEM\n":String
# from (pry):7:in `cards'
# [8] pry(#<CardGenerator>)> each_card[2].delete"\n"
# => "STEM"
# [9] pry(#<CardGenerator>)> card = Card.new(each_card[0], each_card[1], each_card[2])
# => #<Card:0x00007fbd75a76bf8 @answer="10", @category="STEM\n", @question="What is 5 + 5?">
