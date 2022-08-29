function handleRuntimeOnInstalled(details) {
  browser.storage.sync.set({color: '#3aa757'})
  .then(() => {
    console.log("The color is green.");
  });

  // browser.declarativeContent.onPageChanged.removeRules(undefined)
  // .then(() => {
  //   browser.declarativeContent.onPageChanged.addRules([{
  //     conditions: [
  //       new browser.declarativeContent.PageStateMatcher({
  //         pageUrl: { hostEquals: 'developer.chrome.com' },
  //       }),
  //       new browser.declarativeContent.PageStateMatcher({
  //         pageUrl: { hostEquals: 'docs.microsoft.com' },
  //       })
  //     ],
  //     actions: [new browser.declarativeContent.ShowPageAction()]
  //   }]);
  // });
}

function handleTabs() {
  browser.tabs.query({active: true, currentWindow: true})
  .then((tabs) => {
    console.log(tabs[0].url);
    
    let matched = tabs[0].url.includes('developer.chrome.com') || tabs[0].url.includes('developer.mozilla.org') || tabs[0].url.includes('docs.microsoft.com');
    if (matched) {
      browser.pageAction.show(tabs[0].id);
    } else {
      browser.pageAction.hide(tabs[0].id);
    }
  });
}

browser.runtime.onInstalled.addListener(handleRuntimeOnInstalled);
browser.tabs.onActivated.addListener(handleTabs);
browser.tabs.onHighlighted.addListener(handleTabs);
browser.tabs.onUpdated.addListener(handleTabs);
