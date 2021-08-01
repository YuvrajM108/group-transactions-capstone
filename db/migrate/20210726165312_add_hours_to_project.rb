class AddHoursToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :hours, :integer, null: false, default: 0
    change_column :projects, :name, :string, null: false, default: ""
    add_index :projects, :name, unique: true
  end
end
