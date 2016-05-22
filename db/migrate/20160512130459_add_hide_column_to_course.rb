class AddHideColumnToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :hide, :boolean, default: false
  end
end
