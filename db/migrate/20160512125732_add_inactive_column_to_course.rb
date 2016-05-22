class AddInactiveColumnToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :inactive, :boolean, default: false
  end
end
