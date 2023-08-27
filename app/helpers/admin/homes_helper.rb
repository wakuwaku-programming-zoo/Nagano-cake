module Admin::HomesHelper
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
