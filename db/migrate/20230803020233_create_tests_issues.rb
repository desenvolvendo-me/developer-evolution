class CreateTestsIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :tests_issues do |t|
      t.references :tests_battle, null: false, foreign_key: true
      t.string :issue_link
      t.string :pull_request_link

      t.timestamps
    end
  end
end
