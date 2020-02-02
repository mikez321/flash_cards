require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/card_generator'



class RoundTest < Minitest::Test
  def test_it_exists
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards

    assert_instance_of Array, cards
  end

  def test_it_can_automatically_make_cards
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards

    assert_equal 4, cards.length
  end


end
