class AddTeamIdToCompetitors < ActiveRecord::Migration[6.1]
  def change
    add_column :competitors, :team_id, :integer, null: false
  end
end
