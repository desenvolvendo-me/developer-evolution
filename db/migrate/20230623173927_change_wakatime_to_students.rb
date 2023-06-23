class ChangeWakatimeToStudents < ActiveRecord::Migration[7.0]
  def change
    rename_column :students, :wakatime_time, :wakatime_activity_average
    add_column :students, :wakatime_activity_total, :integer
  end
end
