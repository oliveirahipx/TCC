var app = require('./config/server')

var rotaIndex = require('./app/routes/index')

rotaIndex(app);





app.listen(3000,function(){
    console.log("Server ON")
});