function _getTodaysDate () { return (Get-Date).ToString("yyyy-MM-dd") }
function _compareFileContentToToday() {
  param (
    [string] $filePath
  )

	$currentDate = _getTodaysDate
	$fileContent = (Get-Content -Path $filePath -Raw)

  if ($fileContent) {
      $fileContent = $fileContent.Trim()
  }

	if ($fileContent -eq $currentDate) {
		return $true
	}
 else {
		return $false
	}
}

function CreateOnceDaily {
  param (
    [string] $name,
    [scriptblock] $action,
    [switch] $force = $false
  )
  # ensure daily exists
  $dailyExists = Test-Path -Path "~/.daily/" 
  if (-not $dailyExists) {
    mkdir "~/.daily"
  }

  # ensure last action date exists
  $lastActionDateFilePath = "~/.daily/last_$name"
  $lastActionFileExists = Test-Path -Path $lastActionDateFilePath
  if (-not $lastActionFileExists) {
    Write-Output "" >  $lastActionDateFilePath
  }

  $isToday = $(_compareFileContentToToday $lastActionDateFilePath) -or $force
  if (-not $isToday) {
    & $action
    Write-Output $(_getTodaysDate) > $lastActionDateFilePath
  }
  else {
    Write-Host "$(Write-Host -ForegroundColor Green -NoNewline $name) has already been run today."
  }
}
