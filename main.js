// dependencies for server
var express        = require('express');
var expressLayouts = require('express-ejs-layouts');
var bodyParser     = require('body-parser');
var path           = require('path');
var morgan          = require('morgan')

// create server express and port execution
var app            = express();
var port           = process.env.PORT || 8080;

// middlewares


// front en view instead of html it render ejs
app.set('view engine', 'ejs');
app.use(expressLayouts);

// use body parser
app.use(bodyParser.urlencoded({ extended: true }));
app.use(morgan('dev'));
// routing to app and conect to routers.js
// where is goin to handle the routing for the web app
var router = require('./app/routes');
app.use('/', router);


// add the static folder where to is the css img tec
app.use('/public', express.static(__dirname + '/public'));

// start the server
app.listen(port, function() {
  console.log('app started ' + port);
});
