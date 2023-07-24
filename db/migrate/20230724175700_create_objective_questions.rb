class CreateObjectiveQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :objective_questions do |t|
      t.references :objective, null: false, foreign_key: true
      t.string :type_question
      t.string :description
      t.string :answer

      t.timestamps
    end
  end
end
