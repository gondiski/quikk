require 'rails_helper'
require 'swagger_helper'


RSpec.describe "Api::V1::Transactions", type: :request do
  path '/api/v1/transactions' do

    get('list transactions') do
      response(200, 'successful') do
        produces 'application/json'
        consumes 'application/json'
        parameter name: :query,
                  in: :query,
                  description: "Search through transactions",
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

    post('create transaction') do
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :transaction, in: :body, schema: {
          type: :object,
          properties: {
            user_id: {type: :integer},
            deposit: {type: :number},
            currency: {type: :string},
            withdrawal: {type: :number},
            amount: {type: :number}
          },
          required: %w[user_id deposit currency withdrawal amount] 
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

  path '/api/v1/transactions/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show transaction') do
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

    patch('update transaction') do
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

    put('update transaction') do
      response(200, 'successful') do
        let(:id) { '123' }
        consumes 'application/json'
        parameter name: :transaction, in: :body, schema: {
          type: :object,
          properties: {
            user_id: {type: :integer},
            deposit: {type: :number},
            currency: {type: :string},
            withdrawal: {type: :number},
            amount: {type: :number}
          },
          required: %w[user_id deposit currency withdrawal number] 
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

    delete('delete transaction') do
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
