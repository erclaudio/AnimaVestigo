class AddScoreToEntries < ActiveRecord::Migration[7.1]
  def change
    add_column :entries, :score, :integer
  end
end
