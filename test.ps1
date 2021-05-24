# config
$rootDir = "Z:\"
$maxPerPage = 4
$tile = "x2"

# get directory id from args
$directoryId=$args[0]
write-host $directoryId


# get list of images in directory
$orderDir = "$rootDir$directoryId\"
$images = Get-ChildItem $orderDir -Filter *.jpeg
$count = $images.Count
$numPages = [Math]::Ceiling($count/$maxPerPage)
Write-Host "Found: $count images"
Write-Host "We need: $numPages pages"

# determine number of pages

#loop through pages

  # create montage for page


#print all montages

#clean up montages