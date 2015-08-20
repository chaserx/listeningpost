require 'rails_helper'

RSpec.describe WebhooksController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/devices/abc123/webhooks').to route_to('webhooks#index', device_id: 'abc123')
    end

    it 'routes to #show' do
      expect(get: '/devices/abc123/webhooks/1').to route_to('webhooks#show', id: '1', device_id: 'abc123')
    end

    it 'routes to #create' do
      expect(post: '/devices/abc123/webhooks').to route_to('webhooks#create', device_id: 'abc123')
    end

    it 'routes to #update via PUT' do
      expect(put: '/devices/abc123/webhooks/1').to route_to('webhooks#update', id: '1', device_id: 'abc123')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/devices/abc123/webhooks/1').to route_to('webhooks#update', id: '1', device_id: 'abc123')
    end

    it 'routes to #destroy' do
      expect(delete: '/devices/abc123/webhooks/1').to route_to('webhooks#destroy', id: '1', device_id: 'abc123')
    end
  end
end
