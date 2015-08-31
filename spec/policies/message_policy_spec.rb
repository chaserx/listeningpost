require 'rails_helper'

describe MessagePolicy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:message) { create(:message, user: user) }
  let(:other_message) { create(:message, user: other_user) }

  permissions :create? do
    describe 'a new message' do
      it 'permits a new user to be created with current user' do
        expect(subject).to permit(user, Message.new(user_id: user.id))
      end

      it 'does not permits a new user to be created without current user' do
        expect(subject).not_to permit(user, Message.new(user_id: other_user.id))
      end
    end
  end

  permissions :show? do
    it 'permits a user to view their message' do
      expect(subject).to permit(user, message)
    end

    it 'does not permit a new user to view another user' do
      expect(subject).not_to permit(user, other_message)
    end
  end

  permissions :update? do
    it 'permits a user to update their message' do
      expect(subject).to permit(user, message)
    end

    it 'does not permit a new user to update another user\'s message' do
      expect(subject).not_to permit(user, other_message)
    end
  end

  permissions :destroy? do
    it 'permits a user to destroy their message' do
      expect(subject).to permit(user, message)
    end

    it 'does not permit a new user to destroy another user\'s message' do
      expect(subject).not_to permit(user, other_message)
    end
  end
end
