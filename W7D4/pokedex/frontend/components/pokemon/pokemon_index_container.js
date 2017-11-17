import { connect } from 'react-redux';
import { selectAllPokemons } from '../../reducers/selectors';
import { requestAllPokemon } from '../../actions/pokemon_actions';
import PokemonIndex from './pokemon_index';

const mapStateToProps = state => ({
  // return { pokemon: state.pokemon };
  pokemon: selectAllPokemons(state)
});

const mapDispatchToProps = dispatch => {
  return {
    requestAllPokemon: () => dispatch(requestAllPokemon())
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonIndex);
