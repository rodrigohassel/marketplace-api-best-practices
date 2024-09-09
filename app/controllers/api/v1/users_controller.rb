# frozen_string_literal: true

module Api
  module V1
    class UsersController < ActionController::Base
      respond_to :json

      def show
        respond_with User.find(params[:id])
      end
    end
  end
end
