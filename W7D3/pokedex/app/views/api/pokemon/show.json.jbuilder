json.pokemon @pokemon, :id, :name, :attack, :defense, :image_url, :moves, :poke_type
json.items @pokemon.items, :id, :name, :pokemon_id, :price, :happiness, :image_url
