require 'rails_helper'

RSpec.describe MicroGoalsController, type: :controller do
  let!(:user) { User.create(email: Faker::Internet.email, password: Faker::Internet.password) }

  before do
    sign_in user
  end

  context "GET #index" do
    #let!(:micro_goals) { create_list(:micro_goal, 2) }
    #debugger

    it "should success and render index template" do
      
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end

    it "should be an empty array" do
      get :index
      expect(assigns(:micro_goals)).to be_empty
    end

    it "assigns all micro_goals as @micro_goals" do
      micro_goal1 = FactoryBot.create(:micro_goal, student: user.student)
      micro_goal2 = FactoryBot.create(:micro_goal, student: user.student)

      get :index
      expect(assigns(:micro_goals)).to eq([micro_goal1, micro_goal2])
    end
  end

  context "GET #show" do
    let(:micro_goal) { create(:micro_goal, student: user.student)}
    it "should success and render to edit page" do
      get :show, params: { id: micro_goal.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end

    it "When have an id" do
      get :show, params: {id: micro_goal.id}
      expect(assigns(:micro_goal)).to be_a(MicroGoal)
      expect(assigns(:micro_goal)).to eq(micro_goal) # It is just another way to write the above line.
    end  
  end

  context "GET #new" do # It is an 'instance method', for 'class method' it is going to be '.new'.
    it "should success and render to new page" do
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end

    it "should new micro_goal" do
      get :new
      expect(assigns(:micro_goal)).to be_a(MicroGoal)
      expect(assigns(:micro_goal)).to be_a_new(MicroGoal)
    end  
  end

  context "POST #create" do
    let!(:params) {
      { student_id: user.student.id, micro_goal: Faker::Lorem.sentence,
        task: Faker::Lorem.sentence, start_date: Faker::Date.backward(days: 7),
        end_date: Faker::Date.forward(days: 7), percentage: rand(0.0..100.0).round(2) }
    }
    #debugger
    it "creates a new micro_goal" do
      post :create, params: { micro_goal: params }
      expect(flash[:notice]).to eq("micro_goal created successfully.")
      expect(response).to redirect_to(action: :show, id: assigns(:micro_goal).id)
    end

    it "not create a new micro_goal" do
      post :create, params: { micro_goal: { invalid_param: 'Invalid' } }
      expect(flash[:notice]).to be_nil
      expect(response).to render_template(:new)
    end
  end
  
  context 'PUT #update' do
    let!(:micro_goal) { FactoryBot.create(:micro_goal, student: user.student) }
    let(:task) { Faker::Lorem.paragraph }
  
    it 'should update micro_goal content' do
      new_content = Faker::Lorem.paragraph
      params = { id: micro_goal.id, micro_goal: { micro_goal: new_content } }
      put :update, params: params
      micro_goal.reload
  
      expect(micro_goal.micro_goal).to eq(new_content)
      expect(flash[:notice]).to eq('Micro-meta atualizada com sucesso.')
      expect(response).to redirect_to(action: :show, id: micro_goal.id)
    end

     it 'must not update experience content' do
       old_content = micro_goal.micro_goal
       params = { id: micro_goal.id, micro_goal: { content: nil } }
       put :update, params: params
       micro_goal.reload

       expect(micro_goal.micro_goal).to eq(old_content)
       expect(response).to redirect_to(action: :show, id: assigns(:micro_goal).id)
     end
  end
end
