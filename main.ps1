#Define Registry paths, key(s) and variables
#############################################
# path
$regPathAU = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization'
#############################################

# Test AU path, if path exists then create keys, else create path then create keys
# Bandwidth in Hexadecimal KiloBYTES (64 = Decimal 100KB = .8Mbps)
# I doubled the value for the Foreground speed
if (Test-Path -Path $regPathAU) {
    'Name,Value,Type
    DOMaxBackgroundDownloadBandwidth,510,DWORD' | 
        ConvertFrom-Csv |
        Set-ItemProperty -Path $regPathAU -Name { $_.Name } 
      $response = 'AU Registry key created.'
      Write-Output $response
    } else {
        New-Item -Path $regPathAU -Force
            $response = 'Created AU registry path.'
            Write-Output $response
        'Name,Value,Type
        DOMaxBackgroundDownloadBandwidth,510,DWORD' | 
            ConvertFrom-Csv |
            Set-ItemProperty -Path $regPathAU -Name { $_.Name } 
        $response = 'AU Registry key created.'
        Write-Output $response
    }
