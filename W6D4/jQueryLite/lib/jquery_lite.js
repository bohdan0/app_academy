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

	const DOMNodeCollection = __webpack_require__(1);

	const $l = selector => {

	  if (selector instanceof Function) {
	    let waitForPage = [];
	    waitForPage.push(selector);

	    const int = setInterval(() => {
	      if (document.readyState === 'complete') {
	        clearInterval(int);
	        waitForPage.forEach(func => {
	          func();
	        });
	      }
	    }, 100);

	  } else {
	    let arr = [];

	    if (selector instanceof HTMLElement) {
	      arr.push(selector);
	    } else {
	      let nodeList = document.querySelectorAll(selector);
	      arr = Array.from(nodeList);
	    }

	    return new DOMNodeCollection(arr);
	  }
	};

	window.$l = $l;


/***/ },
/* 1 */
/***/ function(module, exports) {

	class DOMNodeCollection {
	  constructor(arr) {
	    this.elements = arr;
	  }

	  show() {
	    this.each(el => {
	      console.log(el);
	    });
	  }

	  each(cb) {
	    this.elements.forEach(el => cb(el));
	  }

	  html(str) {
	    if (str) {
	      this.each(el => {
	        el.innerHTML = str;
	      });
	    } else {
	      return this.elements[0].innerHTML;
	    }
	  }

	  empty() {
	    this.each(el => {
	      el.innerHTML = "";
	    });
	  }

	  append(children) {
	    children.each(child => {
	      this.each(el => {
	        el.innerHTML += child.outerHTML;
	      });
	    });
	  }

	  attr(name, value) {
	    if (name && value) {
	      this.each(el => {
	        el.setAttribute(name, value);
	      });
	    } else {
	      return this.elements[0].getAttribute(name);
	    }
	  }

	  addClass(name) {
	    this.each(el => {
	      el.className += ` ${name}`;
	    });
	  }

	  removeClass(name) {
	    this.each(el => {
	      el.classList.remove(name);
	    });
	  }

	  children() {
	    let arr = [];
	    this.each(el => {
	      arr.push(el.children);
	    });

	    return new DOMNodeCollection(arr);
	  }

	  parent() {
	    let arr = [];
	    this.each(el => {
	      arr.push(el.parentNode);
	    });

	    return new DOMNodeCollection(arr);
	  }

	  find(selector) {
	    let arr = [];
	    this.each(el => {
	      let nodeList = el.querySelectorAll(selector);
	      arr = arr.concat(Array.from(nodeList));
	    });
	    console.log(arr);
	    return new DOMNodeCollection(arr);
	  }

	  remove() {
	    this.html('');
	    this.elements = [];
	  }

	  on(type, cb) {
	    this.each(el => {
	      el.cb = cb;
	      el.addEventListener(type, cb);
	    });
	  }

	  off(type) {
	    this.each(el => {
	      el.removeEventListener(type, el.cb);
	    });
	  }

	}

	module.exports = DOMNodeCollection;


/***/ }
/******/ ]);