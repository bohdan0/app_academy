const APIUtil = {
  followUser: id => APIUtil.updateFollowing(id, "POST"),

  unfollowUser: id => APIUtil.updateFollowing(id, "DELETE"),

  updateFollowing: (id, method) => {
    return $.ajax({
      url: `/users/${id}/follow`,
      method: method,
      dataType: 'JSON',
      data: {
        user_id: id
      }
    });
  },

  searchUsers: (queryVal, success) => {
    return $.ajax({
      url: '/users/search',
      methods: 'GET',
      dataType: 'JSON',
      data: {
        query: queryVal
      }
      // success() {
      //   success
      // }
    });
  }
};

module.exports = APIUtil;
