require 'rails_helper'

describe DevicePolicy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:device) { create(:device, user: user) }
  let(:other_device) { create(:device, user: other_user) }

  permissions :create? do
    describe 'a new device' do
      it 'permits a new user to be created with current user' do
        expect(subject).to permit(user, Device.new(user_id: user.id))
      end

      it 'does not permits a new user to be created without current user' do
        expect(subject).not_to permit(user, Device.new(user_id: other_user.id))
      end
    end
  end

  permissions :show? do
    it 'permits a user to view their device' do
      expect(subject).to permit(user, device)
    end

    it 'does not permit a new user to view another user' do
      expect(subject).not_to permit(user, other_device)
    end
  end

  permissions :update? do
    it 'permits a user to update their device' do
      expect(subject).to permit(user, device)
    end

    it 'does not permit a new user to update another user\'s device' do
      expect(subject).not_to permit(user, other_device)
    end
  end

  permissions :destroy? do
    it 'permits a user to destroy their device' do
      expect(subject).to permit(user, device)
    end

    it 'does not permit a new user to destroy another user\'s device' do
      expect(subject).not_to permit(user, other_device)
    end
  end
end
