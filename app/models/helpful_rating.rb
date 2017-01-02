class HelpfulRating < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :review_id, :presence => true

  validates :user_id, :uniqueness => { :scope => [:review_id] }

  validates :user_id, :presence => true

end
