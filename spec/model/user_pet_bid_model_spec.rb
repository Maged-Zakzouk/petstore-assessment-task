# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserPetBid, type: :model do
  context 'Model Validation' do
    describe 'associations' do
      it { should belong_to(:user) }
      it { should belong_to(:pet) }
    end

    describe 'Mondatory Validation' do
      it { should validate_presence_of(:amount) }
    end
  end
end
