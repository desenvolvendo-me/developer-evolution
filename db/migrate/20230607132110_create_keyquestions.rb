class CreateKeyquestions < ActiveRecord::Migration[7.0]
  def change
    create_table :keyquestions do |t|
      t.string :title
      t.references :purpose, null: false, foreign_key: true

      t.timestamps
    end
  end
end
