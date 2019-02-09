require 'csv'

class Delivery < ApplicationRecord
  extend ActionView::Helpers::NumberHelper
  
  belongs_to :placement
  validates_presence_of(:date, :impressions, :placement_id)
  validates_numericality_of(:impressions, :placement_id)

  def self.seed
    CSV.read("lib/assets/delivery.csv")[1..-1].map{|p| Delivery.find_or_create_by(placement_id: p[0], date: Date.strptime(p[1], '%m/%d/%Y'), impressions: p[2])}
  end

  def self.between_dates(start, finish)
    start_date = Date.strptime(start, '%m/%d/%Y')
    finish_date = Date.strptime(finish, '%m/%d/%Y')
    total_impressions = Delivery.where(date: start_date..finish_date).inject(0){|sum,delivery| sum + delivery.impressions }
    total_impression_cost = Delivery.where(date: start_date..finish_date).inject(0){|sum,delivery| sum + delivery.impressions.to_f/1000 * delivery.placement.cpm }

    puts "Total (#{start}-#{finish}): #{number_with_delimiter(total_impressions)} impressions, $#{number_with_delimiter(total_impression_cost.round)}"
  end
end
