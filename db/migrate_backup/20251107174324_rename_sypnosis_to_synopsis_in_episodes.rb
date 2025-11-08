class RenameSypnosisToSynopsisInEpisodes < ActiveRecord::Migration[7.0]
  def change
    rename_column :episodes, :sypnosis, :synopsis
  end
end
