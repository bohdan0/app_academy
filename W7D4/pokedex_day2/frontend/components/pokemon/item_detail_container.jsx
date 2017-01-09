import React from 'react';
import { connect } from 'react-redux';

import { ItemDetail } from './item_detail';
import { selectPokeItem } from '../../reducers/selectors';

const mapStateToProps = (state, ownProps) => ({
  item: selectPokeItem(state, ownProps.params.itemId)
});

export default connect(mapStateToProps)(ItemDetail);
 