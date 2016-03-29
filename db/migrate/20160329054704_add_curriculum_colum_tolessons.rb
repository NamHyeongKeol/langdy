class AddCurriculumColumTolessons < ActiveRecord::Migration
  def change
  	add_column :lessons, :is_free,	:boolean
  end
end
