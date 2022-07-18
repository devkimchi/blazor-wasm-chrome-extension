let page = document.getElementById('buttonDiv');

const kButtonColors = ['#3aa757', '#e8453c', '#f9bb2d', '#4688f1'];

function constructOptions(kButtonColors) {
  for (let item of kButtonColors) {
    let button = document.createElement('button');
    button.className = 'color-button';
    button.style.backgroundColor = item;
    button.style.padding = '10px';

    button.addEventListener('click', function() {
      chrome.storage.sync.set({color: item})
      .then(() => {
        console.log('color is ' + item);
      })
    });
    page.appendChild(button);
  }
}

constructOptions(kButtonColors);