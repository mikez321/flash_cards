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
