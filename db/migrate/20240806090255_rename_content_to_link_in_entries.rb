class RenameContentToLinkInEntries < ActiveRecord::Migration[7.1]
  def change
    rename_column :entries, :content, :link
  end
end
