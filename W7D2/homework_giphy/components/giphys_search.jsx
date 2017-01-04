import React, { Component } from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = { term: '' };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    const term = this.refs.term.value;
    this.setState({ term });
  }

  handleSubmit(event) {
    this.props.fetchSearchGiphys(this.state.term);
    this.setState({ term: '' });
  }

  render() {
    return (
      <div>
        <form>
          <label>Search:
            <input 
              type="text" 
              ref="term"
              onChange={this.handleChange} 
              value={this.state.term}/>
          </label>

          <button type="button" onClick={this.handleSubmit}>Submit</button>
        </form>

        <GiphysIndex items={this.props.giphys}/>
      </div>
    );
  }
}

export default GiphysSearch;