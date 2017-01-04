export const fetchTodos = (suc, err) => {
  $.ajax({
    method: 'GET',
    url: 'api/todos'
  }).then(suc, err);
};

export const createTodo = (todo, suc, err) => {
  return $.ajax({
    method: 'POST',
    url: 'api/todos',
    data: { todo }
  }).then(suc, err);
};

export const updateTodo = (todo, suc, err) => {
  return $.ajax({
    method: 'PATCH',
    url: `api/todos/${todo.id}`,
    data: { todo }
  }).then(suc, err);
};

export const deleteTodo = (id, suc, err) => {
  return $.ajax({
    method: 'DELETE',
    url: `api/todos/${id}`
  }).then(suc, err);
};
