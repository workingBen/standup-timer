class AddFinishedAtToStandups < ActiveRecord::Migration
  def change
    add_column :standups, :finished_at, :datetime
  end
end
