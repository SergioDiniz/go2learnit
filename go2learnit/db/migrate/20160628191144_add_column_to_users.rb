class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :avatar, :string
    add_column :users, :bio, :text

    add_index :users, :username, unique: true
  end
end
