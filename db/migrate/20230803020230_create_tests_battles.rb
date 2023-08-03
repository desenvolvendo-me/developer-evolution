class CreateTestsBattles < ActiveRecord::Migration[7.0]
  def change
    create_table :tests_battles do |t|
      t.references :test, null: false, foreign_key: true
      t.string :battle
      t.string :milestone_release_link
      t.string :pull_request_release_link

      t.timestamps
    end
  end
end
