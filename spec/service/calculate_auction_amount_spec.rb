# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CalculateAuctionAmountService, type: :model do
  context 'Different scenarios' do
    it 'calculate with 0 bids' do
      user_bids = [
        { name: 'John Doe', amount_to_pay: 100 },
        { name: 'John Smith', amount_to_pay: 500 },
        { name: 'Sara Conor', amount_to_pay: 280 },
        { name: 'Martin Fowler', amount_to_pay: 280 }
      ]
      response = described_class.new(0, user_bids).calculate
      result = response.instance_variable_get(:@result)
      expect(result).to include 'No Winners'
    end

    it 'calculate with 1 bid' do
      user_bids = [
        { name: 'John Doe', amount_to_pay: 100 },
        { name: 'John Smith', amount_to_pay: 500 },
        { name: 'Sara Conor', amount_to_pay: 320 },
        { name: 'Martin Fowler', amount_to_pay: 280 }
      ]
      response = described_class.new(1, user_bids).calculate
      result = response.instance_variable_get(:@result)
      expect(result[0][:name]).to eq 'John Smith'
      expect(result[0][:paid_amount]).to eq 320

      expect(result[1][:name]).to eq 'Sara Conor'
      expect(result[1][:paid_amount]).to eq 'Lost the auction'

      expect(result[2][:name]).to eq 'Martin Fowler'
      expect(result[2][:paid_amount]).to eq 'Lost the auction'

      expect(result[3][:name]).to eq 'John Doe'
      expect(result[3][:paid_amount]).to eq 'Lost the auction'
    end

    it 'calculate with 3 bids' do
      user_bids = [
        { name: 'John Doe', amount_to_pay: 100 },
        { name: 'John Smith', amount_to_pay: 500 },
        { name: 'Sara Conor', amount_to_pay: 320 },
        { name: 'Martin Fowler', amount_to_pay: 280 }
      ]
      response = described_class.new(3, user_bids).calculate
      result = response.instance_variable_get(:@result)
      expect(result[0][:name]).to eq 'John Smith'
      expect(result[0][:paid_amount]).to eq 320

      expect(result[1][:name]).to eq 'Sara Conor'
      expect(result[1][:paid_amount]).to eq 280

      expect(result[2][:name]).to eq 'Martin Fowler'
      expect(result[2][:paid_amount]).to eq 100

      expect(result[3][:name]).to eq 'John Doe'
      expect(result[3][:paid_amount]).to eq 'Lost the auction'
    end

    it 'calculate with 3 bids, with 2 bid with the same value' do
      user_bids = [
        { name: 'John Doe', amount_to_pay: 100 },
        { name: 'John Smith', amount_to_pay: 500 },
        { name: 'Sara Conor', amount_to_pay: 320 },
        { name: 'Martin Fowler', amount_to_pay: 320 }
      ]
      response = described_class.new(3, user_bids).calculate
      result = response.instance_variable_get(:@result)
      expect(result[0][:name]).to eq 'John Smith'
      expect(result[0][:paid_amount]).to eq 320

      expect(result[1][:name]).to eq 'Sara Conor'
      expect(result[1][:paid_amount]).to eq 320

      expect(result[2][:name]).to eq 'Martin Fowler'
      expect(result[2][:paid_amount]).to eq 100

      expect(result[3][:name]).to eq 'John Doe'
      expect(result[3][:paid_amount]).to eq 'Lost the auction'
    end

  end
end