class Photo < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  # Direct associations

  belongs_to :review

  # Indirect associations

  # Validations

  validates :photo, :presence => true

  validates :photo_description, :presence => true

  validates :review_id, :uniqueness => { :scope => [:photo] }

  validates :review_id, :presence => true

end
