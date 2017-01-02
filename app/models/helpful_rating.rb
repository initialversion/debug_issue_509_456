class HelpfulRating < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :user_id, :uniqueness => { :scope => [:review_id] }

  validates :user_id, :presence => true

end
