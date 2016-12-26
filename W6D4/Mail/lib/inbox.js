const Inbox = {
  render: function() {
    let container = document.createElement('ul');
    container.className = 'messages';
    container.innerHTML = 'An Inbox Message';
    return container;
  }
};

module.exports = Inbox;
