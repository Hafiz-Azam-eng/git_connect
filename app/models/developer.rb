class Developer < ApplicationRecord
  has_one_attached :profile_picture
  belongs_to :user
end
