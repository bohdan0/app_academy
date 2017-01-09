import React from "react";

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);

    this.updateItem = this.updateItem.bind(this);
  }

  updateItem(event) {
    const pokeId = this.props.poke.id;
    const itemId = parseInt(event.currentTarget.dataset.id);

    this.props.router.push(`/pokemon/${pokeId}/items/${itemId}`);
  }

  componentDidMount() {
    this.props.requestSinglePoke(this.props.params.pokemonId);
  }

  componentWillReceiveProps(newProps) {
    if(this.props.params.pokemonId !== newProps.params.pokemonId) {
      this.props.requestSinglePoke(newProps.params.pokemonId);
    }
  }

  render() {
    const poke = this.props.poke;
    
    if (poke.name) {
      return(
        <div className="pokemon-detail">
          <figure>
            <img src={poke.image_url} alt={poke.name} />
          </figure>

          <h1>{poke.name}</h1>

          <ul>
            <li>Type: {poke.poke_type}</li>
            <li>Attack: {poke.attack}</li>
            <li>Defense: {poke.defense}</li>
          </ul>

          <h3>Items</h3>
          <ul className="items">
            {poke.items.map(item => (
              <li key={item.id}>
                <img 
                src={item.image_url} 
                alt={item.name}
                width="50"
                data-id={item.id}
                onClick={this.updateItem}/>
              </li>
            ))}
          </ul>

          {this.props.children}
        </div>
      );
    } else {
      return null;
    }
  }
}

export default PokemonDetail;
