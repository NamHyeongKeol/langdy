class CoinHistory < ActiveRecord::Base
  belongs_to :user
  has_one :cash_transaction
  has_one :exchange
  has_one :buycoin

  def type
    if self.is_buycoin
      return "상품권 구매"
    elsif self.is_exchange
      return "상품권 환전"
    else
      return "강의료 전송"
    end
  end

  def is_complete
    case self.type
    when "상품권 구매"
      return self.buycoin_complete
    when "상품권 환전"
      return self.exchange_complete
    when "강의료 전송"
      return self.transaction_complete
    end
  end

  def set_complete
    case self.type
    when "상품권 구매"
      self.buycoin_complete = true
    when "상품권 환전"
      self.exchange_complete = true
    when "강의료 전송"
      self.transaction_complete = true
    end
  end
end
