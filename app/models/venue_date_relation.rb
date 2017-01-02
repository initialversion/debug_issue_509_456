class VenueDateRelation < ApplicationRecord
  # Direct associations

  belongs_to :date,
             :class_name => "Idea"

  # Indirect associations

  # Validations

  validates :date_id, :uniqueness => { :scope => [:venue_id] }

  validates :date_id, :presence => true

  validates :information, :presence => true

  validates :venue_id, :uniqueness => { :scope => [:date_id] }

  validates :venue_id, :presence => true

end
