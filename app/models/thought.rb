class Thought < ApplicationRecord
  # Specify the table name explicitly since it's not following the Rails naming convention
  self.table_name = 'thoughts'

  belongs_to :student
end
