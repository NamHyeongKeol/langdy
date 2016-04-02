class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
    	t.string :lang
    	t.string :rank
    	t.string :subject
    	
    	t.text :content
    end
  end
end
