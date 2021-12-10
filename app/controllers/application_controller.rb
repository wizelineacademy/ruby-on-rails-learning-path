# frozen_string_literal: true

# Application controler
class ApplicationController < ActionController::Base
  def not_found
    raise ActionController::RoutingError, 'Not Found'
  end
end
