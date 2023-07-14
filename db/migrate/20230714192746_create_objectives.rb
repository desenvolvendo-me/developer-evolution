class CreateObjectives < ActiveRecord::Migration[7.0]
  def change
    create_table :objectives do |t|
      t.string :title
      t.text :reason
      t.text :people_involved
      t.text :resources
      t.text :expected_results
      t.text :achieved
      t.text :metrics
      t.date :max_deadline
      t.date :min_deadline
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
