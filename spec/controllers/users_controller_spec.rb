require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'create' do
    let(:make_request) do
      post :create, format: :json, user: { email: 'me@example.com',
                                           password: 'abc123xyz',
                                           password_confirmation: 'abc123xyz' }
    end

    it 'responds successfully' do
      make_request
      expect(response).to have_http_status(:created)
    end

    it 'creates a new user' do
      expect { make_request }.to change(User, :count).by(1)
    end
  end

  describe 'show' do
    context 'wihtout a valid auth token' do
      let(:user) { create(:user) }

      it 'responds with unauthorized' do
        get :show, id: user.id, format: :json

        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with a valid auth token' do
      before do
        setup_knock do |user|
          @user = user
        end
      end

      it 'responds successfully' do
        get :show, id: @user.id, format: :json
        expect(response).to have_http_status(:ok)
      end

      it 'returns user id' do
        get :show, id: @user.id, format: :json
        expect(JSON.parse(response.body)['id']).to eq(@user.id)
      end

      it 'returns user email' do
        get :show, id: @user.id, format: :json
        expect(JSON.parse(response.body)['email']).to include(@user.email)
      end
    end
  end
end
