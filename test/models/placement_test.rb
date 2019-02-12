require 'test_helper'

class PlacementTest < ActiveSupport::TestCase
  test "valid placement" do
    placement = Placement.new(name: "Sports", start: Date.strptime("11/1/2017", '%m/%d/%Y') , end: Date.strptime("11/30/2017", '%m/%d/%Y') , cpm: 5)
    assert placement.valid?
  end
  test "invalid without name" do
    placement = Placement.new(start: Date.strptime("11/1/2017", '%m/%d/%Y') , end: Date.strptime("11/30/2017", '%m/%d/%Y') , cpm: 5)
    assert !placement.valid?
  end
  test "invalid without start" do
    placement = Placement.new(name: "Sports", end: Date.strptime("11/30/2017", '%m/%d/%Y') , cpm: 5)
    assert !placement.valid?
  end
  test "invalid without end" do
    placement = Placement.new(name: "Sports", start: Date.strptime("11/1/2017", '%m/%d/%Y') , cpm: 5)
    assert !placement.valid?
  end
  test "invalid without cpm" do
    placement = Placement.new(name: "Sports", start: Date.strptime("11/1/2017", '%m/%d/%Y') , end: Date.strptime("11/30/2017", '%m/%d/%Y'))
    assert !placement.valid?
  end

  test "self seeding" do
    placements = Placement.seed.count
    assert placements == 4
  end
end
