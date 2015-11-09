var express = require('express'); 
var app = express(); 
app.get('/', function(req, res){ 
  res.send('hello world'); 
  console.log('hello world');
}); 

function run_cmd(cmd, args, callback) {
  var spawn = require('child_process').spawn;
  var child = spawn(cmd, args);
  var resp = "";
 
  child.stdout.on('data', function(buffer) { resp += buffer.toString(); });
  child.stdout.on('end', function() { callback (resp) });
}

app.get('/test', function(req, res){ 
  run_cmd('sh',[__dirname + "/deploy_to_gh-pages.sh", __dirname],function(data){
	console.log('deploy_to_gh-pages.sh:' + data);
  });
}); 

app.listen('8080');
console.log('listen at: 8080');