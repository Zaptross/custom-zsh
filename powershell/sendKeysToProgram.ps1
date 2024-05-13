function _getProgramRef() {
  param (
    [string] $name
  )

  $progref = New-Object -ComObject wscript.shell;
  $exists = (Get-Process | Where-Object { $_.name -eq $name -and $_.mainWindowTitle }).Count

  if ($exists -ge 1) {
    return $progref
  }
  Write-Output "Failed to find window for: $name"
  return 1
}
function _foregroundProgram() {
  param (
    [string] $name
  )

  $prog = _getProgramRef($name)

  if ($prog -eq 1) { return $prog }

  $prog.AppActivate($name)
}
function _sendKeysToProgram() {
  param (
    [string] $name,
    [Parameter(ValueFromRemainingArguments = $true)][string[]] $keys
  )

  $prog = _getProgramRef($name)

  if ($prog -eq 1) { return $prog }

  $prog.AppActivate($name)
  Start-Sleep 1
  foreach ($k in $keys) {
    $prog.SendKeys($k)
    Start-Sleep .5
  }
}