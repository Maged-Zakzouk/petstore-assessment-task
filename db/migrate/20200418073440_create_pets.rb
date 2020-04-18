# frozen_string_literal: true

class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets, id: :integer do |t|
      t.string :name, null: false
      t.string :status
      t.string :photo_urls, array: true, null: false
      t.string :tags, array: true
      t.belongs_to :category, type: :integer, foreign_key: true
      t.belongs_to :owner, type: :integer, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
