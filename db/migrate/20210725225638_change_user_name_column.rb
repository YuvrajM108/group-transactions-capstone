class ChangeUserNameColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :name, :string, null: false, default: ""
  end
end
