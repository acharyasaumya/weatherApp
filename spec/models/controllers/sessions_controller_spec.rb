# spec/controllers/sessions_controller_spec.rb
require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST #create' do
    context 'with valid credentials' do
      it 'signs in the user and redirects to weather search page' do
        user = User.create!(username: 'John', password_digest: Digest::SHA256.hexdigest('password'))
        post :create, params: { username: 'John', password: 'password' }
        expect(session[:user_id]).to eq(user.id)
        expect(response).to redirect_to(new_weather_path)
      end
    end

    context 'with invalid credentials' do
      it 're-renders the new template' do
        post :create, params: { username: 'John', password: 'wrong_password' }
        expect(response).to render_template(:new)
      end
    end
  end
end
