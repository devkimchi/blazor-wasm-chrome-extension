# Build-Artifact.ps1
Param(
    [string]
    [Parameter(Mandatory=$false)]
    $PublishedPath = "published",

    [switch]
    [Parameter(Mandatory=$false)]
    $Help
)

function Show-Usage {
    Write-Output "    This runs the post build process to generate updated artifact
    Usage: $(Split-Path $MyInvocation.ScriptName -Leaf) ``
            [-PublishedPath <path to the artifact published>] ``
            [-Help]
    Options:
        -PublishedPath  The path where the publshed artifact is located. Default is `published`.
        -Help:          Show this message.
"

    Exit 0
}

# Show usage
$needHelp = $Help -eq $true
if ($needHelp -eq $true) {
    Show-Usage
    Exit 0
}

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

dotnet build .
dotnet publish ./src/ChromeExtensionV2 -c Release -o ./$PublishedPath

Update-FileContent `
    -Filename "./$PublishedPath/wwwroot/_framework/blazor.webassembly.js" `
    -Value1 "_framework" `
    -Value2 "framework"

Update-FileContent `
    -Filename "./$PublishedPath/wwwroot/index.html" `
    -Value1 "_framework" `
    -Value2 "framework"

mv ./$PublishedPath/wwwroot/_framework ./$PublishedPath/wwwroot/framework

cp ./$PublishedPath/wwwroot/index.html ./$PublishedPath/wwwroot/popup.html
cp ./$PublishedPath/wwwroot/index.html ./$PublishedPath/wwwroot/options.html

Compress-Archive -Path ./$PublishedPath/wwwroot/* -DestinationPath ./$PublishedPath/wwwroot/wwwroot.zip -Force
