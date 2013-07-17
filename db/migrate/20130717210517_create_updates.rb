class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.integer :user_id
      t.integer :standup_id
      t.integer :duration

      t.timestamps
    end
  end
end
