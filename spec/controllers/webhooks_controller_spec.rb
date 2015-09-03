require 'rails_helper'

RSpec.describe WebhooksController, type: :controller do
  context 'with an invalid session' do
    let(:device) { create(:device) }
    let!(:webhook) { create(:webhook, device: device, user: device.user) }

    describe 'index' do
      let(:make_request) { get :index, device_id: device.id, format: :json }

      it 'returns unauthorized' do
        make_request
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'create' do
      let(:make_request) do
        post :create, webhook: attributes_for(:webhook), device_id: device.id,
                      format: :json
      end

      it 'responds with unauthorized' do
        make_request
        expect(response).to have_http_status(:unauthorized)
      end

      it 'does not creates a new webhook' do
        expect { make_request }.to change(Webhook, :count).by(0)
      end
    end

    describe 'destroy' do
      let(:make_request) do
        delete :destroy, id: webhook.to_param, device_id: device.id,
                         format: :json
      end

      it 'responds unauthorized' do
        make_request
        expect(response).to have_http_status(:unauthorized)
      end

      it 'it does not remove a single webhook' do
        make_request
        expect(Webhook.count).to eq(1)
      end
    end

    describe 'show' do
      let(:make_request) do
        get :show, id: webhook.to_param, device_id: device.id, format: :json
      end

      it 'responds unauthorized' do
        make_request
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  context 'with a valid session' do
    before do
      setup_knock do |user|
        @device = create(:device, user: user)
      end
    end

    let!(:webhook) { create(:webhook, device: @device, user: @device.user) }

    describe 'GET #index' do
      before do
        get :index, device_id: @device.id, format: :json
      end

      it 'responds successfully' do
        expect(response).to have_http_status(:ok)
      end

      it 'assigns all webhooks as @webhooks' do
        expect(assigns(:webhooks)).to eq([webhook])
      end
    end

    describe 'GET #show' do
      it 'assigns the requested webhook as @webhook' do
        get :show, id: webhook.to_param, device_id: @device.id, format: :json
        expect(assigns(:webhook)).to eq(webhook)
      end
    end

    describe 'POST #create' do
      let(:make_request) do
        post :create, webhook: attributes_for(:webhook), device_id: @device.id,
                      format: :json
      end

      context 'with valid params' do
        it 'creates a new Webhook' do
          expect { make_request }.to change(Webhook, :count).by(1)
        end

        it 'assigns a newly created webhook as @webhook' do
          make_request
          expect(assigns(:webhook)).to be_a(Webhook)
          expect(assigns(:webhook)).to be_persisted
        end
      end

      context 'with invalid params' do
        before do
          invalid_attrs = attributes_for(:webhook).except(:url)
          post :create, webhook: invalid_attrs, device_id: @device.id,
                        format: :json
        end

        it 'returns 422' do
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'assigns a newly created but unsaved webhook as @webhook' do
          expect(assigns(:webhook)).to be_a_new(Webhook)
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        let(:new_attributes) do
          webhook_attrs = attributes_for(:webhook)
          webhook_attrs[:url] = 'https://southard.com'
          webhook_attrs
        end

        before do
          put :update, id: webhook.to_param, webhook: new_attributes,
                       device_id: @device.id, format: :json
        end

        it 'updates the requested webhook' do
          expect(webhook.reload.url).to eq('https://southard.com')
        end

        it 'assigns the requested webhook as @webhook' do
          expect(assigns(:webhook)).to eq(webhook)
        end
      end

      context 'with invalid params' do
        let(:invalid_attributes) do
          webhook_attrs = attributes_for(:webhook)
          webhook_attrs[:url] = nil
          webhook_attrs
        end

        before do
          put :update, id: webhook.to_param, webhook: invalid_attributes,
                       device_id: @device.id, format: :json
        end

        it 'assigns the webhook as @webhook' do
          expect(assigns(:webhook)).to eq(webhook)
        end

        it 'returns 422' do
          expect(response).to have_http_status(422)
        end
      end
    end

    describe 'DELETE #destroy' do
      let(:make_request) do
        delete :destroy, id: webhook.to_param, device_id: @device.id,
                         format: :json
      end

      it 'destroys the requested webhook' do
        expect { make_request }.to change(Webhook, :count).by(-1)
      end

      it 'returns no content' do
        make_request
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
