class AddDescriptionToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :description, :text, null: false
  end
end
