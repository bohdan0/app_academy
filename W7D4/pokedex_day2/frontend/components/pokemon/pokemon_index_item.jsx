import React from 'react';
import { Link } from 'react-router';

export const PokemonIndexItem = ({ poke }) => {
  const poke_url = `/pokemon/${poke.id}`;

  return(
    <div>
      <Link to={poke_url}>
        <span>{poke.id}</span>
        <img src={poke.image_url}></img>
        <span>{poke.name}</span>
      </Link>
    </div>
  );
};
