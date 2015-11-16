class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :appointment
  validates :appointment, presence: true
  before_save :set_time

  def am_or_pm
    if time.hour < 12
      return "AM"
    else
      return "PM"
    end
  end

  def formatted_date
    dayweek = time.strftime("%a")
    daymonth = time.strftime("%d")
    year = time.year
    hour = time.strftime("%I")
    minute = time.strftime("%M")
    month = time.strftime("%b")

    "#{dayweek}, #{daymonth} #{month} #{year} at #{hour}:#{minute} #{am_or_pm}"
  end

  def number
  end

  def multiplier
  end

  def set_time
    raise
  end
end
