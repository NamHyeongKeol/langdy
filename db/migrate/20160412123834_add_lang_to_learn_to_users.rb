class AddLangToLearnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :want_to_learn_korean, :boolean
    add_column :users, :want_to_learn_english, :boolean
    add_column :users, :want_to_learn_chiese, :boolean
  end
end
