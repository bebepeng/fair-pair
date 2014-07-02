function displayTime (time) {
  var min = Math.floor(time/60000);
  var sec = Math.floor((time%60000)/1000);
  return min + ":" + sec
}