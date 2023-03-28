class CreateProjectStatusHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :project_status_histories do |t|
      t.string :from, null: false
      t.string :to, null: false
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
