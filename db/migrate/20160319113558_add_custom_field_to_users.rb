class AddCustomFieldToUsers < ActiveRecord::Migration
	def change
		add_column :users, :name,				:string
		add_column :users, :lang_to_learn,		:string
		add_column :users, :native_lang,		:string

		change_column_null :users, :name, false
		change_column_null :users, :lang_to_learn, false
		change_column_null :users, :native_lang, false

		add_column :users, :is_teacher,			:boolean, default: true
		add_column :users, :is_admin,			:boolean, default: false

		add_column :users, :cash,				:integer, default: 0

		add_column :users, :profile_pic,		:string
	end
end
