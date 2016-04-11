class CreateLessons < ActiveRecord::Migration
	def change
		create_table :lessons do |t|
			t.references :teacher
			t.references :student

			t.datetime :start_at
			t.datetime :end_at

      t.text :memo

			t.timestamps null: false
		end
	end
end
