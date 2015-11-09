class Appointment < ActiveRecord::Base
  belongs_to :user
  has_many :notifications
  validates :event, presence: true, length: {minimum: 3}
  validates :location, presence: true


  def find_user_from_appointment(appointment)
    User.find(appointment.user_id)
  end
end
