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
