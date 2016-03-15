var express = require('express'); 
var app = express(); 
var githubhook = require('express-github-hook');


function run_cmd(cmd, args, callback) {
  var spawn = require('child_process').spawn;
  var child = spawn(cmd, args);
  var resp = "";
 
  child.stdout.on('data', function(buffer) { console.log(buffer.toString()); resp += buffer.toString(); });
  child.stderr.on('data', function(buffer) { console.log(buffer.toString()); resp += buffer.toString(); })
  child.stdout.on('end', function() { callback (resp) });
}


var githubEventFilterOption = {
    event: 'push',
    repo: 'EsunnyAPI_FAQ',
    ref: 'refs/heads/master'
};

var options = {
            secret: '123456',
            treatRequest: function (event, repo, ref, data)
            {
                console.log('WEBHOOK ' + event + ' on repository ' + repo + ', ref: ' + ref);
 
                if(githubEventFilterOption.event === "push" && 
                githubEventFilterOption.repo === repo &&
                githubEventFilterOption.ref === ref)
                {
                    console.log('on event');
                      run_cmd('sh',[__dirname + "/deploy_to_gh-pages.sh", __dirname],function(data){
                    	//do nothing
                      });
                }
                else{
                    console.log('not my event')
                }
 
            }
};

app.use('/githubhook', githubhook(options));

app.get('/', function(req, res){ 
  res.send('hello world'); 
  console.log('hello world');
}); 



app.get('/updatebook', function(req, res){ 
  run_cmd('sh',[__dirname + "/deploy_to_gh-pages.sh", __dirname],function(data){
	res.send('updatebook:\n' + data);
  });
}); 


app.get('/test', function(req, res){ 
  run_cmd('sh',[__dirname + "/testssh.sh", __dirname],function(data){
	res.send('test:\n' + data);
  });
}); 

var myPort = process.env.PORT || 3001;

app.listen(myPort);
console.log('listen at: ' + myPort);
