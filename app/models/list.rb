class List < ApplicationRecord
  has_one_attached :picture
  has_many :list_bookmarks, dependent: :destroy
  has_many :movies, through: :list_bookmarks
  has_many :reviews, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def rating
    reviews.average(:rating).to_f.round(1)
  end
end
