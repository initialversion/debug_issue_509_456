class VenueDateRelation < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :date_id, :presence => true

  validates :information, :presence => true

  validates :venue_id, :uniqueness => { :scope => [:date_id] }

  validates :venue_id, :presence => true

end
