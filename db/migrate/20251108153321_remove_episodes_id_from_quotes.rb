class RemoveEpisodesIdFromQuotes < ActiveRecord::Migration[8.0]
  def change
    remove_column :quotes, :episodes_id, :integer
  end
end
