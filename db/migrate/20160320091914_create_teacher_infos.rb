class CreateTeacherInfos < ActiveRecord::Migration
	def change
		create_table :teacher_infos do |t|
			t.belongs_to :user

			t.string :major
			t.string :school_grad

			t.text :introduction

			t.string :location

			t.boolean :is_approved, default: false

			t.timestamps null: false
		end
	end
end
