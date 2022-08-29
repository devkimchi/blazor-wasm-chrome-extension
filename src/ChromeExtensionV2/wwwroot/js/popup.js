let changeColor = document.getElementById('changeColor');

browser.storage.sync.get('color')
.then((data) => {
  changeColor.style.backgroundColor = data.color;
  changeColor.setAttribute('value', data.color);
});

changeColor.onclick = function(element) {
  let color = element.target.value;

  browser.tabs.query({active: true, currentWindow: true})
  .then((tabs) => {
    let matched = tabs[0].url.includes('developer.chrome.com') || tabs[0].url.includes('developer.mozilla.org') || tabs[0].url.includes('docs.microsoft.com');
    if (matched) {
      browser.tabs.executeScript(
        tabs[0].id,
        {code: 'document.body.style.backgroundColor = "' + color + '";'});
    } else {
      console.log('URL not matched');
    }
  });
};