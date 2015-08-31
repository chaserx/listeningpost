require 'rails_helper'

describe UserPolicy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  permissions :create? do
    describe 'a new user' do
      it 'permits a new user to be created' do
        user = User.new
        expect(subject).to permit(user, user)
      end
    end
  end

  permissions :show? do
    it 'permits a user to view their data' do
      expect(subject).to permit(user, user)
    end

    it 'does not permit a new user to view another user' do
      expect(subject).not_to permit(user, other_user)
    end
  end

  permissions :update? do
    it 'permits a user to update their data' do
      expect(subject).to permit(user, user)
    end

    it 'does not permit a new user to update another user' do
      expect(subject).not_to permit(user, other_user)
    end
  end
end
