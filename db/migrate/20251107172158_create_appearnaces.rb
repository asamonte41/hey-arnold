class CreateAppearnaces < ActiveRecord::Migration[8.0]
  def change
    create_table :appearnaces do |t|
      t.references :character, null: false, foreign_key: true
      t.references :episode, null: false, foreign_key: true

      t.timestamps
    end
  end
end
