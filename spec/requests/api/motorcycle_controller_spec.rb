require 'rails_helper'

RSpec.describe Api::V1::MotorcyclesController, type: :request do
  before do
    @user = User.create(name: 'John Doe')
  end
  let(:invalid_params) { { motorcycle: attributes_for(:motorcycle, name: nil) } }
  let(:valid_params) do
    {
      motorcycle: {
        name: 'Harley Davidson',
        image: 'http://example.com/image.jpg',
        price: 10_000,
        description: 'A very cool motorcycle',
        model: 2022
      }
    }
  end

  describe 'GET /api/v1/motorcycles' do
    before { get '/api/v1/motorcycles' }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/motorcycles/:id' do
    before do
      @motorcycle = Motorcycle.create(name: 'gilbert', image: 'him1.png', description: 'kenya nija description',
                                      price: 80, model: 'Single')
      get "/api/v1/motorcycles/#{@motorcycle.id}"
    end

    context 'when the record exists' do
      it 'returns the motorcycle' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body)['id']).to eq(@motorcycle.id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      before { get '/api/v1/motorcycles/1' }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found error message' do
        expect(JSON.parse(response.body)['error']).to eq('O0op Motorcycle not found')
      end
    end
  end

  describe 'POST /api/v1/motorcycles' do
    context 'with valid parameters' do
      before { post '/api/v1/motorcycles', params: valid_params }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid parameters' do
      before { post '/api/v1/motorcycles', params: invalid_params }
    end
  end

  describe 'DELETE /api/v1/motorcycles/:id' do
    before do
      @motorcycle = Motorcycle.create(name: 'gilbert', image: 'him1.png', description: 'kenya nija description',
                                      price: 80, model: 'Single')
      delete "/api/v1/motorcycles/#{@motorcycle.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
