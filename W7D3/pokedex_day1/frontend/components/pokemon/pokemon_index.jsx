import React from 'react';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    return (
      <ul>
        {this.props.pokemon.map((poke, i) => (
          <li key={i}>
            <p>{poke.name}</p>
            <img src={poke.image_url}></img>
          </li>
        ))}
      </ul>
    );
  }
}

export default PokemonIndex;
