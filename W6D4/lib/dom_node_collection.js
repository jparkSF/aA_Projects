class DomNodeCollection {
  constructor(nodes){
    this.nodes = nodes;
  }


  html(arg){

    if (arg){
      this.each((el) => {
        el.innerHTML = arg;
      });
    } else {
      return arg[0].innerHTML;
    }
  }

  empty(){
    this.html("");
  }

  append(children) {
    if (this.nodes.length === 0) return;

    if (typeof children === 'object' &&
        !(children instanceof DomNodeCollection)) {

      children = $l(children);
    }

    if (typeof children === "string") {
      this.each((node) => {
        node.innerHTML += children;
      });
    } else if (children instanceof DomNodeCollection) {

      this.each((node) => {

        children.each((childNode) => {
          node.appendChild(childNode.cloneNode(true));
        });
      });
    }
  }

  attr(){

  }

  addClass(){

  }

  removeClass(){

  }

  children(){

  }

  parent(){

  }

  find(){

  }
  remove(){
    
  }
}


module.exports = DOMNodeCollection;
