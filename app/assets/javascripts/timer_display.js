window.TimerDisplay = {
  initialize: function () {
    $(document).on('click', "[data-behavior=pomodoro]",  this.displayPomodoro.bind(this));
    $(document).on('click', "[data-behavior=chess]",  this.displayChess.bind(this));
    $(document).on('click', "[data-behavior=custom]",  this.displayCustom.bind(this));
    $(document).on('submit', "[data-behavior=create-timer]", this.chooseATimer.bind(this));
  },

  displayPomodoro: function (minutes) {
    var $timerDiv = $("<div data-content='pomodoro'>");
    var $html = $(JST['templates/pomodoro']());
    $timerDiv.append($html);
    new PomodoroTimer($timerDiv, minutes);
    $("[data-container=timer]").html($timerDiv);
  },

  displayChess: function (minutes) {
    var $timerDiv = $("<div data-content='chess'>");
    var $html = $(JST['templates/chess']());
    $timerDiv.append($html);
    new ChessTimer($timerDiv, minutes);
    $("[data-container=timer]").html($timerDiv);
  },

  displayCustom: function () {
    var $timerDiv = $("<div data-content='chess'>");
    var $html = $(JST['templates/custom']());
    $timerDiv.append($html);
    $("[data-container=timer]").html($timerDiv);
  },

  chooseATimer: function (event) {
    event.preventDefault();

    var timer_data = {};
    timer_data.break = event.target["0"].checked;
    timer_data.pair = event.target["1"].checked;
    timer_data.millisecs = parseInt(event.target["2"].value)*60000;

    if(timer_data.break === true){
      $("[data-container=timer]").html('');
      this.displayPomodoro(timer_data.millisecs);
    }
    else if (timer_data.pair === true) {
      $("[data-container=timer]").html('');
      this.displayChess(timer_data.millisecs);
    }
  }

};