
export const selectAllPokemons = (state) => {
  const pokemons = state.entities.pokemon;
  const keys = Object.keys(pokemons);
  const pokemonArr = [];
  keys.forEach(key => {
    pokemonArr.push(pokemons[key]);
  });

  return pokemonArr;
};
