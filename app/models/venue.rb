class Venue < ApplicationRecord
  # Direct associations

  has_many   :venue_date_relations,
             :dependent => :destroy

  # Indirect associations

  has_many   :dates,
             :through => :venue_date_relations,
             :source => :date

  # Validations

end
