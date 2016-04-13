class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.integer :lesson_id
      t.float :rate
      t.text :comment

      t.timestamps null: false
    end
  end
end
