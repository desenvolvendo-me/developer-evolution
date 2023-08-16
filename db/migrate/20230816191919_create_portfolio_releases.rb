class CreatePortfolioReleases < ActiveRecord::Migration[7.0]
  def change
    create_table :portfolio_releases do |t|
      t.references :portfolio, null: false, foreign_key: true
      t.string :milestone_release_link
      t.string :pull_request_release_link

      t.timestamps
    end
  end
end
