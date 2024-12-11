class CreateDevelopers < ActiveRecord::Migration[8.0]
  def change
    create_table :developers do |t|
      t.string :name
      t.string :headline
      t.text :key_skills

      t.timestamps
    end
  end
end
