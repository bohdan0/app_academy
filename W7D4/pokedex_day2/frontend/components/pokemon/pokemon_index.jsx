import React from 'react';

import { PokemonIndexItem } from './pokemon_index_item';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    return (
      <div className="pokedex">
        <ol>
          {this.props.pokemon.map(poke => (
            <li key={poke.id} className="pokemon-index-item">
              <PokemonIndexItem poke={poke} />
            </li>
          ))}
        </ol>

        {this.props.children}
      </div>
    );
  }
}

export default PokemonIndex;
