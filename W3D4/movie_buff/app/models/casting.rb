class Casting < ApplicationRecord
  belongs_to :actors,
    class_name: :Actor,
    foreign_key: :actor_id,
    primary_key: :id

  belongs_to :movie,
    class_name: :Movie,
    foreign_key: :movie_id,
    primary_key: :id

end
