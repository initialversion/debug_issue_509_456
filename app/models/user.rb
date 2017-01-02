class User < ApplicationRecord
  # Direct associations

  has_many   :helpful_ratings,
             :dependent => :nullify

  has_many   :reviews,
             :dependent => :destroy

  has_many   :date_ideas,
             :class_name => "Idea",
             :dependent => :destroy

  # Indirect associations

  has_many   :date_idea_reviews,
             :through => :reviews,
             :source => :date_idea

  has_many   :helpful_reviews,
             :through => :helpful_ratings,
             :source => :review

  # Validations

  validates :first_name, :presence => true

  validates :last_name, :presence => true

  validates :username, :uniqueness => true

  validates :username, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
