class DOMNodeCollection {
  constructor(arr) {
    this.elements = arr;
  }

  show() {
    this.each(el => {
      console.log(el);
    });
  }

  each(cb) {
    this.elements.forEach(el => cb(el));
  }

  html(str) {
    if (str) {
      this.each(el => {
        el.innerHTML = str;
      });
    } else {
      return this.elements[0].innerHTML;
    }
  }

  empty() {
    this.each(el => {
      el.innerHTML = "";
    });
  }

  append(children) {
    children.each(child => {
      this.each(el => {
        el.innerHTML += child.outerHTML;
      });
    });
  }

  attr(name, value) {
    if (name && value) {
      this.each(el => {
        el.setAttribute(name, value);
      });
    } else {
      return this.elements[0].getAttribute(name);
    }
  }

  addClass(name) {
    this.each(el => {
      el.className += ` ${name}`;
    });
  }

  removeClass(name) {
    this.each(el => {
      el.classList.remove(name);
    });
  }

  children() {
    let arr = [];
    this.each(el => {
      arr.push(el.children);
    });

    return new DOMNodeCollection(arr);
  }

  parent() {
    let arr = [];
    this.each(el => {
      arr.push(el.parentNode);
    });

    return new DOMNodeCollection(arr);
  }

  find(selector) {
    let arr = [];
    this.each(el => {
      let nodeList = el.querySelectorAll(selector);
      arr = arr.concat(Array.from(nodeList));
    });
    console.log(arr);
    return new DOMNodeCollection(arr);
  }

  remove() {
    this.html('');
    this.elements = [];
  }

  on(type, cb) {
    this.each(el => {
      el.cb = cb;
      el.addEventListener(type, cb);
    });
  }

  off(type) {
    this.each(el => {
      el.removeEventListener(type, el.cb);
    });
  }

}

module.exports = DOMNodeCollection;
