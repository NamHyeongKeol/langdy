class CoinHistory < ActiveRecord::Base
  belongs_to :user
  has_one :cash_transaction
  has_one :exchange
  has_one :buycoin

  def type
    if self.is_buycoin
      return "코인 구매"
    elsif self.is_exchange
      return "코인 환전"
    else
      return "강의료 전송"
    end
  end

  def is_complete
    case self.type
    when "코인 구매"
      return self.buycoin_complete
    when "코인 환전"
      return self.exchange_complete
    when "강의료 전송"
      return self.transaction_complete
    end
  end
end
