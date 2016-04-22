class AddLangCheckToUsers < ActiveRecord::Migration
  def change
    add_column :users, :korean, :boolean
    add_column :users, :english, :boolean
    add_column :users, :chinese, :boolean
    add_column :users, :korean_rank, :string
    add_column :users, :english_rank, :string
    add_column :users, :chinese_rank, :string
  end
end
