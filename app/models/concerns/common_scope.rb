# frozen_string_literal: true

module CommonScope
  extend ActiveSupport::Concern

  included do
    scope :sorted, -> { order(created_at: :desc) }
  end
end
