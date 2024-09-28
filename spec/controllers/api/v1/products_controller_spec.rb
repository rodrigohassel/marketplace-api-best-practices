require 'rails_helper'

RSpec.describe Api::V1::ProductsController, type: :controller do
  describe 'GET #show' do
    before(:each) do
      @product = FactoryBot.create :product
      get :show, params: { id: @product.id }
    end

    it 'return the information about a reporter on a hash' do
      product_response = json_response
      expect(product_response[:title]).to eq @product.title
    end

    it { should respond_with :ok }
  end  

  describe 'GET #index' do
    before(:each) do
      FactoryBot.create_list(:product, 5)
      get :index
    end

    it 'returns 5 records from the database' do
      products_response = json_response
      expect(products_response.count).to eq 5
    end

    it { should respond_with :ok }
  end

  # describe 'POST #create' do
  #   context 'when is successfully created' do
  #     before(:each) do
  #       @product_attributes = FactoryBot.attributes_for :product
  #       post :create, params: { product: @product_attributes }
  #     end

  #     it 'renders the json representation for the product record just created' do
  #       product_response = json_response
  #       expect(product_response[:title]).to eq @product_attributes[:title]
  #     end

  #     it { should respond_with 201 }
  #   end

  #   context 'when is not created' do
  #     before(:each) do
  #       @invalid_product_attributes = {
  #         title: '123456',
  #         price: 0.2
  #       }

  #       post :create, params: { product: @invalid_product_attributes }
  #     end

  #     it 'renders an json error' do
  #       product_response = json_response
  #       expect(product_response).to have_key(:errors)
  #     end

  #     it 'renders the json error because the user could not be created' do
  #       product_response = json_response
  #       expect(product_response[:errors][:title]).to include "can't be blank"
  #     end
  #   end
  # end
end
