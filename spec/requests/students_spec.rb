require 'rails_helper'

RSpec.describe 'Students', type: :request do
  let(:student) { FactoryBot.create(:student) }

  before do
    sign_in student.user
  end

  describe 'PATCH /profile/:login' do
    context 'with valid attributes' do
      let(:updated_attributes) { { name: 'Philipe Rodrigues', description_career: 'Controlador de Voo' } }

      it 'updates the student and shows notice' do
        patch profile_path(student), params: { student: updated_attributes }

        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq(I18n.t('student.controller.update'))
        student.reload
        expect(student.name).to eq('Philipe Rodrigues')
        expect(student.description_career).to eq('Controlador de Voo')
      end
    end
  end
end
