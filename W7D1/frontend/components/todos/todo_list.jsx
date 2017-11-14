import React from 'react';
import TodoListItem from '../../todo_list/todo_list_item';
import TodoForm from '../todo_list/todo_form';

class TodoList extends React.Component{
  constructor(props){
    super(props);
  }

  render(){
    return(
      <div>
        <TodoForm receiveTodo={this.props.receiveTodo}/>
        <ul>
          {
            this.props.todos.map((todo) => (
              <TodoListItem 
                key={todo.id} 
                receiveTodo={this.props.receiveTodo} 
                todo={todo}/>
            ))
          }
        </ul>
      </div>
    );
  }
}

export default TodoList;
