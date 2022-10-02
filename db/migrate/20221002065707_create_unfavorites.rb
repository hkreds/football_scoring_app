class CreateUnfavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :unfavorites do |t|
      t.integer :customer_id, null: false
      t.integer :scoring_id, null: false

      t.timestamps
    end
  end
end
