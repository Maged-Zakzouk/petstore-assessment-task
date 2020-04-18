# frozen_string_literal: true

class User < ApplicationRecord
  # == Relationships ========================================================
  has_many  :pets
  has_many  :user_pet_bids

  # == Validations ==========================================================
  validates :username, uniqueness: true
  validates :phone, uniqueness: true
  validates :email,
            uniqueness: true,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
