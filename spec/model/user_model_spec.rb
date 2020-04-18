# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Model Validation' do
    describe 'duplicate data' do
      it { should validate_uniqueness_of(:username) }
      it { should validate_uniqueness_of(:phone) }
      it { should validate_uniqueness_of(:email) }
    end
    
    describe 'Email Validation' do
      it 'should return message: Email is invalid if the email do not respect the email format ' do
        user = described_class.new
        user.email = 'asa'

        user.valid?
        expect(user.errors.full_messages[0]).to eql('Email is invalid')
      end

      it 'should be valid if email is valid format ' do
        user = described_class.new
        user.email = 'asa@gmail.com'

        expect(user.valid?).to eql(true)
      end
    end
  end
end
