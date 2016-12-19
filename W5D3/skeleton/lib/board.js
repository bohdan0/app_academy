let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let board = new Array(8);
  // board.forEach((row) => { row = (new Array(8)); });
  for(let i = 0; i < board.length; i++) {
    board[i] = new Array(8);
  }
  // console.log(board);
  board[3][4] = new Piece('black');
  board[4][3] = new Piece('black');
  board[3][3] = new Piece('white');
  board[4][4] = new Piece('white');
  return board;
}

// .load skeleton/lib/board.js
/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (!this.isValidPos(pos)) {
    console.error(`${pos} is out of bounds`);
  }
  let x = pos[0];
  let y = pos[1];
  return this.grid[x][y];
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {

};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  return this.getPiece(pos).color === color;
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  return this.getPiece(pos) !== undefined;
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  let x = pos[0];
  let y = pos[1];
  if (x < 0 || x > 7 || y < 0 || y > 7) {
    return false;
  }
  return true;
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip (board, pos, color, dir, piecesToFlip) {
  let nextPos = [pos[0] + dir[0], pos[1] + dir[1]];
  if (!board.isValidPos(nextPos)) {
    return [];
  }

  let currentPiece = board.getPiece(nextPos);
  if (currentPiece === undefined) {
    return [];
  }

  if(currentPiece.color === color) {
    return piecesToFlip;
  }
  piecesToFlip.push(currentPiece);
  return _positionsToFlip(board, nextPos, color, dir, piecesToFlip);
}
// _positionsToFlip(b, [2, 4], 'white', [1, 0], [])
/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (!this.validMove(pos, color)) {
    return console.error("not valid move");
  }

  let piecesToFlip = [];
  for (let i = 0; i < Board.DIRS.length; i++) {
    let dir = Board.DIRS[i];
    console.log(_positionsToFlip(this, pos, color, dir, []));
    piecesToFlip = piecesToFlip.concat( _positionsToFlip(this, pos, color, dir, []));
  }

  let x = pos[0];
  let y = pos[1];
  this.grid[x][y] = new Piece(color);

  piecesToFlip.forEach( (piece) => piece.flip() );

  // for (let i = 0; i < piecesToFlip.length; i++) {
  //   piecesToFlip[i].flip();
  // }
};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  for (let i = 0; i < 8; i++) {
  let outStr = "";
    for (let j = 0; j < 8; j++) {
      let pos = [i,j];

      if (this.getPiece(pos) === undefined) {
        outStr += ".";
      } else {
        outStr += `${this.getPiece(pos).toString()}`;
      }
    }
    console.log(outStr);
  }
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (this.isOccupied(pos)) {
    return false;
  }
  for (let i = 0; i < Board.DIRS.length; i++) {
    let dir = Board.DIRS[i];
    let check = _positionsToFlip(this, pos, color, dir, []);

    if (check.length > 0) {
      return true;
    }
  }
  return false;
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
};

module.exports = Board;


let b = new Board();
console.log(b.validMove([2,4], 'white'));
b.placePiece([2,4], 'white');
console.log(b.getPiece([2,4]));
console.log(b.getPiece([3,4]));
b.print();
b.placePiece([4,5], 'black');
b.print();
