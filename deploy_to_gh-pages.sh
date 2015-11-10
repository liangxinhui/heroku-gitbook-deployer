#! /bin/sh

basePath=$1

cd ${basePath}/

# book_src
if [ ! -d book_src ]; then
mkdir book_src
fi
cd book_src

if [ ! -d EsunnyAPI_FAQ ]; then 
echo '<br>Clone EsunnyAPI_FAQ...<br>'
git clone https://github.com/liangxinhui/EsunnyAPI_FAQ.git
fi




cd ${basePath}/book_src
rm -rf _book

echo '<p>pull</p>'
git pull
GIBOOK_BIN=${basePath}/node_modules/gitbook-cli/bin/gitbook.js

echo '<p>build</p>'
cd ${basePath}/book_src/EsunnyAPI_FAQ
${GIBOOK_BIN} -v 2.5.2-liangxh build 

cd _book
git init
git add *
git commit -m "Auto Deploy"
echo '<p>remote add</p>'
git remote add gh-pages git@github.com:liangxinhui/EsunnyAPI_FAQ.git
git remote -v
echo '<p>git push</p>'
git push gh-pages master:gh-pages -f

echo '<p>done</p>'

