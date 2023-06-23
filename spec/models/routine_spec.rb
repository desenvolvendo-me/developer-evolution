# == Schema Information
#
# Table name: routines
#
#  id              :bigint           not null, primary key
#  activity        :string
#  day_of_the_week :integer
#  hour            :time
#  priority        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  student_id      :bigint           not null
#
# Indexes
#
#  index_routines_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
require 'rails_helper'

RSpec.describe Routine, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  context "Validate routine activity" do
    
    it "it is valid" do
      #student = FactoryBot.create(:student)
      
      routine = FactoryBot.create(:routine)
      #routine = Routine.new(activity: 'First activity', priority: '1')
      expect(routine).to be_valid
    end
    
    it "it is not valid" do
      routine = Routine.new(priority: '1')
      expect(routine).to_not be_valid
    end

    it 'it can not be blank' do
      routine = Routine.new(activity: nil)
      routine.valid?
      expect(routine.errors[:activity]).to include("can't be blank")
    end
  end
    context "Validate routine priority" do
      it "it is valid" do
        routine = FactoryBot.create(:routine)
        expect(routine).to be_valid
      end
      
      it "it is not valid" do
        routine = Routine.new(activity: 'First activity')
        expect(routine).to_not be_valid
      end

      it 'it can not be blank' do
        routine = Routine.new(priority: nil)
        routine.valid?
        expect(routine.errors[:priority]).to include("can't be blank")
      end
    end
    
    context "Validate routine student" do
      it "is not valid without a student" do
        routine = Routine.new(activity: 'First activity', priority: '1', student: nil)
        routine.valid?
        expect(routine.errors[:student]).to include("must exist")
      end

      it "is valid with a student" do
        student = FactoryBot.create(:student)
        routine = Routine.new(activity: 'First activity', priority: '1', student: student)
        expect(routine).to be_valid
      end
    end
end