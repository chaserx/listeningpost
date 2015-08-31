require 'rails_helper'

describe WebhookPolicy do
  subject { described_class }

  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:webhook) { create(:webhook, user: user) }
  let(:other_webhook) { create(:webhook, user: other_user) }

  permissions :create? do
    describe 'a new webhook' do
      it 'permits a new user to be created with current user' do
        expect(subject).to permit(user, Webhook.new(user_id: user.id))
      end

      it 'does not permits a new user to be created without current user' do
        expect(subject).not_to permit(user, Webhook.new(user_id: other_user.id))
      end
    end
  end

  permissions :show? do
    it 'permits a user to view their webhook' do
      expect(subject).to permit(user, webhook)
    end

    it 'does not permit a new user to view another user' do
      expect(subject).not_to permit(user, other_webhook)
    end
  end

  permissions :update? do
    it 'permits a user to update their webhook' do
      expect(subject).to permit(user, webhook)
    end

    it 'does not permit a new user to update another user\'s webhook' do
      expect(subject).not_to permit(user, other_webhook)
    end
  end

  permissions :destroy? do
    it 'permits a user to destroy their webhook' do
      expect(subject).to permit(user, webhook)
    end

    it 'does not permit a new user to destroy another user\'s webhook' do
      expect(subject).not_to permit(user, other_webhook)
    end
  end
end
