
function Print-RBPhotos {
    param([string] $orderId)

    # get list of images in directory
    $orderDir = "$rootDir$directoryId\"
    $images = Get-ChildItem $orderDir -Filter *.jpeg

    # how many page do we need?
    $count = $images.Count
    $numPages = [Math]::Ceiling($count/$maxPerPage)
    Write-Host "Found: $count images"
    Write-Host "We need: $numPages pages"

    Set-Location -Path $orderDir
    #loop through pages
    for ($i=0; $i -lt $numPages; $i++) {
        $pageStart = $i*$maxPerPage
        $pageEnd = ($i+1)*$maxPerPage-1
        Write-Host "Handling page: $i, [$pageStart - $pageEnd]"
        $imagesForPage = $images[$pageStart..$pageEnd]
        $imageList = ""
        foreach ($image in $imagesForPage) {
            $imageList = "$imageList $image"
        }
        Write-Host $imageList
        # create montage for page
        Write-Host "magick  montage  $imageList montage22.png"
        $MagickParameters += 'montage'
        $MagickParameters += " ( $imageList ) "
        $MagickParameters += 'montage22.png'
        #    &'magick' $MagickParameters
        $command = "magick montage   $imageList  montage22.png"
        $tmpFile = "C:\\Git\\PhotoPrinter\\tmp\\$directoryId.bat"
        Set-Content -Path $tmpFile -Value $command
        Start-Process -NoNewWindow -Wait $tmpFile
        Start-Process  C:\windows\system32\mspaint.exe -Arg "/p $orderDir\montage22.png /pt TravisOffice"
        #    Start-Process -NoNewWindow -FilePath magick.exe -ArgumentList 'montage --% -tile $tile -frame 5  -geometry +4+4 ( $imageList ) montage.png"
    }
}