# frozen_string_literal: true

class UserPetBid < ApplicationRecord
  # == Relationships ========================================================
  belongs_to :user
  belongs_to :pet

  # == Validations ==========================================================
  validates :amount, presence: true
end
