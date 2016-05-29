class ChangeColumnInMemo < ActiveRecord::Migration
  def self.up
    add_column :memos, :course_id, :integer
  end

  def self.down
    remove_column :memos, :lesson_id
  end
end
