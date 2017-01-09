import React from 'react';

export const ItemDetail = ({ item }) => {
  return (
    <div>
      <ul>
        <li>{item.name}</li>
        <li>Happiness: {item.happiness}</li>
        <li>Price: ${item.price}</li>
      </ul>
    </div>
  );
};