class Standup < ActiveRecord::Base
  belongs_to :team
  has_many :updates

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
