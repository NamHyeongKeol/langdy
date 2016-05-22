class AddDefaultValueToUsers < ActiveRecord::Migration
  def change
    change_column_default :users, :lang_to_teach_1, ""
    change_column_default :users, :lang_to_teach_2, ""
    change_column_default :users, :lang_to_teach_3, ""
    change_column_default :users, :rank_to_teach_1, ""
    change_column_default :users, :rank_to_teach_2, ""
    change_column_default :users, :rank_to_teach_3, ""
    change_column_default :users, :lang_to_learn_1, ""
    change_column_default :users, :lang_to_learn_2, ""
    change_column_default :users, :lang_to_learn_3, ""
    change_column_default :users, :rank_to_learn_1, ""
    change_column_default :users, :rank_to_learn_2, ""
    change_column_default :users, :rank_to_learn_3, ""
  end
end
