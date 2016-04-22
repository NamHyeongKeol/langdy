class AddColToUsers < ActiveRecord::Migration
  # lang : 'English', 'Korean', 'Chinese'
  # ranks of lang to learn : '선택해주세요', '초급', '중하급', '중상급', '고급'
  # ranks of lang to teach : '선택해주세요', '중상급', '고급', '모국어'
  def change
    add_column :users, :lang_to_learn_1, :string
    add_column :users, :lang_to_learn_2, :string
    add_column :users, :lang_to_learn_3, :string
    add_column :users, :rank_to_learn_1, :string
    add_column :users, :rank_to_learn_2, :string
    add_column :users, :rank_to_learn_3, :string
    add_column :users, :lang_to_teach_1, :string
    add_column :users, :lang_to_teach_2, :string
    add_column :users, :lang_to_teach_3, :string
    add_column :users, :rank_to_teach_1, :string
    add_column :users, :rank_to_teach_2, :string
    add_column :users, :rank_to_teach_3, :string
  end
end
