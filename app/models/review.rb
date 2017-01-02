class Review < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :date_idea_rating, :numericality => { :less_than => 5, :greater_than_or_equal_to => 1 }

  validates :date_idea_rating_comment, :uniqueness => { :scope => [:date_idea_id, :user_id] }

  validates :user_id, :uniqueness => { :scope => [:date_idea_id] }

  validates :user_id, :presence => true

end
