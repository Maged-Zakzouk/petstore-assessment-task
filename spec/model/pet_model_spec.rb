# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pet, type: :model do
  context 'Model Validation' do
    describe 'associations' do
      it { should belong_to(:category).optional }
      it { should belong_to(:owner).class_name('User').optional }
    end

    describe 'Mondatory Validation' do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:photo_urls) }
    end

    describe 'Status Validation' do
      it 'should return message: Email is invalid if the email do not respect the email format ' do
        pet = described_class.new
        pet.name = 'cat'
        pet.photo_urls = %w[url1 url2]
        pet.status = 'test'

        pet.valid?
        expect(pet.errors.full_messages[0]).to eql('Status is not included in the list')
      end

      it 'should be valid if status equals available' do
        pet = described_class.new
        pet.name = 'cat'
        pet.photo_urls = %w[url1 url2]
        pet.status = 'available'

        expect(pet.valid?).to eql(true)
      end

      it 'should be valid if status equals pending' do
        pet = described_class.new
        pet.name = 'cat'
        pet.photo_urls = %w[url1 url2]
        pet.status = 'pending'

        expect(pet.valid?).to eql(true)
      end

      it 'should be valid if status equals sold' do
        pet = described_class.new
        pet.name = 'cat'
        pet.photo_urls = %w[url1 url2]
        pet.status = 'sold'

        expect(pet.valid?).to eql(true)
      end
    end
  end
end
