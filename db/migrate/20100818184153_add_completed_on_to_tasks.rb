class AddCompletedOnToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :completed_on, :datetime
  end

  def self.down
    remove_column :tasks, :completed_on, :datetime
  end

end
