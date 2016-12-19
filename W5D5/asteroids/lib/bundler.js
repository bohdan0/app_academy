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

	const Utils = __webpack_require__(1);
	// const bullet = require("./bullet.js");
	// const ship = require("./ship.js");
	const GameView = __webpack_require__(2);
	const Game = __webpack_require__(3);
	const MovingObject = __webpack_require__(5);
	const Asteroid = __webpack_require__(4);

	document.addEventListener("DOMContentLoaded", function() {
	let ast = document.getElementById("game-canvas");
	const ctx = ast.getContext("2d");
	window.Game = Game;
	const game = new Game();
	window.game = game;
	const view = new GameView(game, ctx);
	window.view = view;
	view.start();
	});


/***/ },
/* 1 */
/***/ function(module, exports) {

	const Util = {
	  inherits (child, parent) {
	    var Suragate = function () {};
	    Suragate.prototype = parent.prototype;
	    child.prototype = new Suragate();
	    child.prototype.constructor = child;
	  }

	};

	module.exports = Util;


/***/ },
/* 2 */
/***/ function(module, exports) {

	const GameView = function(game, ctx) {
	  this.game = game;
	  this.ctx = ctx;
	};

	GameView.prototype.start = function () {
	   setInterval(() => {
	    this.game.moveObject();
	    // console.log("itworks");
	    this.game.draw(this.ctx);
	  }, 20);
	};

	module.exports = GameView;


/***/ },
/* 3 */
/***/ function(module, exports, __webpack_require__) {

	const Asteroid = __webpack_require__(4);

	let Game = function() {
	  this.DIM_X = 1000;
	  this.DIM_Y = 1000;
	  this.NUM_ASTEROIDS = 10;
	  this.asteroids = [];
	  this.addAsteroids();
	};

	Game.prototype.addAsteroids = function() {
	  for(let i = 0; i < this.NUM_ASTEROIDS; i++) {
	    let pos = this.randomPosition();
	    this.asteroids.push(new Asteroid(pos));
	  }
	};

	Game.prototype.randomPosition = function () {
	  return [Math.random() * this.DIM_X, Math.random() * this.DIM_Y];
	};

	Game.prototype.draw = function (ctx) {
	  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);
	  ctx.fillStyle = "#000000";
	  ctx.fill();

	  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);
	  for(let i = 0; i < this.asteroids.length; i++) {
	    this.asteroids[i].draw(ctx);
	  }
	  // debugger
	};

	Game.prototype.moveObject = function () {
	  for(let i = 0; i < this.asteroids.length; i++) {
	    this.asteroids[i].move();
	  }
	};
	module.exports = Game;


/***/ },
/* 4 */
/***/ function(module, exports, __webpack_require__) {

	let MovingObject = __webpack_require__(5);
	let Util = __webpack_require__(1);

	let Asteroid = function (pos) {
	  this.pos = pos;
	  this.vec = randomVec(5);
	  this.color = "brown";
	  this.radius = 20;
	};
	Util.inherits(Asteroid, MovingObject);

	function randomVec (length) {
	  const deg = 2 * Math.PI * Math.random();
	  return scale([Math.sin(deg), Math.cos(deg)], length);
	}

	function scale (vec, m) {
	  return [vec[0] * m, vec[1] * m];
	}



	module.exports = Asteroid;


/***/ },
/* 5 */
/***/ function(module, exports) {

	let MovingObject = function (options) {
	    this.pos = options["pos"];
	    this.vec = options["vec"];
	    this.radius = options["radius"];
	    this.color = options["color"];
	};

	MovingObject.prototype.draw = function(ctx) {
	  // ctx.clearRect(0, 0, 1000, 1000);
	  ctx.fillStyle = this.color;
	  ctx.beginPath();
	  ctx.arc(
	    this.pos[0],
	    this.pos[1],
	    this.radius,
	    0,
	    2 * Math.PI,
	    false
	  );

	  ctx.fill();
	};



	MovingObject.prototype.move = function() {
	  this.pos = [this.pos[0] + this.vec[0],  this.pos[1] + this.vec[1]];
	};

	MovingObject.prototype.test = function() {
	  console.log("works!");
	};







	module.exports = MovingObject;


/***/ }
/******/ ]);