const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

//
// function parseResponse(sum, response, numsLeft){
//     response = parseInt(response);
//     sum += response;
//     addNumbers(sum, numsLeft-1, parseResponse);
// }

function addNumbers(sum = 0, numsLeft = 3, callback){
  console.log(`sum: ${sum}, numsLeft: ${numsLeft}`);
  if (numsLeft === 0) {
    reader.close();
    callback(sum);
    return;
  }
    reader.question("Add number\n", function(response){
    response = parseInt(response);
    sum += response;
    addNumbers(sum, numsLeft-1, callback);
  });
}



addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
