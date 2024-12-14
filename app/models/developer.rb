class Developer < ApplicationRecord
  has_one_attached :profile_picture
  belongs_to :user
  validates :name, :headline, :key_skills, presence: true
  validates :experience_years, numericality: { greater_than_or_equal_to: 0 }
  validates :degree, :institution, :graduation_date, :job_position, :company, :duration, :responsibilities, :project_description, :live_demo_link, presence: true
  scope :by_skill, ->(skill) { where("key_skills ILIKE ?", "%#{skill}%") }
  scope :by_location, ->(location) { where("city ILIKE ? OR country ILIKE ?", "%#{location}%", "%#{location}%") }
  scope :by_experience, ->(min, max) { where(experience_years: min..max) }
  scope :mentorship_available, -> { where(available_for_mentorship: true) }
  scope :collaboration_available, -> { where(available_for_collaboration: true) }
end
