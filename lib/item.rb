class Item
  attr_reader :name, :price

  def initialize(hash)
    @name = hash[:name]
    @price = hash[:price][1..5].to_f
  end

end

# require 'pry';binding.pry