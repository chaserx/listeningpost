require 'rails_helper'

RSpec.describe CallbacksController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/devices/abc123/callbacks').to route_to('callbacks#index', device_id: 'abc123')
    end

    it 'routes to #show' do
      expect(get: '/devices/abc123/callbacks/xyz321').to route_to('callbacks#show', device_id: 'abc123', id: 'xyz321')
    end

    it 'routes to #create' do
      expect(post: '/devices/abc123/callbacks').to route_to('callbacks#create', device_id: 'abc123')
    end

    it 'routes to #update via PUT' do
      expect(put: '/devices/abc123/callbacks/xyz321').to route_to('callbacks#update', device_id: 'abc123', id: 'xyz321')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/devices/abc123/callbacks/xyz321').to route_to('callbacks#update', device_id: 'abc123', id: 'xyz321')
    end

    it 'routes to #destroy' do
      expect(delete: '/devices/abc123/callbacks/xyz321').to route_to('callbacks#destroy', device_id: 'abc123', id: 'xyz321')
    end
  end
end
