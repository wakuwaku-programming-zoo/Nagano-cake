class ApplicationController < ActionController::Base
   before_action :set_current_customer

  private

  def set_current_customer
    @customer = current_customer if customer_signed_in?
  end
end

