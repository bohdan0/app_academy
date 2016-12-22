const UsersSearch = require('./users_search.js');
const FollowToggle = require('./follow_toggle.js');

$(() => {
  $('button.follow-toggle').each((idx, el) => {
    new FollowToggle(el);
  });

  $('nav.users-search').each((idx, el) => {
    new UsersSearch(el);
  });
});
