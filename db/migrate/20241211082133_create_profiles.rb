class CreateProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :profile_picture
      t.string :headline
      t.text :key_skills

      t.timestamps
    end
  end
end
