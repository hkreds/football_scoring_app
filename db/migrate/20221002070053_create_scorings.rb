class CreateScorings < ActiveRecord::Migration[6.1]
  def change
    create_table :scorings do |t|
      t.integer :customer_id, null: false
      t.integer :match_id, null: false

      t.timestamps
    end
  end
end
