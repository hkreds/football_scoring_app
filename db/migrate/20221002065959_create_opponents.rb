class CreateOpponents < ActiveRecord::Migration[6.1]
  def change
    create_table :opponents do |t|
      t.integer :match_id, null: false
      t.integer :home_team_id, null: false
      t.integer :away_team_id, null: false

      t.timestamps
    end
  end
end
