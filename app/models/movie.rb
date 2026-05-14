class Movie < ApplicationRecord
  # associations
  has_many :bookmarks
  # validations
end
