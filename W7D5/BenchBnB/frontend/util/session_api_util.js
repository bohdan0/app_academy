export const signup = (data) => (
  $.ajax({
    url: `/api/users`,
    method: `POST`,
    data: data
  })
);

export const login = (data) => (
  $.ajax({
    url: `/api/session`,
    method: `POST`,
    data: data
  })
);

export const logout = () => (
  $.ajax({
    url: `/api/session`,
    method: `DELETE`
  })
);
