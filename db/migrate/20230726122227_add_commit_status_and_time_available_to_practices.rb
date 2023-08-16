class AddCommitStatusAndTimeAvailableToPractices < ActiveRecord::Migration[7.0]
  def change
    add_column :practices, :commit_status, :string
    add_column :practices, :time_available, :integer
  end
end
