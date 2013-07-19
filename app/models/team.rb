class Team < ActiveRecord::Base
  has_many :users
  has_many :standups

  def recent_standups
    standups.order('created_at DESC').limit(5)
  end
end
