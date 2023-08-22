class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to public_customers_mypage_path, notice: "登録情報が更新されました。"
    else
      render :edit
    end
  end

  def check
    @customer = current_customer
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    # t.boolean "is_cancel_membership", default: false, null: falseを記載している
    @customer.update(is_cancel_membership: true)
    reset_session
    flash[:notice] ="退会処理をいたしました。"
    redirect_to public_root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postcode, :telephon_number, :email)
  end
end
