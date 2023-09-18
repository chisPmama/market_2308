require './lib/item'
require './lib/vendor'
require './lib/market'
require 'pry'
require 'rspec'

describe Market do
  describe "Iteration II Part 1" do
    before(:each) do
      @market = Market.new("South Pearl Street Farmers Market")  
      @item1 = Item.new({name: 'Peach', price: "$0.75"})
      @item2 = Item.new({name: 'Tomato', price: '$0.50'})
      @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      @vendor = Vendor.new("Rocky Mountain Fresh")
      @vendor1.stock(@item1, 35)   
      @vendor1.stock(@item2, 7)
      @vendor2 = Vendor.new("Ba-Nom-a-Nom")   
      @vendor2.stock(@item4, 50)    
      @vendor2.stock(@item3, 25)
      @vendor3 = Vendor.new("Palisade Peach Shack")  
      @vendor3.stock(@item1, 65)  
    end

    it 'exists when creating market with no vendors' do
      expect(@market).to be_a Market
      expect(@market.name).to eq("South Pearl Street Farmers Market")
      expect(@market.vendors).to eq ([])
    end

    it 'can stock items for Vendor 1' do
      expect(@vendor1.check_stock(@item1)).to eq(42)
    end

    it 'can stock items for Vendor 2' do
      expect(@vendor2.inventory.count).to eq(2)
      expect(@vendor2.check_stock(@item4)).to eq(50)
      expect(@vendor2.check_stock(@item3)).to eq(25)
    end

    it 'can stock items for Vendor 3' do
      expect(@vendor3.inventory.count).to eq(1)
      expect(@vendor2.check_stock(@item1)).to eq(65)
    end

  end
  describe "Iteration II Part 2" do
    before(:each) do
      @market = Market.new("South Pearl Street Farmers Market")  
      @item1 = Item.new({name: 'Peach', price: "$0.75"})
      @item2 = Item.new({name: 'Tomato', price: '$0.50'})
      @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
      @vendor = Vendor.new("Rocky Mountain Fresh")
      @vendor1.stock(@item1, 35)   
      @vendor1.stock(@item2, 7)
      @vendor2 = Vendor.new("Ba-Nom-a-Nom")   
      @vendor2.stock(@item4, 50)    
      @vendor2.stock(@item3, 25)
      @vendor3 = Vendor.new("Palisade Peach Shack")  
      @vendor3.stock(@item1, 65) 
      @market.add_vendor(@vendor1) 
      @market.add_vendor(@vendor2) 
      @market.add_vendor(@vendor3) 
    end

    it 'can add vendors to the market' do
      expect(@market.vendors).to eq([@vendor1,@vendor2,@vendor3])
    end

    it 'can return vendor names' do
      expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end

    it 'can return vendors that sell specific items (Item 1)' do
      expect(@market.vendors_that_sell(@item1).count).to eq(2)
      expect(@market.vendors_that_sell(@item1)).to eq([@vendor1,@vendor3])
    end

    it 'can return vendors that sell specific items (Item 4)' do
      expect(@market.vendors_that_sell(@item4).count).to eq(1)
      expect(@market.vendors_that_sell(@item4)).to eq([@vendor2])
    end

    it 'can return potential revenue' do
      expect(@vendor1.potential_revenue).to eq(29.75)
      expect(@vendor2.potential_revenue).to eq(345.00)
      expect(@vendor3.potential_revenue).to eq(48.75)
    end
  end


  end
end