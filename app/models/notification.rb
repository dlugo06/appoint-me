class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :appointment
  validates :appointment, presence: true
end
