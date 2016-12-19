const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function siri(name) {
  let tea, biscuits;

  reader.question('Would you like some tea?\n', function(response) {
    console.log(`You replied ${response}.`);

    reader.question('Would you like some biscuits?\n', function(response2) {
      console.log(`You replied ${response2}.`);

      const teaAsk = (response === 'yes') ? 'do' : 'don\'t';
      const biscuitsAsk = (response2 === 'yes') ? 'do' : 'don\'t';

      console.log(`${name}, you ${teaAsk} want tea and you ${biscuitsAsk} want biscuits.`);

      reader.close();
    });
  });


}

siri('Bohdan');
