import React, { Component } from 'react';

const GiphysIndex = ({ items }) => {
  return (
    <div>
      {items.map((item, i) => (
        <img key={i} src={item.images.original.url} alt="picture" />
      ))}
    </div>
  );
};

export default GiphysIndex;

