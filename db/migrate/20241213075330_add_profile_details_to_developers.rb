class AddProfileDetailsToDevelopers < ActiveRecord::Migration[8.0]
  def change
    add_column :developers, :email, :string
    add_column :developers, :contact_info, :text
    add_column :developers, :social_media_links, :text
    add_column :developers, :degree, :string
    add_column :developers, :institution, :string
    add_column :developers, :graduation_date, :date
    add_column :developers, :job_position, :string
    add_column :developers, :company, :string
    add_column :developers, :duration, :string
    add_column :developers, :responsibilities, :text
    add_column :developers, :project_description, :text
    add_column :developers, :live_demo_link, :text
  end
end
