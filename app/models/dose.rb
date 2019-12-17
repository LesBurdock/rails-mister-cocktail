class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true

  validates_associated :ingredient
  validates :ingredient, presence: true

end
