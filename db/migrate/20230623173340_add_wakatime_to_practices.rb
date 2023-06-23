class AddWakatimeToPractices < ActiveRecord::Migration[7.0]
  def change
    add_column :practices, :activity_total, :integer
    add_column :practices, :activity_date, :date
  end
end
