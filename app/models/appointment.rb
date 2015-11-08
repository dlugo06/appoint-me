class Appointment < ActiveRecord::Base
  belongs_to :user
  validates :event, presence: true, length: {minimum: 3}
  validates :location, presence: true
end
