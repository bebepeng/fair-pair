function PomodoroTimer($elem) {
  this.$elem = $elem;
  this.time = 3000;

  if (Notification && Notification.permission !== "granted") {
    Notification.requestPermission(function (status) {
      if (Notification.permission !== status) {
        Notification.permission = status;
      }
    });
  }

  this.displayCount();

  $elem.on('click', "[data-button=start]", this.startCount.bind(this));
  $elem.on('click', "[data-button=pause]", this.pauseCount.bind(this));
  $elem.on('click', "[data-button=reset]", this.resetCount.bind(this));
}

PomodoroTimer.prototype.displayCount = function () {
  var time = displayTime(this.time);
  this.$elem.find("[data-display=counter]").html(time);
};

PomodoroTimer.prototype.tick = function () {
  if (this.time > 0) {
    this.time -= 1000;
    this.displayCount();
  }
  else {
    clearInterval(this.interval);

    if (Notification && Notification.permission === "granted") {
      new Notification("Pomodoro is up! Good Job! Time for a break.");
    }
    else {
      alert("Pomodoro is up! Good Job! Time for a break.");
    }
  }
};

PomodoroTimer.prototype.startCount = function (event) {
  event.preventDefault();
  this.interval = setInterval(this.tick.bind(this), 1000);
  this.$elem.find("[data-button=start]").replaceWith('<button data-button="pause">Pause</button>');
};

PomodoroTimer.prototype.pauseCount = function (event) {
  event.preventDefault();
  clearInterval(this.interval);
  this.$elem.find("[data-button=pause]").replaceWith('<button data-button="start">Start</button>');
};

PomodoroTimer.prototype.resetCount = function (event) {
  event.preventDefault();
  clearInterval(this.interval);
  this.time = 1500000;
  this.displayCount();
};