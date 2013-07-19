class AddAbsentToUpdates < ActiveRecord::Migration
  def change
    add_column :updates, :absent, :boolean, default: false, null: false
    change_column :updates, :duration, :integer, default: 0, null: false
    
    Update.reset_column_information

    Update.all.each do |update|
      if update.duration < 0
        update.duration = 0
        update.absent = true
	update.save
      end
    end
  end
end
