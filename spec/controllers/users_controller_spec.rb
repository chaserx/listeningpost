require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'create' do
    let(:make_request) {
      post :create, format: :json, user: { email: 'me@example.com',
                                           password: 'abc123xyz',
                                           password_confirmation: 'abc123xyz' }
    }

    it 'responds successfully' do
      make_request
      expect(response).to have_http_status(:created)
    end

    it 'creates a new user' do
      expect { make_request }.to change(User, :count).by(1)
    end
  end
end
