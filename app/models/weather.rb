class Weather < ApplicationRecord
  validates_presence_of :zip
  validates_presence_of :c_high
  validates_presence_of :c_low
  validates_presence_of :c_current
  validates_presence_of :c_average
  validates_presence_of :f_high
  validates_presence_of :f_low
  validates_presence_of :f_current
  validates_presence_of :f_average
end
