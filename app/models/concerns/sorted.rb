# frozen_string_literal: true

module Sorted
  extend ActiveSupport::Concern

  included do
    scope :sorted_by_id, -> { order('id ASC') }
  end
end
