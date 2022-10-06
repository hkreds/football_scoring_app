class AddUniformNumberToCompetitors < ActiveRecord::Migration[6.1]
  def change
    add_column :competitors, :uniform_number, :integer, null: false
  end
end
