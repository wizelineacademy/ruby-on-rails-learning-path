# frozen_string_literal: true

module SpecTestHelper
  def login(maestro)
    maestro = Maestro.where(login: maestro.to_s).first if maestro.is_a?(Symbol)
    request.session[:user_id] = maestro.id
  end
end
