class List < ApplicationRecord
  # associations
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  # validations
  validates :name, presence: true, uniqueness: true
  # when you delete a list, it should delete all its bookmarks, but not movies
end
