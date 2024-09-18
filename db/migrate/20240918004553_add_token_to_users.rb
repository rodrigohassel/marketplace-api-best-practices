# frozen_string_literal: true

class AddTokenToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :token, :string, default: ''

    update_token_user

    add_index :users, :token, unique: true
  end

  private

  def update_token_user
    User.where(token: '').each do |current_user|
      current_user.update(token: SecureRandom.base58(24))
    end
  end
end
