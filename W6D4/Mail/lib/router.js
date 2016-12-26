class Router {
  constructor(node, routes) {
    this.node = node;
    this.routes = routes;
  }

  start() {
    this.render();

    window.addEventListener('hashchange', event => {
      this.render();
    });
  }

  activeRoute() {
    let currRoute = window.location.hash.slice(1);
    return this.routes[currRoute];
  }

  render() {
    this.node.innerHTML = '';
    let component = this.activeRoute();

    if (component) {
      this.node.innerHTML = '';
      this.node.appendChild(component.render());
    } else {
      this.node.innerHTML = '';
    }
  }
}

module.exports = Router;
