# frozen_string_literal: true

class Pet < ApplicationRecord
  # == Constants ============================================================
  enum statuses: { available: 'available', pending: 'pending', sold: 'sold' }

  # == Relationships ========================================================
  belongs_to :category, optional: true
  belongs_to :owner, class_name: 'User', optional: true

  # == Validations ==========================================================
  validates :name, presence: true
  validates :photo_urls, presence: true

  validates :status, inclusion: {
    in: Pet.statuses.values
  }
end
