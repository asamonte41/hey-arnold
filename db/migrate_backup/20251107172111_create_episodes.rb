class CreateEpisodes < ActiveRecord::Migration[8.0]
  def change
    create_table :episodes do |t|
      t.string :title
      t.integer :season
      t.integer :episode_number
      t.date :air_date
      t.text :sypnosis

      t.timestamps
    end
  end
end
