class CreateMemos < ActiveRecord::Migration
  def change
    create_table :memos do |t|
      t.text :content
      t.integer :user_id
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
