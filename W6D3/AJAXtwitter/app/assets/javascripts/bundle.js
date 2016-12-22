/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;
/******/
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const UsersSearch = __webpack_require__(3);
	const FollowToggle = __webpack_require__(1);
	
	$(() => {
	  $('button.follow-toggle').each((idx, el) => {
	    new FollowToggle(el);
	  });
	
	  $('nav.users-search').each((idx, el) => {
	    new UsersSearch(el);
	  });
	});


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	const APIUtil = __webpack_require__(2);
	
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


/***/ },
/* 2 */
/***/ function(module, exports) {

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


/***/ },
/* 3 */
/***/ function(module, exports, __webpack_require__) {

	const APIUtil = __webpack_require__(2);
	const FollowToggle = __webpack_require__(1)
	
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


/***/ }
/******/ ]);
//# sourceMappingURL=bundle.js.map