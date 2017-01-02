class Venue < ApplicationRecord
  # Direct associations

  has_many   :venue_date_relations,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
