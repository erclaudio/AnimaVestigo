class RenameLinkToContentInEntries < ActiveRecord::Migration[7.1]
  def change
    rename_column :entries, :link, :content
  end
end