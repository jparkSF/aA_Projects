import React from 'react';
import merge from 'lodash/merge';


class TodoListItem extends React.Component {
  constructor(props){
    super(props);
    this.toggleTodo = this.toggleTodo.bind(this);

  }

  toggleTodo(e){
 
    e.preventDefault();
    const toggledTodo = merge(
      {}, 
      this.props.todo,
      {done: !this.props.todo.done}
    );

    this.props.receiveTodo(toggledTodo);
  }

  render(){
    const {todo, removeTodo, receiveTodo} = this.props;
    return(
      <div>
        <li>{todo.title}  
        <button onClick={() => removeTodo(todo)}>Delete</button>
        <button onClick={this.toggleTodo}>{
          todo.done? "Undo" : "Done"
        }</button>
        </li>
      </div>
    );
  }
}




export default TodoListItem;