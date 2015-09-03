require 'rails_helper'

RSpec.describe DevicesController, type: :controller do
  context 'without a valid auth token' do
    describe 'index' do
      let(:make_request) { get :index, format: :json }

      it 'returns unauthorized' do
        make_request
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'create' do
      let(:make_request) do
        post :create, format: :json, device: { name: 'fancy device 13' }
      end

      it 'responds with unauthorized' do
        make_request
        expect(response).to have_http_status(:unauthorized)
      end

      it 'does not creates a new device' do
        expect { make_request }.to change(Device, :count).by(0)
      end
    end

    describe 'destroy' do
      let(:device) { create(:device) }
      let(:make_request) { get :destroy, format: :json, id: device.id }

      it 'responds unauthorized' do
        make_request
        expect(response).to have_http_status(:unauthorized)
      end

      it 'it does not remove a single device' do
        make_request
        expect(Device.count).to eq(1)
      end
    end

    describe 'show' do
      let(:device) { create(:device) }
      let(:make_request) { get :show, format: :json, id: device.id }

      it 'responds unauthorized' do
        make_request
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  context 'with a valid auth token' do
    d_count = 10
    before do
      setup_knock do |user|
        d_count.times do
          create(:device, user: user)
        end
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
      let(:make_request) do
        post :create, format: :json, device: { name: 'fancy device 13' }
      end

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

    describe 'receive_message' do
      let(:device) { Device.last }
      let(:make_request) do
        post :receive_message, id: device.id, format: :json,
                               message: { body: 'holla' }
      end

      it 'responds successfully' do
        make_request
        expect(response).to have_http_status(:created)
      end

      it 'creates a new message' do
        expect { make_request }.to change(Message, :count).by(1)
      end
    end
  end
end
