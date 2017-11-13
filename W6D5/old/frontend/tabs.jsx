import React from 'react';

class Tabs extends React.Component{
  constructor(){
    super();
    this.state = {
      title: "",
      content: "",
      index: 0
    };

  }


  render(){

    return(
      <div  className="tab-widget">
        <ul className="headers">
          <h1 className="header-title" onClick={this.setTab({index:0, title:"tab1", content:"content1"}).bind(this)}>Tab1</h1>
          <h1 className="header-title" onClick={this.setTab({index:1, title:"tab2", content:"content2"}).bind(this)}>Tab2</h1>
          <h1 className="header-title" onClick={this.setTab({index:2, title:"tab3", content:"content3"}).bind(this)}>Tab3</h1>
        </ul>
        <article className="content">{this.state.content}</article>
      </div>
    );
  }

  setTab(args){
    return () => {
      this.setState({index:args.index, content: args.content});
      // this.setState({content: args.content});
    };

  }

}

export default Tabs;
