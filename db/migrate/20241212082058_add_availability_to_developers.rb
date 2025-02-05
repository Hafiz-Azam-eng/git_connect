class AddAvailabilityToDevelopers < ActiveRecord::Migration[8.0]
  def change
    add_column :developers, :available_for_mentorship, :boolean
    add_column :developers, :available_for_collaboration, :boolean
  end
end
