#! /bin/sh

echo whoami: `whoami`

git config --global user.email "liangxinhui@qq.com"
git config --global user.name "liangxinhui"

# ssh_key
mkdir ~/.ssh
echo "$SSH_ID_RSA_STR" > ~/.ssh/id_rsa
echo "$SSH_ID_RSA_PUB_STR" > ~/.ssh/id_rsa.pub

echo '<br>add this key to github:<br>'
cat ~/.ssh/id_rsa.pub


basePath=$1
cd ${basePath}


cp -f ${basePath}/known_hosts ~/.ssh/ 
echo '~/.ssh/known_hosts' 
cat ~/.ssh/known_hosts

# gitbook
GIBOOK_BIN=${basePath}/node_modules/gitbook-cli/bin/gitbook.js

if [ ! -d ~/.gitbook/versions/2.5.2-liangxh ];then
echo '<br>Link gitbook version...\n'
${GIBOOK_BIN} versions:link ${basePath}/gitbook_versions/2.5.2-liangxh/ 2.5.2-liangxh
echo '<br>2.5.2-liangxh install/<br>'
cd ${basePath}/gitbook_versions/2.5.2-liangxh
npm install 
cd - 
fi

${GIBOOK_BIN} versions




cd ${basePath}/

# book_src

echo '<br>add this key to github:<br>'
cat ~/.ssh/id_rsa.pub

cp -f ${basePath}/known_hosts ~/.ssh/ 
echo '<br>~/.ssh/known_hosts<br>' 
cat ~/.ssh/known_hosts


if [ ! -d book_src ]; then
mkdir book_src
fi


cd ${basePath}/book_src


if [ ! -d EsunnyAPI_FAQ ]; then 
echo '<br>Clone EsunnyAPI_FAQ...<br>'
git clone git@github.com:EsunnyAPI/EsunnyAPI_FAQ.git
fi

echo 'ls EsunnyAPI_FAQ:' 
ls EsunnyAPI_FAQ



if [ ! -d EsunnyAPI_FAQ ]; then 
echo 'Err Clone'
exit 1
fi

echo 'pwd:'
pwd
echo 'ls'
ls


cd ${basePath}/book_src/EsunnyAPI_FAQ
rm -rf _book

cp -f ${basePath}/known_hosts ~/.ssh/ 
echo '<br>~/.ssh/known_hosts<br>' 
cat ~/.ssh/known_hosts

echo '<p>pull</p>'
git pull

GIBOOK_BIN=${basePath}/node_modules/gitbook-cli/bin/gitbook.js

echo '<p>install plugin</p>'
${GIBOOK_BIN} -v 2.5.2-liangxh install 
npm install liangxinhui/gitbook-plugin-js-sequence-diagram
cat node_modules/gitbook-plugin-js-sequence-diagram/index.js
echo '<p>build</p>'
${GIBOOK_BIN} -v 2.5.2-liangxh build 

if [ ! -d _book ]; then 
echo 'Err build'
exit 1
fi

cd _book
pwd
git init
git add *
git commit -m "Auto Deploy"
echo '<p>remote add</p>'
git remote add gh-pages git@github.com:EsunnyAPI/EsunnyAPI_FAQ.git
git remote -v

cp -f ${basePath}/known_hosts ~/.ssh/ 
echo '<br>~/.ssh/known_hosts<br>' 
cat ~/.ssh/known_hosts

echo '<p>git push</p>'
git push gh-pages master:gh-pages -f

echo '<p>done</p>'

