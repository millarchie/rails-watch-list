class Bookmark < ApplicationRecord
  # associations
  belongs_to :movie
  belongs_to :list
  # validations
  # must be linked to a movie and a list, and the pairings should be unique
  validates :movie, presence: true, uniqueness: { scope: :list }
  # comment cannot be shorter than 6 characters
  validates :comment, length: { minimum: 6 }
end
