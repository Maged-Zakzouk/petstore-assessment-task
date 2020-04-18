# frozen_string_literal: true

class CalculateAuctionAmountService
  def initialize(availableItemCount, users_with_amounts)
    @availableItemCount = availableItemCount
    @users_with_amounts = users_with_amounts
    @result = []
  end

  def calculate
    if @availableItemCount == 0 
        @result << "No Winners"
        return self
    end
    @users_with_amounts = @users_with_amounts.sort_by { |a| [a[:amount_to_pay], a[:name]] }
    index = @users_with_amounts.size - 1
    elements_number = 1
    while index >= 0
      if elements_number <= @availableItemCount
        @result << { name: @users_with_amounts[index][:name], paid_amount: @users_with_amounts[index - 1][:amount_to_pay] }
      else
        @result << { name: @users_with_amounts[index][:name], paid_amount: 'Lost the auction' }
      end
      index -= 1
      elements_number += 1
     end
     self
  end
end
