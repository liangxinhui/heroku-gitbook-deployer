#! /bin/sh

echo whoami: `whoami`

basePath=$1

cd ${basePath}/

# book_src

echo '<br>add this key to github:<br>'
cat ~/.ssh/id_rsa.pub

echo '<br>~/.ssh/known_hosts<br>' 
cat ~/.ssh/known_hosts


if [ ! -d book_src ]; then
mkdir book_src
fi


cd ${basePath}/book_src


if [ ! -d EsunnyAPI_FAQ ]; then 
echo '<br>Clone EsunnyAPI_FAQ...<br>'
git clone git@github.com:liangxinhui/EsunnyAPI_FAQ.git
fi

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
echo '<p>pull</p>'
git pull

GIBOOK_BIN=${basePath}/node_modules/gitbook-cli/bin/gitbook.js

echo '<p>install plugin</p>'
${GIBOOK_BIN} -v 2.5.2-liangxh install 
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
git remote add gh-pages git@github.com:liangxinhui/EsunnyAPI_FAQ.git
git remote -v
echo '<p>git push</p>'
git push gh-pages master:gh-pages -f

echo '<p>done</p>'

