class AddAwayTeamIdToMatch < ActiveRecord::Migration[6.1]
  def change
    add_column :matches, :away_team_id, :integer
  end
end
