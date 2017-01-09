import React from 'react';
import { connect } from 'react-redux';

import PokemonDetail from './pokemon_detail';
import { requestSinglePoke } from '../../actions/pokemon_actions';
import { selectSinglePoke } from '../../reducers/selectors';

const mapStateToProps = ({ poke }) => ({
  poke
});
const mapDispatchToProps = dispatch => ({
  requestSinglePoke: id => dispatch(requestSinglePoke(id))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);
