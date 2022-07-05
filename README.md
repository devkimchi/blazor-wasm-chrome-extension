# Blazor WASM Chrome Extension Sample #

This provides sample codes for a Chrome Extension app built on Blazor WASM.


## Getting Started ##

1. Build the app

    ```bash
    dotnet build .
    ```

1. Publish the app

    ```bash
    dotnet publish ./src/ChromeExtensionV2/ -c Release -o published
    ```

1. Run PowerShell script

    ```powershell
    ./Run-PostBuild.ps1
    ```

1. Register the extension to your Chromium-based browser like Chrome or Edge
1. Visit any website on https://developer.chrome.com or https://docs.microsoft.com
1. Run the extension by clicking the icon at the top of your web browser
