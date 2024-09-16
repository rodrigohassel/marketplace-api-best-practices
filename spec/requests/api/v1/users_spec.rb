require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do  

  # path '/users' do    

  #   post('create user') do
  #     response(200, 'successful') do

  #       after do |example|
  #         example.metadata[:response][:content] = {
  #           'application/json' => {
  #             example: JSON.parse(response.body, symbolize_names: true)
  #           }
  #         }
  #       end
  #       run_test!
  #     end
  #   end
  # end

  path '/users/{id}' do          
    parameter name: :accept, in: :headers, type: :string, description: 'accept header'
    parameter name: :id, in: :path, type: :string, description: 'id'

    get('show user') do
      produces Mime[:json].to_s

      response(200, 'successful') do
        schema  type: :object, 
          properties: {
            id: { type: :integer },
            email: { type: :string },
            created_at: { type: :string },
            updated_at: { type: :string }
          },
          required: [ 'id', 'email' ]

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
