. .\config.ps1
. .\process.ps1



Do
{
    # get directory id from args
    Write-Host "Ready for scanning..."
    $directoryId = Read-Host
    if ($directoryId -ne "exit") {

        Write-Host "Processing $directoryId"

        Print-RBPhotos $directoryId

    }

}
    While ($directoryId -ne "exit")
