#! /bin/sh

echo "==============" >> /tmp/gitlog.txt
DATETIME=$(date +%Y%m%d%H%M%S)
echo  deploy_${DATETIME} >> /tmp/gitlog.txt
basePath=$1
echo basePath:${basePath} >> /tmp/gitlog.txt
echo "--------------" >> /tmp/gitlog.txt

cd ${basePath}/book_src
rm -rf _book
git pull

GIBOOK_BIN=${basePath}/node_modules/gitbook-cli/bin/gitbook.js

cd ${basePath}/book_src/EsunnyAPI_FAQ
${GIBOOK_BIN}  build 

cd _book
git init
git add *
git commit -m "Auto Deploy"
echo 'remote add\n'
git remote add gh-pages git@github.com:liangxinhui/EsunnyAPI_FAQ.git
git remote -v
echo 'git push\n'
git push gh-pages master:gh-pages -f

echo 'done'

