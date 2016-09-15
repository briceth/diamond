class RemoveAvatarUrlToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :avatar_url, :string
  end
end
