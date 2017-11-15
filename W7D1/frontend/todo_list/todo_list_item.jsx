import React from 'react';


class TodoListItem extends React.Component {
  constructor(props){
    super(props);
  }

  

 
  render(){
    const {todo, removeTodo} = this.props;
    return(
      <div>
        <li>{todo.title}</li>
        <button onClick={() => removeTodo(todo)}>Delete</button>
     
      </div>
    );
  }
}




export default TodoListItem;