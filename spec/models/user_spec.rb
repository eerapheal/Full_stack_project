require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Test user model' do
    it 'Add valid user' do
      user = User.create(name: 'ralph')
      expect(user).to be_valid
    end

    it 'Add valid user with short name' do
      user = User.create(name: 'james')
      expect(user).to be_valid
    end

    it 'Add valid user with long name' do
      user = User.create(name: 'raphaeljameshasinagilbert')
      expect(user).to be_valid
    end

    it 'Add user already in use' do
      User.create(name: 'Hasina')
      user = User.create(name: 'Hasina')
      expect(user).to be_valid
    end
  end
end