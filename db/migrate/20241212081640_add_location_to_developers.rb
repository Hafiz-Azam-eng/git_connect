class AddLocationToDevelopers < ActiveRecord::Migration[8.0]
  def change
    add_column :developers, :city, :string
    add_column :developers, :country, :string
  end
end
