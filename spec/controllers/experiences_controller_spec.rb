require 'rails_helper'
require 'devise'

RSpec.describe ExperiencesController, type: :controller do
  let!(:user) { User.create(email: Faker::Internet.email, password: Faker::Internet.password) }

  before do
    sign_in user
  end
  context 'Get #index' do
    it 'should get success from index page and render index' do

      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end

    it 'should have any experience for new users' do
      get :index
      expect(assigns(:experiences)).to eq(user.student.experiences)
    end

    it 'should have more than one experience' do
      experience1 = FactoryBot.create(:experience, student: user.student)
      experience2 = FactoryBot.create(:experience, student: user.student)

      get :index
      expect(assigns(:experiences)).to eq([experience1, experience2])
    end
  end

  context 'Get #show' do

    it 'should have success and render show page' do
      experience = FactoryBot.create(:experience, student: user.student)
      get :show, params: { id: experience.id}
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end

    it 'must have experience after student create an experience' do
      experience = FactoryBot.create(:experience, student: user.student)
      get :show, params: { id: experience.id}
      expect(assigns(:experience)).to be_a(Experience)
    end
  end

  context 'Get #new' do

    it 'should have success and render new page' do
      get :new

      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end

    it 'should have a new experience' do
      get :new

      expect(assigns(:experience)).to be_a(Experience)
      expect(assigns(:experience)).to be_a_new(Experience)
    end
  end

  context 'POST #create' do
    let!(:params) { { student_id: user.student.id, content: Faker::Lorem.paragraph, category:  %w[Medo Dificuldade Aprendizado Insight Feedback].sample, level: rand(1..8), week: rand(1..4) } }

    it 'creates a new experience' do
      post :create, params: { experience: params}
      expect(flash[:notice]).to eq('Experiência cadastrada com sucesso')
      expect(response).to redirect_to(action: :show, id: assigns(:experience).id)
    end

    it 'deny experience with wrong category' do
      invalid_params = params.merge(category: 'test')
      post :create, params: { experience: invalid_params }

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(experiences_path)
      expect(flash[:alert]).to include('Category')
    end

    it 'deny experience with wrong level' do
      invalid_params = params.merge(level: rand(9..99999))
      post :create, params: { experience: invalid_params }

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(experiences_path)
      expect(flash[:alert]).to include('Level')
    end

    it 'deny experience with wrong week value' do
      invalid_params = params.merge(week: rand(5..99999))
      post :create, params: { experience: invalid_params }

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(experiences_path)
      expect(flash[:alert]).to include('Week')
    end
  end
end