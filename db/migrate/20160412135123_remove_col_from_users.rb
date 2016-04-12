class RemoveColFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :korean, :boolean
    remove_column :users, :english, :boolean
    remove_column :users, :chinese, :boolean
    remove_column :users, :korean_rank, :string
    remove_column :users, :english_rank, :string
    remove_column :users, :chinese_rank, :string
    remove_column :users, :want_to_learn_korean, :boolean
    remove_column :users, :want_to_learn_english, :boolean
    remove_column :users, :want_to_learn_chiese, :boolean
  end
end
