class Movie < ApplicationRecord
  has_many :list_bookmarks, dependent: :destroy
  has_many :lists, through: :list_bookmarks
  has_many :reviews, dependent: :destroy

  def rating
    reviews.average(:rating).to_f.round(1)
  end
end
