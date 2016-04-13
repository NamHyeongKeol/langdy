class AddRemovedColToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lang_to_learn, :string
    add_column :users, :native_lang, :string
  end
end
