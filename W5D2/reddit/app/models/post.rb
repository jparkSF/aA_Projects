class Post < ApplicationRecord
  validates :title, presence: true

  belongs_to :sub
end
