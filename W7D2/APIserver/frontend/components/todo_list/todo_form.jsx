import {uniqueId} from '../../util/id_generator';
import React from 'react';


class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: "",
      done: false
    };
    
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(property) {
    return e => this.setState({[property]: e.target.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    const todo = Object.assign({}, this.state, { id: uniqueId() });
    this.props.receiveTodo(todo);
    this.setState({
      title: "",
      body: ""
    }); // reset form
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>Title:
          <input value={this.state.title} onChange={this.update('title')} required/>
        </label>

        <br/><br/>

        <label>Body:<br/>
          <textarea value={this.state.body} onChange={this.update('body')} required></textarea>
        </label>
         
        <br/><br/>
        
        <button>Create Todo!</button>
      </form>
    );
  }
};

export default TodoForm;