require 'swagger_helper'

RSpec.describe 'api/users', type: :request do
  describe 'Register' do
    path '/api/v1/register' do
      post 'Creates an user' do
        tags 'Users register'
        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string }
          },
          required: ['name']
        }

        response '201', 'you are successfuly register.' do
          let(:user) { { name: 'Hansen234' } }
          run_test!
        end
      end
    end
  end

  describe 'Login' do
    path '/api/v1/login' do
      post 'Logs in an user' do
        tags 'Users Login'
        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string }
          },
          required: ['name']
        }

        response '200', 'Login success' do
          User.create(name: 'Hansen23')
          let(:user) { { name: 'Hansen23' } }
          run_test!
        end

        response '403', 'User does not exist Login to continue.' do
          let(:user) { { name: 'Random_user23' } }
          run_test!
        end
      end
    end
  end
end
