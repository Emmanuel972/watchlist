class Review < ApplicationRecord
  # belongs_to :movie, if list is not present
  belongs_to :movie, optional: true
  # belongs_to :list, if movie is not present
  belongs_to :list, optional: true
  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: 0..5 }
  validates :movie, presence: true, unless: :list # if list is present, movie is not required
  validates :list, presence: true, unless: :movie # if movie is present, list is not required
end
