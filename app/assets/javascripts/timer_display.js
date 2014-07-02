window.TimerDisplay = {
  initialize: function () {
    $(document).one('click', "[data-behavior=pomodoro]",  this.displayPomodoro.bind(this));
  },

  displayPomodoro: function () {
    var $timerDiv = $("<div data-content='pomodoro'>");
    var $html = $(JST['templates/pomodoro']());
    $timerDiv.append($html);
    new PomodoroTimer($timerDiv);
    $("[data-container=timer]").append($timerDiv);
  }
};