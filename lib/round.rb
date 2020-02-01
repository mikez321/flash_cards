class Round
  attr_reader :deck, :turns, :card_number, :number_correct
  def initialize(deck)
    @deck = deck
    @turns = []
    @card_number = 0
    @number_correct = 0
    @categories = []
  end

  def start

    system "clear"
    puts "Welcome! You're playing with #{deck.cards.length} cards."
    puts "-------------------------------------------------------------------"
    puts "This is card number #{card_number + 1} of #{deck.cards.length}."
    puts "Question: #{current_card.question}"
    print " Answer: "
    guess = gets.chomp
    take_turn(guess)
  end

  def current_card
    deck.cards[card_number]
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @card_number += 1
    puts new_turn.feedback
      if new_turn.correct?
        @number_correct += 1
      end
      if (turns.length) == deck.cards.length
        finish
      else
      puts "This is card number #{card_number + 1} of #{deck.cards.length}."
      puts "Question: #{current_card.question}"
      print " Answer: "
      guess = gets.chomp
      take_turn(guess)
    end
  end

  def number_correct_by_category(category)
    correct_in_category = 0
    turns.each do |turn|
      if turn.card.category == category && turn.correct?
        correct_in_category += 1
      end
    end
    correct_in_category
  end

  def percent_correct
    total = turns.length.to_f
    percent = (number_correct.to_f / total) * 100
    percent
  end

  def percent_correct_by_category(category)
     category_total = 0
     correct_in_category = 0
     turns.each do |turn|
       if turn.card.category == category && turn.correct?
         correct_in_category += 1
       end

       if turn.card.category == category
         category_total += 1
       end
     end

     percent_correct = (correct_in_category.to_f / category_total.to_f) * 100
     percent_correct
  end

  def finish
    puts "****** Game over! ******"
    puts "You had #{number_correct} out of #{deck.cards.length} for a total score of #{percent_correct}%"
    deck.categories.each do |category|
      puts "#{category.to_s} - #{percent_correct_by_category(category)}% correct"
    end
  end
end
