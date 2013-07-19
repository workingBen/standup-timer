class User < ActiveRecord::Base
  belongs_to :team
  has_many :updates

  def average_duration
    updates.where("duration > 0").average("duration") or 0
  end
end
