class CreateTeacherComments < ActiveRecord::Migration
	def change
		create_table :teacher_comments do |t|
			t.references :commentor
			t.references :commentee

			t.text :text

			t.timestamps null: false
		end
	end
end
