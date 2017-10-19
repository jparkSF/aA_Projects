class CreateShortenedUrls < ActiveRecord::Migration[5.1]

  def change
    create_table :shortened_urls do |t|
      t.string :long_url, unique: true, presence: true
      t.string :short_url, unique: true, presence: true
      t.integer :submitter_id, null: false
      t.timestamps
    end
  end
end
