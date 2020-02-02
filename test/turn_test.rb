require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def test_a_turn_has_a_card
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Bears", card)

    assert_equal card, turn.card
  end

  def test_a_turn_has_a_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Bears", card)

    assert_equal "Bears", turn.guess
  end

  def test_turns_can_be_correct_or_not_correct
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn1 = Turn.new("Bears", card)
    turn2 = Turn.new("Juneau", card)

    assert_equal false, turn1.correct?
    assert_equal true,  turn2.correct?
  end

  def test_give_feedback_based_on_correctness
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn1 = Turn.new("Bears", card)
    turn2 = Turn.new("Juneau", card)

    assert_equal "Correct!", turn2.feedback
    assert_equal "Incorrect.", turn1.feedback
  end

end
