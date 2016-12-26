const DOMNodeCollection = require('./dom_node_collection.js');

const $l = selector => {

  if (selector instanceof Function) {
    let waitForPage = [];
    waitForPage.push(selector);

    const int = setInterval(() => {
      if (document.readyState === 'complete') {
        clearInterval(int);
        waitForPage.forEach(func => {
          func();
        });
      }
    }, 100);

  } else {
    let arr = [];

    if (selector instanceof HTMLElement) {
      arr.push(selector);
    } else {
      let nodeList = document.querySelectorAll(selector);
      arr = Array.from(nodeList);
    }

    return new DOMNodeCollection(arr);
  }
};

window.$l = $l;
