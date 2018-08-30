#Set-ExecutionPolicy RemoteSigned -Force
#Set-ExecutionPolicy Unrestricted -Force
Set-ExecutionPolicy Unrestricted -Scope CurrentUser
#Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
function Get-nodejsinstall {
    Write-Host --------nodejs--installation--starts--------- -ForegroundColor Green
    cd c:\
    mkdir nodejs >> C:\log.txt
    $url = "https://nodejs.org/dist/v10.1.0/node-v10.1.0-x64.msi"
    $output = "c:\nodejs"
    Import-Module BitsTransfer >> C:\log.txt
    Start-BitsTransfer -Source $url -Destination $output >> C:\log.txt
    cd nodejs >> C:\log.txt
    #Write-Host --silent--installation--starts --- -ForegroundColor Green
    msiexec /i "node-v10.1.0-x64.msi" /passive /norestart ADDLOCAL=ALL /quiet
    sleep 100
    Write-Host  ----nodejs--installation--succeeded---------- -ForegroundColor Green
    cd c:\
}
function Get-pythoninstall
{
    cd c:\
    Write-Host --------python--installation--starts--------- -ForegroundColor Green
    mkdir c:\python >> C:\log.txt
    $url = "https://www.python.org/ftp/python/2.7.14/python-2.7.14.amd64.msi"
    $output = "c:\python"
    Import-Module BitsTransfer >> C:\log.txt
    Start-BitsTransfer -Source $url -Destination $output >> C:\log.txt
    cd c:\python >> C:\log.txt
    #Write-Host --silent--installation--starts --- -ForegroundColor Green
    msiexec /i "python-2.7.14.amd64.msi" /passive /norestart ADDLOCAL=ALL /quiet
    sleep 100
    Write-Host  ----python--installation--succeeded---------- -ForegroundColor Green
    cd c:\
}

$varpython = echo $env:PATH | Select-String -Pattern "Python27"
$varNode = echo $env:PATH | Select-String -Pattern "nodejs"
$null = ""
if (($varNode -eq $null) -and ($varpython -eq $null))
{
     $result1 = Get-nodejsinstall
     $result2= Get-pythoninstall
    
}
elseif(($varNode -ne $null) -and ($varpython -eq $null))
{
    $nvar = node -v
    $var = $max -replace '[v]',''
    if($nvar -ge 8.10.0)
    {
    Write-Host "Stopping script, nodejs already installed" -ForegroundColor Red
    }
    else
    {
    $result3 = Get-nodejsinstall
    
     }
    $result4= Get-pythoninstall
   
  
 
}
elseif(($varNode -eq $null) -and ($varpython -ne $null))
{
    Write-Host "Stopping script, python already installed" -ForegroundColor Red
    $result5 = Get-nodejsinstall
 
}
else
{
    Write-Host "Stopping script, nodejs and python already installed" -ForegroundColor Red
}
