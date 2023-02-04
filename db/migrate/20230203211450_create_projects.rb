class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.integer :star_count, default: 0, null: false
      t.jsonb :raw_data
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
