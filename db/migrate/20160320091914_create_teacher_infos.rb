class CreateTeacherInfos < ActiveRecord::Migration
	def change
		create_table :teacher_infos do |t|
			t.belongs_to :user

			t.boolean :is_approved, default: false

			t.timestamps null: false
		end
	end
end
