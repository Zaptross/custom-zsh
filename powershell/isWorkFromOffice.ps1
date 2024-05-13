# $isWorkFromOfficeSSID = ""
function _netname() { return (get-netconnectionProfile).Name }
function _isWFO() {
	$netName = _netName
	if ($netName -eq $isWorkFromOfficeSSID) {
		return $true
	}
	return $false
}