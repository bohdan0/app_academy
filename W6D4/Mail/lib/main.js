const Router = require('./router.js');
const Inbox = require('./inbox.js');

document.addEventListener('DOMContentLoaded', () => {
  let nodes = Array.from(document.querySelectorAll('.sidebar-nav li'));
  nodes.forEach(node => {
    node.addEventListener('click', (event) => {
      let location = event.currentTarget.innerText.toLowerCase();
      window.location.hash = location;
    });
  });

  let contentNode = document.querySelector('.content');
  const router = new Router(contentNode, Routes);
  router.start();
});


const Routes = {
  inbox: Inbox
};
