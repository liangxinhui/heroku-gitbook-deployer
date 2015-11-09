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
${GIBOOK_BIN} -v 2.5.2-liangxh build

cd _book
git init
git add *
git commit -m "Auto Deploy"
git remote add gh-pages git@github.com:liangxinhui/EsunnyAPI_FAQ.git
git push gh-pages master:gh-pages -f

echo 'done'

