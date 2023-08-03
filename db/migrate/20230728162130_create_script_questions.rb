class CreateScriptQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :script_questions do |t|
      t.text :description
      t.string :category
      t.references :script, null: false, foreign_key: true

      t.timestamps
    end
  end
end
