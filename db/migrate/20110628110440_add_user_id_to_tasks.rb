class AddUserIdToTasks < ActiveRecord::Migration
  def self.up
    alter_table :tasks do |t|
      t.references :user
    end
  end

  def self.down
  end
end
