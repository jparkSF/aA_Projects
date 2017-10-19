class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  # has_many :submitter,
  #   primary_key: :id,
  #   foreign_key: :submitter_id,
  #   class_name: 'Submitter',

  has_many :submitted_url,
    primary_key: :id,
    foreign_key: :submitter_id,
    class_name: 'ShortenedUrl'


end
