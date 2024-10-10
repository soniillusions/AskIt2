# frozen_string_literal: true

class AddRememberTokenDigestToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :rememebr_token_digest, :string
  end
end
