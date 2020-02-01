class Deck
  attr_accessor :cards, :categories_in_deck
  def initialize(cards= [])
    @cards = cards
    @categories_in_deck = []
  end

  def count
    @cards.length
  end

  def add_card(card)
    @cards << card
  end

  def cards_in_category(category)
    cards.select do |card|
        card.category == category
    end
  end

  def categories_in_deck
    starting_categories = []
    cards.each do |card|
      starting_categories << card.category
    end
    @categories_in_deck = starting_categories.uniq
  end
end
