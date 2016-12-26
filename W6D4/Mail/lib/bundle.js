/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const Router = __webpack_require__(1);
	const Inbox = __webpack_require__(2);

	document.addEventListener('DOMContentLoaded', () => {
	  let nodes = Array.from(document.querySelectorAll('.sidebar-nav li'));
	  nodes.forEach(node => {
	    node.addEventListener('click', (event) => {
	      let location = event.currentTarget.innerText.toLowerCase();
	      window.location.hash = location;
	    });
	  });

	  let contentNode = document.querySelector('.content');
	  const router = new Router(contentNode, Routes);
	  router.start();
	});


	const Routes = {
	  inbox: Inbox
	};


/***/ },
/* 1 */
/***/ function(module, exports) {

	class Router {
	  constructor(node, routes) {
	    this.node = node;
	    this.routes = routes;
	  }

	  start() {
	    this.render();

	    window.addEventListener('hashchange', event => {
	      this.render();
	    });
	  }

	  activeRoute() {
	    let currRoute = window.location.hash.slice(1);
	    return this.routes[currRoute];
	  }

	  render() {
	    this.node.innerHTML = '';
	    let component = this.activeRoute();

	    if (component) {
	      this.node.innerHTML = '';
	      this.node.appendChild(component.render());
	    } else {
	      this.node.innerHTML = '';
	    }
	  }
	}

	module.exports = Router;


/***/ },
/* 2 */
/***/ function(module, exports) {

	const Inbox = {
	  render: function() {
	    let container = document.createElement('ul');
	    container.className = 'messages';
	    container.innerHTML = 'An Inbox Message';
	    return container;
	  }
	};

	module.exports = Inbox;


/***/ }
/******/ ]);