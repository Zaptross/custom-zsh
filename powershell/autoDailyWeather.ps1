# $autoDailyWeather=""
function wttr () {
  param (
    [string] $location = "narangba"
  )
  curl "wttr.in/$location"
}

CreateOnceDaily -name "daily-weather" -action {
  if (_isWFO) {
    wttr $autoDailyWeather
  }
  else {
    wttr
  }
}