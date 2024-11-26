class ChangeColumnNameInUsersTable < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :pasword_reset_token, :password_reset_token
  end
end
