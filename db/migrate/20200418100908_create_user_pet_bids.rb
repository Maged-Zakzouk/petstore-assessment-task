# frozen_string_literal: true

class CreateUserPetBids < ActiveRecord::Migration[5.2]
  def change
    create_table :user_pet_bids, id: :integer do |t|
      t.belongs_to :user, type: :integer, foreign_key: true, null: false
      t.belongs_to :pet, type: :integer, foreign_key: true, null: false
      t.decimal    :amount, null: false

      t.timestamps
    end
  end
end
