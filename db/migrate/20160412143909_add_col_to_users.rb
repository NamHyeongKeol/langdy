class AddColToUsers < ActiveRecord::Migration
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
