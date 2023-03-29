require 'rails_helper'
require 'date'

RSpec.describe Reservation, type: :model do
  before(:each) do
    @user = User.create(name: 'test')
    @motorcycle = Motorcycle.create(name: 'gilbert', image: 'him1.png',
                                    description: 'kenya nija description', price: 80,
                                    model: 'Single')
    @reservation = Reservation.create(user: @user, motorcycle: @motorcycle, start_date: '2023-03-13',
                                      end_date: '2023-03-16', city: 'kaduna')
  end

  context 'Testing validations' do
    it 'reservation is invalid if user field is null' do
      @reservation.user = nil
      expect(@reservation).to_not be_valid
    end

    it 'reservation is invalid if motorcycle field is null' do
      @reservation.motorcycle = nil
      expect(@reservation).to_not be_valid
    end

    it 'reservation is invalid if start_date field is null' do
      @reservation.start_date = nil
      expect(@reservation).to_not be_valid
    end

    it 'reservation is invalid if end_date field is null' do
      @reservation.end_date = nil
      expect(@reservation).to_not be_valid
    end

    it 'reservation is invalid if start_date field is before today' do
      @reservation.start_date = Date.today - 1.day
      expect(@reservation).to_not be_valid
    end

    it 'reservation is invalid if start_date field is equal or after end_date' do
      @reservation.start_date = Date.today + 7.day
      @reservation.end_date = Date.today + 6.day
      expect(@reservation).to_not be_valid

      @reservation.end_date = Date.today + 7.day
      expect(@reservation).to_not be_valid
    end
  end

  context 'Testing associations' do
    it 'reservation should belong to a user' do
      subject = Reservation.reflect_on_association(:user)
      expect(subject.macro).to eq(:belongs_to)
    end

    it 'reservation should belong to a motorcycle' do
      subject = Reservation.reflect_on_association(:motorcycle)
      expect(subject.macro).to eq(:belongs_to)
    end
  end
end
