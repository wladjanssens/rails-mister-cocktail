class Cocktail < ApplicationRecord
  has_many :ingredients, through: :doses
  has_many :doses, dependent: :destroy
  validates :name, presence: true
  validates :name, uniqueness: true, if: 'name.present?'
  mount_uploader :photo, PhotoUploader
end

