require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :request do
  let(:user) { User.create(name: 'John Doe') }
  let(:motorcycle) { Motorcycle.create(name: 'gilbert', image: 'him1.png', description: 'kenya nija description', price: 80, model: 'Single') }
  let!(:reservation) { Reservation.create(motorcycle_id: motorcycle.id, user_id: user.id) }

  describe '#Reservation' do
    it 'Should belong to the user' do
      expect(reservation.user_id).to eq(user.id)
    end

    it 'Should belong to the motorcycle' do
      expect(reservation.motorcycle_id).to eq(motorcycle.id)
    end
  end
end
