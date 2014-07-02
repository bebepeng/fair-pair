function displayTime (time) {
  var min = ('0' + Math.floor(time/60000)).slice(-2);
  var sec = ('0' + Math.floor((time%60000)/1000)).slice(-2);
  return min + ":" + sec
}