class Ingredient < ApplicationRecord
  has_many :coktails, through: :doses
  has_many :doses
  validates :name, presence: true
  validates :name, uniqueness: true, if: 'name.present?'
end
