// require xpress and paht file folder
var express = require('express');
var path    = require('path');

// create touter object
var router = express.Router();
// export router object
module.exports =router;

// home route sig in for the moment
router.get('/', function(req, res) {
  res.render('pages/login',{
    title: 'Login'
  });
});

router.get('/signup', function(req, res){
  res.render('pages/signup');
});

router.get('/home', function(req, res){
  res.render('pages/index');
});

router.post('/login', function(req, res){
  console.log("hello i enter log in");
  let body = req.body.__emial;
  let noma = req.body.__password;
  console.log(body,noma);
  res.send('hello this is the router of login')
})

router.get('/tes', function(req, res){
  res.render('pages/test',{
    title:'teting the post'
  });
})

router.post('/tes', function(req, res){
  // let  body= req.body;
  // var  bodys = req.body;
  // if (body.empty()){
  //   console.log(bodys);}
  // console.log(body);
  res.send('testing'+req.body.name+req.body.email+req.body.message);
})
