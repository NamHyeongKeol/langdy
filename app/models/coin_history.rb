class CoinHistory < ActiveRecord::Base
  belongs_to :user
  has_one :cash_transaction
end
