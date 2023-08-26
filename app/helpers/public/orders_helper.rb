module Public::OrdersHelper
  def display_payment_method(payment_method)
    case payment_method
    when "credit_card"
      "クレジットカード"
    when "transfer"
      "銀行振込"
    end
  end

  def display_order_status(status)
    case status
    when "waiting"
      "入金待ち"
    when "confirmation"
      "入金確認"
    when "making"
      "製作中"
    when "preparing"
      "発送準備中"
    when "sent"
      "発送済み"
    end
  end
end
