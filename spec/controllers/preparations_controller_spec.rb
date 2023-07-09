require 'rails_helper'
require 'devise'

RSpec.describe PreparationsController, type: :controller do
  # Incluindo o módulo Devise::Test::ControllerHelpers
  include Devise::Test::ControllerHelpers

  let!(:user) { User.create(email: Faker::Internet.email, password: Faker::Internet.password) }

  before do
    sign_in user
  end


  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      preparation = FactoryBot.create(:preparation)
      get :show, params: { id: preparation.to_param }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new Preparation' do
        expect {
          post :create, params: { preparation: FactoryBot.attributes_for(:preparation) }
        }.to change(Preparation, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'create a new Preparation' do
        expect {
          post :create, params: { preparation: FactoryBot.attributes_for(:preparation, name: nil) }
        }.to change(Preparation, :count)
      end
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      preparation = FactoryBot.create(:preparation)
      get :edit, params: { id: preparation.to_param }
      expect(response).to be_successful
    end
  end

  describe 'PUT #update' do
    let(:preparation) { FactoryBot.create(:preparation) }

    context 'with valid parameters' do
      it 'updates the requested preparation' do
        put :update, params: { id: preparation.to_param, preparation: { name: 'New Name' } }
        preparation.reload
        expect(preparation.name).to eq('New Name')
      end

      it 'redirects to the preparation' do
        put :update, params: { id: preparation.to_param, preparation: { name: 'New Name' } }
        expect(response).to redirect_to(preparation)
      end
    end

    context 'with invalid parameters' do
      it 'does not update the requested preparation' do
        put :update, params: { id: preparation.to_param, preparation: { name: nil } }
        preparation.reload
        expect(preparation.name).not_to be_nil
      end

    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested preparation" do
      preparation = FactoryBot.create(:preparation)
      expect {
        delete :destroy, params: { id: preparation.to_param }
      }.to change(Preparation, :count).by(-1)
    end

    it "redirects to the preparations list" do
      preparation = FactoryBot.create(:preparation)
      delete :destroy, params: { id: preparation.to_param }
      expect(response).to redirect_to(preparations_url)
    end
  end
end