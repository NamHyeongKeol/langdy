class CreateFeedbacks < ActiveRecord::Migration
	def change
		create_table :feedbacks do |t|
			t.belongs_to :user

			t.text :text

			t.timestamps null: false
		end
	end
end
