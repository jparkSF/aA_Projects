export const fetchTodos = () => (
    $.ajax({
      method: 'GET',
      url: '/api/todos'
    })
  );

export const fetchTodo = (id) => (
    $.ajax({
        method: 'GET',
        url: '/api/todos/${id}'
    })
); 