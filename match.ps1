# load the list of expected files
$expectedList = Get-Content expected

# tells you which files are missing
foreach ($expected in $expectedList) {
    If (!(Test-Path $expected)) { "missing file:    " + $expected}
}

# tells you what you have too much of, -Name is necessary to just fetch the names
foreach ($file in Get-ChildItem -Name) {
    $wasExpected = $false
    foreach ($expected in $expectedList) {
        if ($file -eq $expected) { 
            $wasExpected = $true
        }
    }
    if (!$wasExpected) { "unexpected file: " + $file}
}
"" # to create an empty line
Pause