class CreatePreparationsIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :preparations_issues do |t|
      t.string :issue_link
      t.string :pull_request_link
      t.references :preparations_release, null: false, foreign_key: true

      t.timestamps
    end
  end
end
