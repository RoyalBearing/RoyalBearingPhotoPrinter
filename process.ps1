
function Print-RBPhotos {
    param([string] $orderId)

    # get list of images in directory
    $orderDir = "$rootDir$directoryId\"
    Write-Host "Order dir: $orderDir"
    if (Test-Path -Path $orderDir) {

    } else {
        Write-Host "Folder: $orderDir not found!"
        return
    }
    $images = Get-ChildItem $orderDir -Filter $imagePrefixFilter*.jpg

    # how many page do we need?
    $count = $images.Count
    $numPages = [Math]::Ceiling($count/$maxPerPage)
    Write-Host "Found: $count images"
#    Write-Host "Processing: $numPages pages"

    Set-Location -Path $orderDir
    #loop through pages
    for ($i=0; $i -lt $numPages; $i++) {
        $pageStart = $i*$maxPerPage
        $pageEnd = ($i+1)*$maxPerPage-1
        $currentPage = $i+1
        Write-Host "Processing page: $currentPage of $numPages"
        $imagesForPage = $images[$pageStart..$pageEnd]
        $imageList = ""
        foreach ($image in $imagesForPage) {
            $imageList = "$imageList $image"
        }
        # create montage for page
        $tmpImage = "C:\Git\PhotoPrinter\tmp\$directoryId_$i.jpg"
        $command = "@magick montage -tile $tile -size $resize -frame 5  -geometry +5+5   $imageList  $tmpImage"
        $tmpFile = "C:\\Git\\PhotoPrinter\\tmp\\$directoryId.bat"
        Set-Content -Path $tmpFile -Value $command
        Start-Process -NoNewWindow -Wait $tmpFile
        Write-Host "Printing..."
        Start-Process  C:\windows\system32\mspaint.exe -Arg "/p $tmpImage /pt TravisOffice"
        #    Start-Process -NoNewWindow -FilePath magick.exe -ArgumentList 'montage --% -tile $tile -frame 5  -geometry +4+4 ( $imageList ) montage.png"
    }
    Write-Host "Complete"
    Write-Host ""
    Write-Host ""
}