class Standup < ActiveRecord::Base
  belongs_to :team
  has_many :updates
  has_many :participants, through: :updates, source: :user, :conditions => ['updates.absent == false']

  def duration
    (finished_at - created_at)
  end

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

    # finish if we just got the last participant
    finish()
    return nil
  end

  def finish
    unless (self.finished_at)
      self.finished_at = Time.now
      self.save
    end
  end
end
