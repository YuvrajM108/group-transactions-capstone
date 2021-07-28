class CreateGroupedProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :grouped_projects do |t|
      t.references :project, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
