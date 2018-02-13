class AddAdminToUsers < ActiveRecord::Migration
  def change
    #users table, column name, the type, default is false
    add_column :users, :admin, :boolean, default: false
  end
end
