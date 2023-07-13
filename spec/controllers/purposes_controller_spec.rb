require 'rails_helper'
require 'devise'

RSpec.describe PurposesController, type: :controller do
  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new purpose' do
        purpose_params = { version: 1, time: 10, type_question: 'Por quê?', question: 'Qual é a sua motivação?', answer: 'Minha motivação é...' }

        expect {
          post :create, params: { purpose: purpose_params }
        }.to change(Purpose, :count).by(1)

        expect(response).to redirect_to(assigns(:purpose))
        expect(flash[:notice]).to eq('Purpose was successfully created.')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new purpose' do
        purpose_params = { version: nil, time: 10, type_question: 'Por quê?', question: 'Qual é a sua motivação?', answer: 'Minha motivação é...' }

        expect {
          post :create, params: { purpose: purpose_params }
        }.not_to change(Purpose, :count)

        expect(response).to render_template(:new)
      end
    end
  end
end
