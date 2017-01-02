class Review < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :user_id, :uniqueness => { :scope => [:date_idea_id] }

  validates :user_id, :presence => true

end
