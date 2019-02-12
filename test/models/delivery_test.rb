require 'test_helper'

class DeliveryTest < ActiveSupport::TestCase
  def setup
    @p1 = Placement.create!(id: 1, name: "Sports", start: Date.strptime("11/1/17", '%m/%d/%y') , end: Date.strptime("11/30/2017", '%m/%d/%y') , cpm: 5)
    @p2 = Placement.create!(id: 2, name: "Business", start: Date.strptime("12/1/17", '%m/%d/%y') , end: Date.strptime("12/31/17", '%m/%d/%y') , cpm: 8)
    @p3 = Placement.create!(id: 3, name: "Travel", start: Date.strptime("11/1/17", '%m/%d/%y') , end: Date.strptime("11/30/17", '%m/%d/%y') , cpm: 5)
    @p4 = Placement.create!(id: 4, name: "Sports", start: Date.strptime("12/1/17", '%m/%d/%y') , end: Date.strptime("12/30/17", '%m/%d/%y') , cpm: 5)
  end
  test "valid delivery" do
    delivery = Delivery.new(placement: @p1, date: Date.strptime("11/1/2017", '%m/%d/%Y'), impressions: 33427)
    assert delivery.valid?
  end
  test "invalid without date" do
    delivery = Delivery.new(placement: @p1 , impressions: 33427 )
    assert !delivery.valid?
  end
  test "invalid without impressions" do
    delivery = Delivery.new(placement: @p1 , date: Date.strptime("11/1/2017", '%m/%d/%Y') )
    assert !delivery.valid?
  end
  test "invalid without placement" do
    delivery = Delivery.new( date: Date.strptime("11/1/2017", '%m/%d/%Y') , impressions: 33427 )
    assert !delivery.valid?
  end
  test "self seeding" do
    delivery_count = Delivery.seed.count
    assert delivery_count == 122
  end
  # test "total costs between dates" do
  #   Delivery.seed
  #   puts Delivery.between_dates_cost("11/22/2017" , "12/5/2017")
  #   assert Delivery.between_dates_cost("11/22/2017" , "12/5/2017") == 6061
  # end
  test "impressions between dates" do
    Delivery.seed
    assert Delivery.between_dates_impressions("11/22/2017" , "12/5/2017") == 1126785
  end
end
