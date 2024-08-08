class AddLevelToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :level, :integer
    add_check_constraint :users, 'level >= 0 AND level <= 2', name: 'level_range'
  end
end
