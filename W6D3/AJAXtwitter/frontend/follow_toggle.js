const APIUtil = require("./api_util.js");

class FollowToggle {
  constructor(el) {
    this.userId = $(el).data('user-id');
    this.followState = $(el).data('initial-follow-state');
    this.$el = $(el);
    this.render();
    $(el).on('click', event => {
      this.handleClick(event);
    });
  }

  render() {
    if (this.followState === 'following' || this.followState === 'unfollowing') {
      this.$el.prop('disabled', true);
    } else if (this.followState === 'unfollowed') {
      this.$el.text('Follow!');
    } else {
      this.$el.text('Unfollow!');
    }
  }

  handleClick(event) {
    event.preventDefault();
    let request;
    if (this.followState === "followed") {
      this.followState = "unfollowing";
      request = APIUtil.unfollowUser(this.userId);
    } else {
      this.followState = "following";
      request = APIUtil.followUser(this.userId);
    }

    this.render();

    request.then(() => {
      this.toggleFollowState();
      this.render();
    }, (err) => console.log(err));
  }

  toggleFollowState() {
    if (this.followState === 'unfollowed' || this.followState === 'following') {
      this.followState = 'followed';
    } else {
      this.followState = 'unfollowed';
    }

    this.$el.prop('disabled', false);
  }
}

module.exports = FollowToggle;
