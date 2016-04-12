class AddLangCheckToUsers < ActiveRecord::Migration
  def change
    add_column :users, :korean, :boolean
    add_column :users, :english, :boolean
    add_column :users, :chinese, :boolean
    # ranks of lang to learn : '초급', '중하', '중상', '상'
    # ranks of lang to teach : '중상', '상', '모국어'
    add_column :users, :korean_rank, :string
    add_column :users, :english_rank, :string
    add_column :users, :chinese_rank, :string
  end
end
