class CreateCourseBasics < ActiveRecord::Migration[7.0]
  def change
    create_table :course_basics do |t|
      t.string :link_course
      t.string :link_repository
      t.string :link_certified
      t.string :avaliation_course
      t.string :avaliation_apprenticeship
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
