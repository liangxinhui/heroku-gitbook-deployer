

echo whoami: `whoami`

basePath=$1

git config --global user.email "liangxinhui@qq.com"
git config --global user.name "liangxinhui"

mkdir ~/.ssh
echo "$SSH_ID_RSA_STR" > ~/.ssh/id_rsa
echo "$SSH_ID_RSA_PUB_STR" > ~/.ssh/id_rsa.pub

echo '<br>add this key to github:<br>'
cat ~/.ssh/id_rsa.pub

cp -f $1/known_hosts ~/.ssh/ 
echo '<br>~/.ssh/known_hosts<br>' 
cat ~/.ssh/known_hosts


if [ ! -d EsunnyAPI_FAQ ]; then 
echo '<br>Clone EsunnyAPI_FAQ...<br>'
git clone git@github.com:liangxinhui/EsunnyAPI_FAQ.git
fi

if [ ! -d EsunnyAPI_FAQ ]; then 
echo 'Err Clone'
exit 1
fi

echo 'pwd:' `pwd`
echo 'ls:' 
ls

echo 'ls EsunnyAPI_FAQ:' 
ls EsunnyAPI_FAQ

