function _jsonInterrogate() {
  param (
    [string] $filePath,
    [string] $key
  )

 $x = Get-Content $filePath | ConvertFrom-Json
 Write-Output $x.$key
}

Set-Alias -Name j -Value _jsonInterrogate