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
    vendors_list
  end

end