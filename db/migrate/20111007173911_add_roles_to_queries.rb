class AddRolesToQueries < ActiveRecord::Migration
  def up
    remove_column :queries, :user_name
    add_column :admin_users, :is_super_user, :boolean, :default => false
  end

  def down
    remove_column :admin_users, :is_super_user
    add_column :queries, :user_name, :string
  end
end

