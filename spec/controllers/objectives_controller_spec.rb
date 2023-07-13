require 'rails_helper'
require 'devise'

RSpec.describe ObjectivesController, type: :controller do
  let!(:user) { User.create(email: Faker::Internet.email, password: Faker::Internet.password) }
  let(:student) { FactoryBot.create(:student, user: user) }

  before do
    sign_in user
  end
  context 'Get #index' do
    it 'should get success from index page and render index' do

      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end

    it 'should have any objectives for new users' do
      get :index
      expect(assigns(:objectives)).to eq(user.student.objectives)
    end

    it 'should have more than one objective' do
      objective1 = FactoryBot.create(:objective, student: user.student)
      objective2 = FactoryBot.create(:objective, student: user.student)

      get :index
      expect(assigns(:objectives)).to eq([objective1, objective2])
    end
  end

  describe "GET show" do
    context "when the objective belongs to the current user's student" do
      it "returns a success response" do
        objective = FactoryBot.create(:objective, student: user.student)

        get :show, params: { id: objective.id }
        expect(response).to be_successful
      end

      it "assigns the correct objective to @objective" do
        objective = FactoryBot.create(:objective, student: user.student)

        get :show, params: { id: objective.id }
        expect(assigns(:objective)).to eq(objective)
      end

      it "renders the show template" do
        objective = FactoryBot.create(:objective, student: user.student)

        get :show, params: { id: objective.id }
        expect(response).to render_template("show")
      end
    end
  end

  describe "GET new" do
    it "assigns a new Objective to @objective" do
      get :new
      expect(assigns(:objective)).to be_a_new(Objective)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST create" do
    context "with valid parameters" do
      let(:valid_params) { { objective: { title: "Me tornar fluente na lingua francesa", description: "Estudar frances por meio de aplicativos que ... etc", reason: "Conseguir me comunicar e negociar com pessoas da frança" } } }

      it "creates a new objective" do
        expect {
          post :create, params: valid_params
        }.to change(Objective, :count).by(1)
      end

      it "redirects to objectives_path after successful creation" do
        post :create, params: valid_params
        expect(response).to redirect_to(objectives_path)
      end
    end
  end

  describe "GET edit" do
    it "returns a success response" do
      objective = FactoryBot.create(:objective, student: user.student)
      get :edit, params: { id: objective.id }
      expect(response).to be_successful
    end
  end

  describe "PUT update" do
    let(:objective) { FactoryBot.create(:objective, student: user.student) }

    context "with valid parameters" do
      let(:valid_params) { { title: "New Title" } }

      it "updates the objective" do
        put :update, params: { id: objective.id, objective: valid_params }
        updated_objective = Objective.find(objective.id)
        expect(updated_objective.title).to eq("New Title")
      end

      it "redirects to the objective's show page" do
        put :update, params: { id: objective.id, objective: valid_params }
        expect(response).to redirect_to(objective)
      end
    end
  end

  describe "DELETE destroy" do
    let!(:objective) { FactoryBot.create(:objective, student: user.student) }

    it "destroys the objective" do
      expect {
        delete :destroy, params: { id: objective.id }
      }.to change(Objective, :count).by(-1)
    end

    it "redirects to the objectives index page" do
      delete :destroy, params: { id: objective.id }
      expect(response).to redirect_to(objectives_path)
    end
  end
end
