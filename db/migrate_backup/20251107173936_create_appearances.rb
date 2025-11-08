class CreateAppearances < ActiveRecord::Migration[8.0]
  def change
    create_table :appearances do |t|
      t.references :character, null: false, foreign_key: true
      t.references :episode, null: false, foreign_key: true

      t.timestamps
    end
  end
end
