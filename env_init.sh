# git
git config --global user.email "liangxinhui@qq.com"
git config --global user.name "liangxinhui"
if [ ! -f ~/.ssh/id_rsa ]; then 
ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -N ""
fi
echo '<br>add this key to github:<br>'
cat ~/.ssh/id_rsa.pub




cd ~/
echo 'pwd:'
pwd

basePath=$1
cd ${basePath}

# book_src
if [ ! -d book_src ]; then
mkdir book_src
fi
cd book_src

if [ ! -d EsunnyAPI_FAQ ]; then 
echo '<br>Clone EsunnyAPI_FAQ...<br>'
git clone https://github.com/liangxinhui/EsunnyAPI_FAQ.git
fi

# gitbook
GIBOOK_BIN=${basePath}/node_modules/gitbook-cli/bin/gitbook.js


if [ ! -d ~/.gitbook/versions/2.5.2-liangxh ];then
echo '<br>Link gitbook version...\n'
${GIBOOK_BIN} versions:link ${basePath}/gitbook_versions/2.5.2-liangxh/ 2.5.2-liangxh
fi
${GIBOOK_BIN} versions



${GIBOOK_BIN} versions:install latest
${GIBOOK_BIN} versions

echo '<br>ls ~/.gitbook/versions/<br>'
ls ~/.gitbook/versions/

echo '<br>Install gitbook plugins...<br>'
${GIBOOK_BIN} install EsunnyAPI_FAQ

echo '<br>Done'