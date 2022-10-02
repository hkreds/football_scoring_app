class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :abbreviation, null: false
      t.string :manager

      t.timestamps
    end
  end
end
