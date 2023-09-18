require './lib/item'

class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def stock(item, quantity)
    return @inventory[item] = quantity if @inventory[item] == nil
    @inventory[item] += quantity
  end

  def check_stock(item)
    return 0 if @inventory[item] == nil
    @inventory[item]
  end

end

# require 'pry';binding.pry