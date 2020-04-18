# frozen_string_literal: true

class Category < ApplicationRecord
  # == Relationships ========================================================
  has_many :pets
end
