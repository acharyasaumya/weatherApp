# spec/controllers/users_controller_spec.rb
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new user and redirects to weather search page' do
        post :create, params: { user: { username: 'John', password: 'password' } }
        expect(response).to redirect_to(new_weather_path)
      end
    end

    context 'with invalid attributes' do
      it 're-renders the new template' do
        post :create, params: { user: { username: nil, password: 'password' } }
        expect(response).to render_template(:new)
      end
    end
  end
end
