
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
        $title = "Order #: $directoryId, Page $currentPage of $numPages"
        # create montage for page
        $tmpImage = "$tmpRoot$($directoryId)_$($i).png"
        $command = "@magick montage -tile $tile -resize $resize -frame 5 -pointsize 24 -geometry +5+5 -title ""$title"" $imageList  $tmpImage"
        Write-Host $command
        $tmpFile = "$tmpRoot$directoryId.bat"
        Set-Content -Path $tmpFile -Value $command
        Start-Process -NoNewWindow -Wait $tmpFile
        Write-Host "Printing..."
        Start-Sleep -s 1
        Start-Process  -Wait C:\windows\system32\mspaint.exe -Arg "/p $tmpImage /pt $printer"
        #    Start-Process -NoNewWindow -FilePath magick.exe -ArgumentList 'montage --% -tile $tile -frame 5  -geometry +4+4 ( $imageList ) montage.png"
    }
    Write-Host "Complete"
    Write-Host ""
    Write-Host ""
}