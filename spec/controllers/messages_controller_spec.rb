require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  before do
    ip = '192.168.0.1'
    allow_any_instance_of(ActionDispatch::Request).to receive(:remote_ip).
                                                      and_return(ip)
    setup_knock do |user|
      @device = create(:device, user: user)
    end
  end

  let!(:message) { create(:message, device: @device, user: @device.user) }
  let(:device) { message.device }

  describe 'index' do
    let(:make_request) { get :index, device_id: device.id, format: :json }
    it 'responds successfully' do
      make_request
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'create' do
    let(:make_request) do
      post :create, device_id: device.id, format: :json, message: { body: 'holla' }
    end

    it 'responds successfully' do
      make_request
      expect(response).to have_http_status(:created)
    end

    it 'creates a new message' do
      expect { make_request }.to change(Message, :count).by(1)
    end
  end

  describe 'show' do
    let(:message) { create(:message) }
    let(:make_request) do
      get :show, device_id: device.id, format: :json, id: message.id
    end

    it 'responds successfully' do
      make_request
      expect(response).to have_http_status(:ok)
    end

    it 'returns the requested message' do
      make_request
      expect(assigns(:message)).to eq(message)
    end
  end
end
