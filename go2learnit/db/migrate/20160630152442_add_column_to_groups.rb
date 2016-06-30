class AddColumnToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :custon_address, :string
    add_column :groups, :group_type, :string

    add_index :groups, :custon_address, unique: true
  end
end
