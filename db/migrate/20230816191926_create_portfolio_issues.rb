class CreatePortfolioIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :portfolio_issues do |t|
      t.references :portfolio_release, null: false, foreign_key: true
      t.string :issue_link
      t.string :pull_request_link

      t.timestamps
    end
  end
end
