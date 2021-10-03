class RenameFirstNameKanaColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :first_name_KANA, :first_name_kana
  end
end
