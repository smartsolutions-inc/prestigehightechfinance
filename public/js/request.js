var login = new XMLHttpRequest();
login.open('GET', 'https://learnwebcode.github.io/json-example/animals-1.json')
login.onload= function(){
  console.log(login.responseText);
};
login.send();
// login.open('POST', );
