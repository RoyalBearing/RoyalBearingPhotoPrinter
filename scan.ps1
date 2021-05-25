. .\process.ps1
# config
$rootDir = "Z:\"
$maxPerPage = 6
$tile = "x2"
$resize = "320x320"
$imageMagickExe = "magick.exe"

# get directory id from args
$directoryId=$args[0]
write-host $directoryId




Print-RBPhotos $directoryId

