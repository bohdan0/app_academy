const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class towersOfHanoi {

  constructor () {
    this.pileOne = [3, 2, 1];
    this.pileTwo = [];
    this.pileThree = [];
    this.ctr = 0;
  }

  getMoves(callback) {
    reader.question(`Enter pile from: \n`, (from) => {
      reader.question(`Enter pile to: \n`, (to) => {

        callback([parseInt(from) - 1, parseInt(to) - 1]);
      });
    });
  }

  play(ctr = 1) {
    if(this.gameOver() === false) {
      console.log([this.pileOne, this.pileTwo, this.pileThree]);
      console.log("\n");

      this.getMoves( (moves) => {
        if (this.validMove(moves[0], moves[1])) {
          this.ctr++;
          this.makeMove(moves[0], moves[1]);
        } else {
          console.log(`Move ${moves[0] + 1}, ${moves[1] + 1} is not valid!`);
        }

        this.play(ctr + 1);
      });
    } else {
      reader.close();
      console.log(`You've made ${this.ctr} moves!`);
    }
  }

  makeMove (from, to) {
    let piles = [this.pileOne, this.pileTwo, this.pileThree];
    let fromPile = piles[from];
    let toPile = piles[to];

    if (this.validMove(from, to)){
      toPile.push(fromPile.pop());
    }
  }

  validMove (from, to) {
    //check if disc size is larger than any existing dis at index
    let piles = [this.pileOne, this.pileTwo, this.pileThree];
    let fromPile = piles[from];
    let toPile = piles[to];
    if (from < 0 || to > 2 || fromPile.length < 1) {
      return false;
    } else if (fromPile[fromPile.length - 1] > toPile[toPile.length - 1]){
      return false;
    } else {
      return true;
    }
  }

  gameOver () {
    if (this.pileThree.length === 3) {
      return true;
    } else {
      return false;
    }
  }
}

let game = new towersOfHanoi();
game.play();
