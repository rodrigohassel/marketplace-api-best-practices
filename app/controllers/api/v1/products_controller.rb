# frozen_string_literal: true

module Api
  module V1
    class ProductsController < ActionController::Base
      respond_to :json

      def show
        respond_with Product.find(params[:id])
      end

      def index
        respond_with Product.all
      end

      # def create
      #   product = Product.create(product_params)

      #   if product.save
      #     render json: product, status: 201, location: [:api, product]
      #   else
      #     render json: { errors: product.errors }, status: 422
      #   end
      # end

      # def update
      #   product = product.find(params[:id])

      #   if product.update(product_params)
      #     render json: product, status: :ok, location: [:api, product]
      #   else
      #     render json: { errors: product.errors }, status: 422
      #   end
      # end

      # def destroy
      #   product = product.find(params[:id])
      #   product.destroy
      #   head 204
      # end

      private

      def product_params
        params.require(:product).permit(:title, :price, :description, :published, :user_id)
      end
    end
  end
end
