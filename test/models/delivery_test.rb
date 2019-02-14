require 'test_helper'

class DeliveryTest < ActiveSupport::TestCase
  def setup
    Placement.seed
    Delivery.seed
  end
  test "valid delivery" do
    delivery = Delivery.new(placement_id:1, date: Date.strptime("11/1/2017", '%m/%d/%Y'), impressions: 33427)
    assert delivery.valid?
  end
  test "invalid without date" do
    delivery = Delivery.new(placement_id:1 , impressions: 33427 )
    assert !delivery.valid?
  end
  test "invalid without impressions" do
    delivery = Delivery.new(placement_id:1 , date: Date.strptime("11/1/2017", '%m/%d/%Y') )
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
  test "total costs between dates" do
    assert Delivery.between_dates_cost("11/22/2017" , "12/5/2017") == 6061
  end
  test "impressions between dates" do
    assert Delivery.between_dates_impressions("11/22/2017" , "12/5/2017") == 1126785
  end
end
