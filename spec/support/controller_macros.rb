# frozen_string_literal: true

module ControllerMacros
  def login_trainer
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:trainer]
      trainer = FactoryBot.create(:trainer)
      sign_in trainer
    end
  end
end