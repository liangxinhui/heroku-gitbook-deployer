# git

echo whoami: `whoami`

git config --global user.email "liangxinhui@qq.com"
git config --global user.name "liangxinhui"
if [ ! -f ~/.ssh/id_rsa ]; then 
echo 'ssh-keygen...'
ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -N ""
else
echo 'ssh-keygen not needed'
fi


echo '<br>add this key to github:<br>'
cat ~/.ssh/id_rsa.pub



basePath=$1
cd ${basePath}


cp -f ${basePath}/known_hosts ~/.ssh/ 


echo '~/.ssh/known_hosts' 
cat ~/.ssh/known_hosts

# gitbook
GIBOOK_BIN=${basePath}/node_modules/gitbook-cli/bin/gitbook.js


echo '<br>2.5.2-liangxh install/<br>'
cd ${basePath}/gitbook_versions/2.5.2-liangxh
npm install 
cd - 

if [ ! -d ~/.gitbook/versions/2.5.2-liangxh ];then
echo '<br>Link gitbook version...\n'
${GIBOOK_BIN} versions:link ${basePath}/gitbook_versions/2.5.2-liangxh/ 2.5.2-liangxh
fi

${GIBOOK_BIN} versions


echo '<br>Done'