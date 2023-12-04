require 'rails_helper'
require 'swagger_helper'

RSpec.describe "Api::V1::Topups", type: :request do
    path '/api/v1/topups' do

    get('list topups') do
      response(200, 'successful') do
        produces 'application/json'
        consumes 'application/json'
        parameter name: :query,
                  in: :query,
                  description: "Search through topups",
                  required: false

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create topup') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :topup, in: :body, schema: {
          type: :object,
          properties: {
            user_id: {type: :integer},
            phone_number: {type: :string},
            amount: {type: :number}
          },
          required: %w[user_id phone_number amount] 
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/topups/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show topup') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update topup') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update topup') do
      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :topup, in: :body, schema: {
          type: :object,
          properties: {
            user_id: {type: :integer},
            phone_number: {type: :string},
            amount: {type: :number}
          },
          required: %w[user_id phone_number number] 
        }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete topup') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end


end
