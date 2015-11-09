# git
git config --global user.email "liangxinhui@qq.com"
git config --global user.name "liangxinhui"
if [ ! -f ~/.ssh/id_rsa ]; then 
ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -N ""
fi
echo 'add this key to github:'
cat ~/.ssh/id_rsa.pub


basePath=$1
cd ${basePath}

# book_src
if [ ! -d book_src ]; then
mkdir book_src
fi
cd book_src

if [ ! -d EsunnyAPI_FAQ ]; then 
echo 'Clone EsunnyAPI_FAQ...'
git clone https://github.com/liangxinhui/EsunnyAPI_FAQ.git
fi

# gitbook
npm install gitbook-cli
GIBOOK_BIN=${basePath}/node_modules/gitbook-cli/bin/gitbook.js
echo $basePath
echo $GIBOOK_BIN
if [ ! -d ~/.gitbook/versions/2.5.2-liangxh ];then
echo 'Link gitbook version...'
${GIBOOK_BIN} versions:link ${basePath}/gitbook/2.5.2-liangxh/ 2.5.2-liangxh/
fi

echo 'Install gitbook plugins...'
${GIBOOK_BIN} -v 2.5.2-liangxh install EsunnyAPI_FAQ

echo 'Done'