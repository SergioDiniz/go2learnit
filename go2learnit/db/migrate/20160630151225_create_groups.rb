class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :title, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
