class CreatePlayerScorings < ActiveRecord::Migration[6.1]
  def change
    create_table :player_scorings do |t|
      t.integer :scoring_id, null: false
      t.integer :player_id, null: false
      t.float :score, null: false
      t.string :review

      t.timestamps
    end
  end
end
