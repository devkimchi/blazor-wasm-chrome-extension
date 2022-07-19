export function loadJs(sourceUrl) {
  if (sourceUrl.Length == 0) {
    console.error("Invalid source URL");
    return;
  }

  var tag = document.createElement('script');
  tag.src = sourceUrl;
  tag.type = "text/javascript";

  tag.onload = function () {
    console.log("Script loaded successfully - '" + sourceUrl + "'");
  }

  tag.onerror = function () {
    console.error("Failed to load script - '" + sourceUrl + "'");
  }

  document.body.appendChild(tag);
}
