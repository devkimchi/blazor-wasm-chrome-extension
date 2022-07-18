# Blazor WASM Browser Extension Sample #

This provides sample codes for a cross-browser extension app built on Blazor WASM. This sample app originally started for building a Chrome extension with Blazor WASM, but it now does the cross-browser support including Chromium-based browsers and Mozilla FireFox.


## Acknowledgement ##

This sample code includes [Mozilla](https://mozilla.org/)'s [WebExtension `browser` API Polyfill](https://github.com/mozilla/webextension-polyfill), which is licensed under [MPL 2.0](https://github.com/mozilla/webextension-polyfill/blob/master/LICENSE).


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

1. Register the extension to your Chromium-based browser like [Chrome](https://www.google.com/chrome/) or [Edge](https://www.microsoft.com/edge?WT.mc_id=dotnet-70466-juyoo), or [Mozilla FireFox](https://www.mozilla.org/firefox/).
1. Visit any website on [https://developer.chrome.com](https://developer.chrome.com/), [https://developer.mozilla.org](https://developer.mozilla.org/) or [https://docs.microsoft.com](https://docs.microsoft.com/?WT.mc_id=dotnet-70466-juyoo).
1. Run the extension by clicking the icon at the top of your web browser.
