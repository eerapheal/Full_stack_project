require 'rails_helper'

RSpec.describe Motorcycle, type: :model do
  before(:each) do
    @motorcycle = Motorcycle.create(name: 'Motorcycle 1', image: 'Motorcycle1.png',
                                    description: 'Motorcycle description', price: 80,
                                    model: 'Single')
  end

  context 'Testing validations' do
    it 'Motorcycle created is valid' do
      expect(@motorcycle).to be_valid
    end
    it 'Motorcycle is invalid if name field is null' do
      @motorcycle.name = nil
      expect(@motorcycle).not_to be_valid
    end
    it 'Motorcycle is invalid if image field is null' do
      @motorcycle.image = nil
      expect(@motorcycle).not_to be_valid
    end
    it 'Motorcycle is invalid if description field is null' do
      @motorcycle.description = nil
      expect(@motorcycle).not_to be_valid
    end
    it 'Motorcycle is invalid if price field is null or less than zero' do
      @motorcycle.price = '-1'
      expect(@motorcycle).not_to be_valid
      @motorcycle.price = nil
      expect(@motorcycle).not_to be_valid
    end
    it 'Motorcycle is invalid if model field is null' do
      @motorcycle.model = nil
      expect(@motorcycle).not_to be_valid
    end
  end

  context 'Testing associations' do
    it 'Motorcycle should have many bookings' do
      subject = Motorcycle.reflect_on_association(:reservations)
      expect(subject.macro).to eq(:has_many)
    end
  end
end
