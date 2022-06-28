(Get-Content -Path ./published/wwwroot/_framework/blazor.webassembly.js -Raw) -replace "_framework/", "framework/" | Set-Content -Path ./published/wwwroot/_framework/blazor.webassembly.js -Force

(Get-Content -Path ./published/wwwroot/index.html -Raw) -replace "_framework/", "framework/" | Set-Content -Path ./published/wwwroot/index.html -Force

mv ./published/wwwroot/_framework ./published/wwwroot/framework

cp ./published/wwwroot/index.html ./published/wwwroot/popup.html
cp ./published/wwwroot/index.html ./published/wwwroot/options.html

(Get-Content -Path ./published/wwwroot/popup.html -Raw) -replace "js/main.js", "js/popup.js" | Set-Content -Path ./published/wwwroot/popup.html -Force

(Get-Content -Path ./published/wwwroot/options.html -Raw) -replace "js/main.js", "js/options.js" | Set-Content -Path ./published/wwwroot/options.html -Force
