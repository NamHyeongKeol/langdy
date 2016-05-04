class AddColumnsToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :cat, :string
  end
end
