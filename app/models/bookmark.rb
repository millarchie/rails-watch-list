class Bookmark < ApplicationRecord
  # associations
  belongs_to :movie
  belongs_to :list
  # validations
end
