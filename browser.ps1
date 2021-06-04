# How long to wait between open site commands
$waitBetweenSitesS = 7;

# How long to wait after a browser's last site before closing its window
$waitBeforeBrowserClose = 7;

# How long to wait between browsers
$waitBetweenBrowsers = 7;

$sites =
"https://www.google.com/maps/",
"https://www.nytimes.com/",
"https://www.nbcnews.com/"

# Start of the script

#IEXPLORE
$Ie = New-Object -ComObject InternetExplorer.Application
$ie.visible = $true
foreach ($site in $sites){
    $Ie.Navigate($site)
    start-sleep -seconds $waitBetweenSitesS
}

Start-Sleep -seconds $waitBetweenBrowsers

#CHROME
$process = Start-Process -PassThru "chrome" "about:blank"
foreach ($site in $sites){
    Start-Process "chrome" $site
    start-sleep -seconds $waitBetweenSitesS
}