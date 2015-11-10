

echo whoami: `whoami`



git config --global user.email "liangxinhui@qq.com"
git config --global user.name "liangxinhui"

if [ ! -f ~/.ssh/id_rsa ]; then 
ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -N ""
fi
echo '<br>add this key to github:<br>'
cat ~/.ssh/id_rsa.pub

cp -f known_hosts ~/.ssh/ 

if [ ! -d EsunnyAPI_FAQ ]; then 
echo '<br>Clone EsunnyAPI_FAQ...<br>'
git clone git@github.com:liangxinhui/EsunnyAPI_FAQ.git
fi

echo '<br>ssh -v git@github.com...<br>'
ssh -v git@github.com

if [ ! -d EsunnyAPI_FAQ ]; then 
echo 'Err Clone'
exit 1
fi

echo 'pwd:'
pwd
echo 'ls'
ls
