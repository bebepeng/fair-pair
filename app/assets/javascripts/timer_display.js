window.TimerDisplay = {
  initialize: function () {
    $(document).one('click', "[data-behavior=pomodoro]",  this.displayPomodoro.bind(this));
    $(document).one('click', "[data-behavior=chess]",  this.displayChess.bind(this));
  },

  displayPomodoro: function () {
    var $timerDiv = $("<div data-content='pomodoro'>");
    var $html = $(JST['templates/pomodoro']());
    $timerDiv.append($html);
    new PomodoroTimer($timerDiv);
    $("[data-container=timer]").append($timerDiv);
  },

  displayChess: function () {
    var $timerDiv = $("<div data-content='chess'>");
    var $html = $(JST['templates/chess']());
    $timerDiv.append($html);
    new ChessTimer($timerDiv);
    $("[data-container=timer]").append($timerDiv);
  }

};