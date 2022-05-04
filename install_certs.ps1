<#
# Patrick McCorkell
# April 2021
# US Naval Academy
# Robotics and Control TSD
#>

$root_files = Get-ChildItem -Path C:\CAs\Roots\*.crt
$pfxPass = read-host "Password" -assecurestring
foreach ($certPath in $root_files)
{
$pfx = new-object System.Security.Cryptography.X509Certificates.X509Certificate2 
$pfx.import($certPath,$pfxPass,"Exportable,PersistKeySet") 

$store = new-object System.Security.Cryptography.X509Certificates.X509Store(
[System.Security.Cryptography.X509Certificates.StoreName]::Root,
"localmachine"
)

$store.open("MaxAllowed") 
$store.add($pfx) 
$store.close()
Write-Host "Added to Trusted Root store: " $certPath
}

$intermediate_files = Get-ChildItem -Path C:\CAs\Other\*.crt
foreach ($certPath in $intermediate_files)
{
$pfx = new-object System.Security.Cryptography.X509Certificates.X509Certificate2 
$pfx.import($certPath,$pfxPass,"Exportable,PersistKeySet") 

$store = new-object System.Security.Cryptography.X509Certificates.X509Store(
[System.Security.Cryptography.X509Certificates.StoreName]::CertificateAuthority,
"localmachine"
)

$store.open("MaxAllowed") 
$store.add($pfx) 
$store.close()
Write-Host "Added to Certificate store: " $certPath
}
# The answer to the question.