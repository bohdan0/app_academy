document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items
  const addPlace = (el) => {
    el.preventDefault();

    const ul = document.getElementById('sf-places');
    const li = document.createElement('li');
    const input = document.getElementsByClassName('favorite-input')[0];

    li.textContent = input.value;
    ul.appendChild(li);

    input.value = "";
  };
  // --- your code here!
  document.querySelectorAll('.favorite-submit').forEach((button) => {
    button.addEventListener('click', addPlace);
  });


  // adding new photos
  const addForm = (e) => {
    const form = document.getElementsByClassName('photo-form-container')[0];
    form.className = "";
    form.className = "photo-form-container";


  };
  // --- your code here!
  document.querySelectorAll('.photo-show-button').forEach((button) => {
    button.addEventListener('click', addForm);
  });


  const addPhoto = (e) => {
    e.preventDefault();

    const ul = document.getElementsByClassName('dog-photos')[0];
    const li = document.createElement('li');
    const img = document.createElement('img');
    const url = document.getElementsByClassName('photo-url-input')[0];

    img.src = url.value;
    li.append(img);
    ul.appendChild(li);

    url.value = "";
    const form = document.getElementsByClassName('photo-form-container')[0];
    form.className = 'photo-form-container hidden';
  };

  document.querySelectorAll('.photo-url-submit').forEach((button) => {
    button.addEventListener('click', addPhoto);
  });


});
