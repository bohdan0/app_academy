import React from 'react';
import ReactDOM from 'react-dom';

class Tabs extends React.Component {
  constructor(props) {
    super(props);

    this.state = { selectedTab: 0 };

    this.headers = this.headers.bind(this);
    this.resetSelectedTab = this.resetSelectedTab.bind(this);
  }

  resetSelectedTab(event) {
    event.preventDefault();
    const selectedTabTitle = event.currentTarget.innerHTML;
    let selectedTab;

    this.props.panes.forEach((pane, idx) => {
      if (pane.title === selectedTabTitle) selectedTab = idx;
    });

    this.setState({ selectedTab });
  }

  headers() {
    return this.props.panes.map((pane, idx) => {
      return (
        <li key={idx}>
          <h1 onClick={this.resetSelectedTab}>
            {this.props.panes[idx].title}
          </h1>
        </li>
      );
    });
  }

  render() {
    return (
      <div className="tabs">
        <ul>
          {this.headers()}
        </ul>

        <article>{this.props.panes[this.state.selectedTab].content}</article>
      </div>
    );
  }
}

export default Tabs;