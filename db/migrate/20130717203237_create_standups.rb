class CreateStandups < ActiveRecord::Migration
  def change
    create_table :standups do |t|
      t.integer :team_id

      t.timestamps
    end
  end
end
