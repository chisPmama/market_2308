class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map{|vendor| vendor.name}
  end

  def vendors_that_sell(item)
    vendors_list = @vendors.find_all{|vendor| (vendor.inventory.keys.map{|key| key.name==item.name}).include?(true)}
  end

  def sorted_items_list
    unsorted_items = @vendors.map{|vendor| vendor.inventory.keys.map{|key| key.name}}.flatten
    sorted_items = unsorted_items.uniq.sort
  end

  def total_inventory
    total_inv = {}
    sorted_items_list.each{|item| total_inv[item] = {quantity: 0, vendors: []}}
    sorted_items_list.each{|item|
      vendors_list = []
      vendors_list = @vendors.each do |vendor|
        vendor.inventory.keys.find_all do |key|
          key.name == item
        end
      end

      total_inv[item][:vendors] =  vendors_list.map {|vendor| vendor.name}
    }
    total_inv
## This is a mess. I think the vendors_that_sell and other item arguments should have been by name and not by item object.
## Not sure how to backtrack without going against the Interaction Pattern from Iteration II. Idk, feels really messy. Wish the Interaction Pattern would have been market.vendors_that_sell("Peach") 
## I think I should have made a helper method that was similar but found it per item_name.. :( Got so lost
  end
end