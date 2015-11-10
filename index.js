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
 
  child.stdout.on('data', function(buffer) { console.log(buffer.toString()); resp += buffer.toString(); });
  child.stderr.on('data', function(buffer) { console.log(buffer.toString()); resp += buffer.toString(); })
  child.stdout.on('end', function() { callback (resp) });
}

app.get('/updatebook', function(req, res){ 
  run_cmd('sh',[__dirname + "/deploy_to_gh-pages.sh", __dirname],function(data){
	res.send('updatebook:\n' + data);
  });
}); 


app.get('/init', function(req, res){ 
  run_cmd('sh',[__dirname + "/env_init.sh", __dirname],function(data){
	res.send('init:\n' + data);
  });
}); 


app.get('/test', function(req, res){ 
  run_cmd('sh',[__dirname + "/testssh.sh", __dirname],function(data){
	res.send('test:\n' + data);
  });
}); 


app.listen(process.env.PORT);
console.log('listen at: ' + process.env.PORT);