class RemoveStringFromMicroGoals < ActiveRecord::Migration[7.0]
  def change
    remove_column :micro_goals, :string, :string
  end
end
