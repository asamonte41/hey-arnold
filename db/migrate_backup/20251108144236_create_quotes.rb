class CreateQuotes < ActiveRecord::Migration[8.0]
  def change
    create_table :quotes do |t|
      t.string :text
      t.references :character, null: false, foreign_key: true
      t.references :episodes, null: false, foreign_key: true

      t.timestamps
    end
  end
end
