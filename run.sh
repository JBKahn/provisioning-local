sudo apt-get install python-setuptools aptitude git python-dev libxml2-dev libxslt-dev

sudo easy_install pip

cd ~
mkdir -p setup
cd setup
git clone https://github.com/JBKahn/provisioning-local.git
cd provisioning-local

sudo pip install -r requirements.txt

echo -e "please make sure to edit the config.json file followed by [ENTER]" && read USELESS_VAR

ansible-playbook setup.yml -i HOSTS --ask-sudo-pass  --module-path ./ansible_modules --extra-vars "@config.json"

# currently unable to use ansible due to EULA that I can't seem to stub using debconf
sudo apt-get install steam

dropbox start -i > /dev/null 2>&1 &
/opt/extras.ubuntu.com/variety/bin/variety > /dev/null 2>&1 &
plank > /dev/null 2>&1 &

source ~/.bashrc
exit 0
