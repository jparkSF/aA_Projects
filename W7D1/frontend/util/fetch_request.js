export const URL = '/api/todos';
export const fetchTodos = () => (
    $.ajax({
        method: 'GET',
        url: URL
    })
);