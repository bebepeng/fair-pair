function ChessTimer($elem, millisecs) {
  if (parseInt(millisecs) !== millisecs) {
    millisecs = 1500000;
  }
  this.maxTime = millisecs;
  this.$elem = $elem;
  this.time1 = this.maxTime;
  this.time2 = this.maxTime;
  this.position = 1;

  NotificationPermissions.askForPermission();

  this.displayCount();

  $elem.on('click', "[data-button=start]", this.startCount.bind(this));
  $elem.on('click', "[data-button=switch]", this.switchCount.bind(this));
  $elem.on('click', "[data-button=reset]", this.resetCount.bind(this));
}

ChessTimer.prototype.displayCount = function () {
  var time1 = displayTime(this.time1);
  this.$elem.find("[data-display=chess-counter1]").html(time1);

  var time2 = displayTime(this.time2);
  this.$elem.find("[data-display=chess-counter2]").html(time2);
};

ChessTimer.prototype.tick = function () {
  if (this.position === 1) {
    if (this.time1 > 0) {
      this.time1 -= 1000;
      this.displayCount();
    }
    else {
      clearInterval(this.interval);

      this.displayNotification(this.time2);
    }
  }
  else {
    if (this.time2 > 0) {
      this.time2 -= 1000;
      this.displayCount();
    }
    else {
      clearInterval(this.interval);

      this.displayNotification(this.time1);
    }
  }
};

ChessTimer.prototype.startCount = function (event) {
  event.preventDefault();
  this.interval = setInterval(this.tick.bind(this), 1000);
  this.$elem.find("[data-button=start]").replaceWith('<button data-button="switch">Switch</button>');
};

ChessTimer.prototype.switchCount = function (event) {
  event.preventDefault();

  if (this.position === 2) {
    this.position = 1;
  }
  else {
    this.position = 2;
  }

  clearInterval(this.interval);
  this.startCount(event);
};

ChessTimer.prototype.resetCount = function (event) {
  event.preventDefault();
  clearInterval(this.interval);
  this.time1 = this.maxTime;
  this.time2 = this.maxTime;
  this.displayCount();
  this.$elem.find("[data-button=switch]").replaceWith('<button data-button="start">Start</button>');
};

ChessTimer.prototype.displayNotification = function (time) {
  if (NotificationPermissions.hasPermission) {
    if (time === 0) {
      new Notification("Time is up! Good Job to the both of you!", {icon: ChessPic, body: 'FairPair Notification'});
    }
    else {
      new Notification("Stop driving! It's time for your pair to take over!", {icon: ChessPic,  body: 'FairPair Notification'});
    }
  }
  else {
    if (time === 0) {
      alert("Time is up! Good Job to the both of you!");
    }
    else {
      alert("Stop driving! It's time for your pair to take over!");
    }
  }
};