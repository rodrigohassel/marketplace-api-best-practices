require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do    

  path '/users' do
    post('create user') do
      tags 'API::V1::Users'
      consumes Mime[:json].to_s
      parameter name: :body, 
        in: :body, 
        schema: {
          type: :object,
          properties: {
            user: { 
              type: :object,
              properties: {                    
                email: { type: :string },
                password: { type: :string },
                password_confirmation: { type: :string } 
              }
            }
          }
        }
      response(201, 'user created') do
        let!(:body) do 
          { 'user': { 
            'email': 'user@emailswagger.com', 
            'password': '123456', 
            'password_confirmation': '123456' 
            } 
          }
        end

        run_test!
      end

      response(422, 'user create error') do
        let!(:body) do
          {
            'email': 'example@example.org',
            'password': '123456',
            'password_confirmation': '123456'
          }
        end

        run_test!
      end
    end
  end

  path '/users/{id}' do
    delete('delete user') do
      tags 'API::V1::User'
      consumes Mime[:json].to_s
      parameter name: :id, in: :path, type: :string

      response(204, 'user deleted') do
        let!(:id) { FactoryBot.create(:user).id }

        run_test!
      end

      response(404, 'user not found') do
        let!(:id) { 0 }
        
        run_test!
      end
    end
  end

  path '/users/{id}' do
    get('show user') do
      tags 'API::V1::Users'
      produces Mime[:json].to_s
      parameter name: :accept, in: :headers, type: :string, description: 'Add structure for version API'
      parameter name: :id, in: :path, type: :string, description: 'User id'

      response(200, 'User founded') do
        schema type: :object, 
          properties: {
            id: { type: :integer },
            email: { type: :string },
            created_at: { type: :string },
            updated_at: { type: :string }
          }
        let!(:id) { FactoryBot.create(:user).id }
        let!(:accept) { 'application/vnd.marketplace.v1' }

        run_test!
      end
    end

    # patch('update user') do
    #   response(200, 'successful') do
    #     let(:id) { '123' }

    #     after do |example|
    #       example.metadata[:response][:content] = {
    #         'application/json' => {
    #           example: JSON.parse(response.body, symbolize_names: true)
    #         }
    #       }
    #     end
    #     run_test!
    #   end
    # end

    # put('update user') do
    #   response(200, 'successful') do
    #     let(:id) { '123' }

    #     after do |example|
    #       example.metadata[:response][:content] = {
    #         'application/json' => {
    #           example: JSON.parse(response.body, symbolize_names: true)
    #         }
    #       }
    #     end
    #     run_test!
    #   end
    # end

    # delete('delete user') do
    #   response(200, 'successful') do
    #     let(:id) { '123' }

    #     after do |example|
    #       example.metadata[:response][:content] = {
    #         'application/json' => {
    #           example: JSON.parse(response.body, symbolize_names: true)
    #         }
    #       }
    #     end
    #     run_test!
    #   end
    # end
  end
end
