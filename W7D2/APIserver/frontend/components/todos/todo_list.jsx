import React from 'react';
import TodoListItem from '../../todo_list/todo_list_item';
import TodoForm from '../todo_list/todo_form';
import {fetchTodos} from '../../actions/todo_action';

class TodoList extends React.Component{
  constructor(props){
    super(props);
  }

  // componentDidMount(){
  //   this.props.fetchTodos();
  // }

  render(){
    return(
      <div>
        <TodoForm receiveTodo={this.props.receiveTodo}/>
        <ul>
          {
            this.props.todos.map((todo) => (
              <TodoListItem 
                key={todo.id} 
                removeTodo={this.props.removeTodo}
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
