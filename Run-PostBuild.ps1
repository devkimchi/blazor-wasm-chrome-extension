# Run-PostBuild.ps1

function Update-FileContent {
    param (
        [string] $Filename,
        [string] $Value1,
        [string] $Value2
    )

    $content = Get-Content -Path $Filename -Raw
    $updated = $content -replace $Value1, $Value2
    Set-Content -Path $Filename -Value $updated -Force
}

Update-FileContent `
    -Filename "./published/wwwroot/_framework/blazor.webassembly.js" `
    -Value1 "_framework" `
    -Value2 "framework"

Update-FileContent `
    -Filename "./published/wwwroot/index.html" `
    -Value1 "_framework" `
    -Value2 "framework"

mv ./published/wwwroot/_framework ./published/wwwroot/framework

cp ./published/wwwroot/index.html ./published/wwwroot/popup.html
cp ./published/wwwroot/index.html ./published/wwwroot/options.html

Compress-Archive -Path ./published/wwwroot/* -DestinationPath ./published/wwwroot/wwwroot.zip -Force
