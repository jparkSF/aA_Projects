class ShortenedUrl < ApplicationRecord
  validates :short_url, :long_url, presence: true, uniqueness: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :submitter_id,
    class_name: 'User'

  def self.random_code
    random_code = SecureRandom.urlsafe_base64
    while exists?(short_url: random_code)
      random_code = SecureRandom.urlsafe_base64
    end
    random_code
  end

  def self.transform!(user, long_url)
    self.create!(
      submitter_id: user.id,
      short_url: ShortenedUrl.random_code,
      long_url: long_url
    )
  end
end
