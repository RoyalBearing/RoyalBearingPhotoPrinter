# config
$rootDir = "Z:\"


# get directory id from args
$directoryId=$args[0]
write-host $directoryId


# get list of images in directory
$orderDir = "$rootDir$directoryId\"
Get-ChildItem $orderDir |
        Foreach-Object {
            $content = Get-Content $_.FullName
            Write-Host $_.FullName
        }

# determine number of pages

#loop through pages

  # create montage for page


#print all montages

#clean up montages