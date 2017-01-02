class Idea < ApplicationRecord
  # Direct associations

  belongs_to :user

  has_many   :venue_date_relations,
             :foreign_key => "date_id",
             :dependent => :destroy

  has_many   :reviews,
             :foreign_key => "date_idea_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :venues,
             :through => :venue_date_relations,
             :source => :venue

  # Validations

  validates :date_description, :uniqueness => { :scope => [:date_title] }

  validates :date_description, :presence => true

  validates :date_title, :uniqueness => { :scope => [:user_id] }

  validates :date_title, :presence => true

  validates :price_category, :presence => true

  validates :price_category, :inclusion => { :in => [ 'Inexpensive', 'Mid-Range', 'Pricy', 'Luxurious' ]  }

  validates :user_id, :uniqueness => { :scope => [:date_title] }

  validates :user_id, :presence => true

end
