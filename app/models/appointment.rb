class Appointment < ActiveRecord::Base
  belongs_to :user
  has_many :notifications
  validates :event, presence: true, length: {minimum: 3}
  validates :location, presence: true
end
