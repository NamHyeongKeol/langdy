class AddHowToPayToCoinHistories < ActiveRecord::Migration
  def change
    add_column :coin_histories, :how_to_pay, :string
    # 현재 계좌이체, 알리페이 두 종류중 하나
  end
end
