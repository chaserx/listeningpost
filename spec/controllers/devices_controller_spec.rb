require 'rails_helper'

RSpec.describe DevicesController, type: :controller do
  d_count = 10
  before do
    d_count.times do
      create(:device)
    end
  end

  describe 'index' do
    let(:make_request) { get :index, format: :json }
    it 'responds successfully' do
      make_request
      expect(response).to have_http_status(:ok)
    end

    it 'reports reload count properly' do
      make_request
      expect(assigns[:devices].reload.count).to eq(d_count)
    end
  end

  describe 'create' do
    let(:make_request) {
      post :create, format: :json, device: { name: 'fancy device 13' }
    }

    it 'responds successfully' do
      make_request
      expect(response).to have_http_status(:created)
    end

    it 'creates a new device' do
      expect { make_request }.to change(Device, :count).by(1)
    end
  end

  describe 'destroy' do
    let(:device) { Device.last }
    let(:make_request) { get :destroy, format: :json, id: device.id }

    it 'responds successfully' do
      make_request
      expect(response).to have_http_status(:no_content)
    end

    it 'it removes a single device' do
      make_request
      expect(Device.count).to eq(d_count - 1)
    end
  end

  describe 'show' do
    let(:device) { Device.last }
    let(:make_request) { get :show, format: :json, id: device.id }

    it 'responds successfully' do
      make_request
      expect(response).to have_http_status(:ok)
    end

    it 'returns the requested device' do
      make_request
      expect(assigns(:device)).to eq(device)
    end
  end
end
