class Idea < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :price_category, :presence => true

  validates :price_category, :inclusion => { :in => [ 'Inexpensive', 'Mid-Range', 'Pricy', 'Luxurious' ]  }

  validates :user_id, :uniqueness => { :scope => [:date_title] }

  validates :user_id, :presence => true

end
