# frozen_string_literal: true

module Api
  module V1
    class PokemonsController < ApplicationController
      before_action :set_pokemon

      def show; end

      private

      def set_pokemon
        @pokemon = Pokemon.find(params[:id])
      end
    end
  end
end
