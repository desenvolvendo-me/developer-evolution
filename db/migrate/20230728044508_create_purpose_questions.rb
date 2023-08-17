class CreatePurposeQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :purpose_questions do |t|
      t.string :type_question
      t.string :description
      t.string :answer
      t.references :purpose, null: false, foreign_key: true

      t.timestamps
    end
  end
end
