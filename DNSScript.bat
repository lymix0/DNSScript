@echo off

title DNS Check Script

color 0B

:start

echo This is a Batch Script to check DNS records for Domains.
echo:

echo Enter a domain name:
set /p domain=

echo ======Script is Loading======

echo:

echo Current date/time is %date%, %time%.
echo Results For %domain% MX / A / CNAME / DKIM / DMARC / PTR
echo %domain% / %date%, %time% >> log.txt

echo:

echo /////////// Results For  MX - A - CNAME ///////////
echo:
echo Checking MX Record [%domain%]
nslookup -type=mx %domain% 
echo.
echo ================================
echo:
echo Checking A Record [%domain%] 
nslookup -type=A %domain%
echo.
echo ================================
echo:
echo Checking CNAME Record %domain% 
nslookup -type=CNAME %domain%
echo.
echo /////////// Results For SPF - DKIM - DMARC - PTR ///////////
echo:
echo Checking SPF Record %domain% 
nslookup -type=TXT %domain%
echo.
echo ================================
echo:
echo Checking DKIM Record %domain% 
nslookup -type=TXT dk2016._domainkey.%domain%
echo.
echo ================================
echo:
echo Checking DMARC Record %domain% 
nslookup -type=TXT _dmarc.%domain%
echo.
echo ================================
echo:
echo Checking PTR Reverse DNS Lookup %domain% 
nslookup -type=PTR %domain%
echo.
echo ======End Of Script ======
echo.
echo Do you want to perform another check?
choice /C YN /M "Enter Y to continue or N to exit: "
if errorlevel 2 goto end

goto start
cmd >> mylog.txt
:end
echo Exiting script...
