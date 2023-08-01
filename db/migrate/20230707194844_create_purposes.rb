class CreatePurposes < ActiveRecord::Migration[7.0]
  def change
    create_table :purposes do |t|
      t.integer :version
      t.integer :time
      t.string :type_question
      t.text :question
      t.text :answer

      t.timestamps
    end
  end
end
