class RemoveLangFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :native_lang, :string
    remove_column :users, :lang_to_learn, :string
  end
end
