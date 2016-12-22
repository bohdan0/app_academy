const APIUtil = require('./api_util.js');
const FollowToggle = require('./follow_toggle.js')

class UsersSearch {

  constructor(el) {
    this.$el = $(el);
    this.$input = $(el).find('input');
    this.$ul = $(el).find('ul.users');
    $(el).on('keypress', (event) => {
      this.handleInput();
    });
  }

  handleInput() {
    APIUtil.searchUsers(this.$input.val()).then((users) => {
      this.renderResults(users);
    }, (err) => console.log(err));
  }

  renderResults(users) {
    this.$ul.empty();
    users.forEach(user => {
      let $li = $('<li>');
      let $bt = $('<button>').addClass('follow-toggle');
      $bt.data('user-id', user.id);
      $bt.data('initial-follow-state', 'followed');
      new FollowToggle($bt);
      let $a = $('<a>').attr('href', `/users/${user.id}`);
      $a.text(user.username);
      $li.append($a);
      $li.append($bt);
      this.$ul.append($li);
      console.log(this.$ul);
    });
  }
}

module.exports = UsersSearch;
