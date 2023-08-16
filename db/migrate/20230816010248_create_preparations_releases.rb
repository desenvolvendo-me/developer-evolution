class CreatePreparationsReleases < ActiveRecord::Migration[7.0]
  def change
    create_table :preparations_releases do |t|
      t.string :milestone_release_link
      t.string :pull_request_release_link
      t.references :preparation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
