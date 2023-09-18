require 'rspec'
require './lib/item'
require './lib/vendor'
require 'pry'

describe Vendor do
  describe "Iteration I" do
    before(:each) do
      @item1 = Item.new({name: 'Peach', price: "$0.75"})
      @item2 = Item.new({name: 'Tomato', price: '$0.50'})
      @vendor = Vendor.new("Rocky Mountain Fresh")
    end

    it 'items exist' do
      expect(@item2.name).to eq("Tomato")
      expect(@item2.price).to eq(0.5)
    end

    it 'vendor exists and starts with empty inventory' do
      expect(@vendor.name).to eq("Rocky Mountain Fresh")
      expect(@vendor.inventory).to eq({})
    end

    it 'can check vendor stock at initial being empty and add item' do
      expect(@vendor.check_stock(@item1)).to eq(0)
      @vendor.stock(@item1, 30)
      expect(@vendor.check_stock(@item1)).to eq(30)
    end

    it 'can add to original stock value' do
      @vendor.stock(@item1, 30)
      @vendor.stock(@item1, 25)
      expect(@vendor.inventory.count).to eq(1)
      expect(@vendor.inventory.class).to eq(Hash)
      expect(@vendor.check_stock(@item1)).to eq(55)
    end

    it 'can add a second item' do
      @vendor.stock(@item1, 30)
      @vendor.stock(@item1, 25)
      @vendor.stock(@item2, 12)
      expect(@vendor.inventory.count).to eq(2)
      expect(@vendor.check_stock(@item1)).to eq(55)
      expect(@vendor.check_stock(@item2)).to eq(12)
    end
  end

#   describe "Iteration II" do

#   end
end
