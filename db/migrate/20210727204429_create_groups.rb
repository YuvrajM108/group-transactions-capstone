class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name, unique: true
      t.string :icon_url

      t.timestamps
    end
  end
end
