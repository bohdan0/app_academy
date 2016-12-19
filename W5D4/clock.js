class Clock {
  constructor() {
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
    let realTime = new Date();
    this.hours = realTime.getHours();
    this.seconds = realTime.getSeconds();
    this.minutes = realTime.getMinutes();
    this.printTime();
    this.interval = 1000;
  }

  printTime() {
    var displaySeconds;
    var displayMinutes;
    if (this.seconds < 10){
      displaySeconds = `0${this.seconds}`;
    } else{
        displaySeconds = `${this.seconds}`;
    }
    if (this.minutes < 10){
      displayMinutes = `0${this.minutes}`;
    } else {
      displayMinutes =  `${this.minutes}`;
    }

    console.log(`${this.hours}:${displayMinutes}:${displaySeconds}`);
    // Format the time in HH:MM:SS
    // Use console.log to print it.
  }

  _tick() {
    setInterval(() => {
      this.seconds += 1;
      this.adjustTime();
      this.printTime();
    }, this.interval);
    // 1. Increment the time by one second.
    // 2. Call printTime.
  }

  adjustTime() {
    // console.log(this.seconds.typeOf(Number));
    if (this.seconds >= 60) {
      this.seconds = 0;
      this.minutes++;
    }

    if (this.minutes >= 60) {
      this.minutes = 0;
      this.hours++;
    }

    if (this.hours >= 24) {
      this.hours = 0;
      this.minutes = 0;
      this.seconds = 0;
    }
  }
}


const newClock = new Clock();
newClock._tick();
