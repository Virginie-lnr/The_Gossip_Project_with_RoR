class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :confirmed, :boolean, :default => false
    #Ex:- :default =>''
    add_column :users, :confirmation_token, :string
  end
end
