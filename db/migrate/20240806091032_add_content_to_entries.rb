class AddContentToEntries < ActiveRecord::Migration[7.1]
  def change
    add_column :entries, :content, :string
  end
end
