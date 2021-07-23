class RemoveFieldsFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :encrypted_password
    add_index :users, :username, unique: true
  end
end
