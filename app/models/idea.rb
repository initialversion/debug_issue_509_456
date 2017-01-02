class Idea < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :user_id, :uniqueness => { :scope => [:date_title] }

  validates :user_id, :presence => true

end
