class AddAgainDefaultValueToCoinHistories < ActiveRecord::Migration
  def change
    change_column_default :coin_histories, :start_time, nil
    change_column_default :coin_histories, :end_time, nil
    change_column_default :coin_histories, :how_to_pay, ""
  end
end
