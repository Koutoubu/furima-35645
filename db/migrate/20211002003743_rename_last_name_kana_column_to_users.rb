class RenameLastNameKanaColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :last_name_KANA, :last_name_kana
  end
end
