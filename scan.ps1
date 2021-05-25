. .\process.ps1
# config
$rootDir = "Y:\Photos\"
$maxPerPage = 6
$tile = "x2"
$resize = "320x320"
$imageMagickExe = "magick.exe"


Do
{
    # get directory id from args
    Write-Host "Ready for scanning..."
    $directoryId = Read-Host


    Write-Host "Processing $directoryId"

    Print-RBPhotos $directoryId
}
    While (1 -le 2)
