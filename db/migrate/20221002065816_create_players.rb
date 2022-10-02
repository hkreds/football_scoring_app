class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.date :birthday
      t.integer :height
      t.integer :weight

      t.timestamps
    end
  end
end
