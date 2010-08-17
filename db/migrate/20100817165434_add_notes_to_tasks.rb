class AddNotesToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :notes, :text
  end

  def self.down
    remove_column :tasks, :notes
  end
end
