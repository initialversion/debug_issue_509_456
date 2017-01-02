class Photo < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :review_id, :uniqueness => { :scope => [:photo] }

  validates :review_id, :presence => true

end
