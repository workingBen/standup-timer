class Standup < ActiveRecord::Base
  belongs_to :team
  has_many :updates
  has_many :participants, through: :updates, source: :user, :conditions => ['updates.duration > 0']


  def next_participant
    users = team.users
    updates = self.updates

    users.each do |user|
      has_update = false
      updates.each do |existing_update|
        has_update = true if user.id == existing_update.user_id
      end
      return user unless has_update
    end

    return nil
  end
end
