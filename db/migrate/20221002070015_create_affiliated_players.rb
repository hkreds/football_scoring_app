class CreateAffiliatedPlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :affiliated_players do |t|
      t.integer :player_id, null: false
      t.integer :team_id, null: false
      t.integer :uniform_number
      t.integer :position, null: false, default: 0

      t.timestamps
    end
  end
end
