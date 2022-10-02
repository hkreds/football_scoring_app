class CreateCompetitors < ActiveRecord::Migration[6.1]
  def change
    create_table :competitors do |t|
      t.integer :match_id, null: false
      t.integer :player_id, null: false
      t.integer :position, null: false, default: 0

      t.timestamps
    end
  end
end
