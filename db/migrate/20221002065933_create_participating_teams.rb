class CreateParticipatingTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :participating_teams do |t|
      t.integer :convention_id, null: false
      t.integer :team_id, null: false

      t.timestamps
    end
  end
end
