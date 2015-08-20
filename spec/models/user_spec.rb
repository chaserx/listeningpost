require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    build(:user, email: nil, password: nil, password_confirmation: nil)
  }

  describe 'an invalid user' do
    it 'requires an email address' do
      expect(subject).to have(1).error_on(:email)
      expect(subject).to be_invalid
    end

    it 'requires a confirmed password' do
      expect(subject).to have(2).error_on(:password)
      expect(subject).to be_invalid
    end
  end
end
