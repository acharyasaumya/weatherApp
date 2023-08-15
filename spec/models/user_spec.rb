# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'validates presence of username' do
      user = User.new(username: nil)
      expect(user.valid?).to be_falsey
    end

    it 'validates presence of password' do
      user = User.new(password_digest: nil)
      expect(user.valid?).to be_falsey
    end
  end
end
