class RenameRememberTokenDigest < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :rememebr_token_digest, :remember_token_digest
  end
end
