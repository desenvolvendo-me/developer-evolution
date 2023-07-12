class CreateObjectives < ActiveRecord::Migration[7.0]
  def change
    create_table :objectives do |t|
      t.references :student, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.string :reason

      t.timestamps
    end
  end
end
