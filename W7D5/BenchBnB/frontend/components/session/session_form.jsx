import React from 'react';
import { Link } from 'react-router';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: '',
      password: ''
    };

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentDidUpdate() {
    this.redirectIfLoggedIn();
  }

  redirectIfLoggedIn() {
    if (this.props.loggedIn) this.props.router.push('/');
  }

  handleSubmit(event) {
    event.preventDefault();
    const user = this.state;

    this.props.processForm({user});

    this.setState({ username: '', password: '' });
  }

  update(property) {
    return (event) => {
      this.setState({ [property]: event.currentTarget.value });
    };
  }

  header() {
    const header = this.props.formType === 'login' ? 'Log In Form' : 'Sing Up Form';
    return (<h1>{header}</h1>);
  }

  link() {
    const link = this.props.formType === 'login' ? '/signup' : '/login';
    return (<Link to={link}>{`Go To ${ link.slice(1) }`}</Link>);
  }

  renderErrors() {
    return (
      <ul>
        {this.props.errors.map((error, i) => (
          <li key={`error-${i}`}>{error}</li>
        ))}
      </ul>
    );
  }

  render() {
    return (
      <form>
        { this.header() }
        { this.link() }
        { this.renderErrors() }
        <br/>
        <br/>
        
        <label>
          Username:
          <input type="text" 
                 onChange={this.update('username')} 
                 value={this.state.username} />
        </label>
        <br/>
        <br/>

        <label>
          Password:
          <input type="password" 
                 onChange={this.update('password')} 
                 value={this.state.password} />
        </label>
        <br/>
        <br/>

        <input type="button" onClick={this.handleSubmit} value="Submit"/>
      </form>
    );
  }
}

export default SessionForm;