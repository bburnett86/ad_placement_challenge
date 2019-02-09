require 'csv'

class Placement < ApplicationRecord
  extend ActionView::Helpers::NumberHelper

  has_many :deliveries
  validates_presence_of(:name, :start, :end, :cpm)
  validates_numericality_of(:cpm)
  validates_associated :deliveries

  def self.seed
    CSV.read("lib/assets/placements.csv")[1..-1].map{|p| Placement.find_or_create_by(id: p[0], name: p[1], start: Date.strptime(p[2], '%m/%d/%y'), end: Date.strptime(p[3], '%m/%d/%y'), cpm: p[4])}
  end

  def self.total_impressions
    Placement.all.each do |placement|
      total = placement.deliveries.inject(0){|sum,delivery| sum + delivery.impressions }
      final_cost = total.to_f/1000 * placement.cpm

      puts "#{placement.name} (#{(placement.start).strftime("%m/%d/%Y")}-#{(placement.end).strftime("%m/%d/%Y")}): #{number_with_delimiter(total)} impressions @ $ #{placement.cpm} CPM = $#{number_with_delimiter(final_cost.round)}"
    end
  end
end
