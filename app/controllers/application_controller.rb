# frozen_string_literal: true

class ApplicationController < ActionController::API
  protected_from_forgery with: :null_session
end
