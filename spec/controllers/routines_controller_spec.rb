require 'rails_helper'

RSpec.describe RoutinesController, type: :controller do
  include Devise::Test::ControllerHelpers

  before do
    # Autenticar um usuário
    @user = create(:user)
    sign_in(@user)
  end

  context "GET #index" do
    it "should redirect to login page if user is not logged in" do
      sign_out(:user)
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end

    it "should render the index page if user is logged in" do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end

    it "should have an empty array" do
      get :index
      expect(assigns(:routines)).to be_empty
    end

    it "should have one routine" do
      create(:routine)
      get :index
      expect(assigns(:routines)).not_to be_empty
    end

    it "should be skipped due to Devise issue", skip: "Devise issue" do
      get :index
      expect(response).to be_successful
      expect(response).to render_template("index")
    end
  end

  context "GET #show" do
    let(:routine) { create(:routine) }

    it "should success and redirect to edit page" do
      get :show, params: { id: routine.id }
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(edit_routine_path(routine))
    end

    it "should have the routine with the specified id" do
      get :show, params: { id: routine.id }
      expect(assigns(:routine)).to eq(routine)
    end
  end

  context "GET #new" do
    it "should success and render the new page" do
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end

    it "should have a new routine" do
      get :new
      expect(assigns(:routine)).to be_a_new(Routine)
    end
  end

  context "POST #create" do
    let(:params) {
      { activity: 'An awesome activity', priority: 'First priority' }
    }
  
    it "should create a new routine" do
      post :create, params: { routine: params }
      new_routine = assigns(:routine) # Obter a rotina criada
      expect(flash[:notice]).to eq("Rotina criada com sucesso.")
      expect(response).to redirect_to(routine_path(new_routine.id)) # Usar routine_path com o ID da rotina
    end
  end
end
