sudo apt-get install python-setuptools

sudo easy_install pip

sudo apt-get install aptitude
sudo apt-get install git
sudo apt-get install python-dev libxml2-dev libxslt-dev

cd ~
mkdir -p setup
cd setup
git clone https://github.com/JBKahn/provisioning-local.git
cd provisioning-local

sudo pip install -r requirements.txt

echo -e "please enter your github username, followed by [ENTER]" && read PROVISIONING_GITHUB_USERNAME
sudo sed -i "s/^github_username: .*/github_username: $PROVISIONING_GITHUB_USERNAME/" roles/common/vars/main.yml

sudo sed -i "s/^uname_r: .*/uname_r: `uname -r`/" roles/common/vars/main.yml

ansible-playbook setup.yml -i HOSTS --ask-sudo-pass  --module-path ./ansible_modules

# currently unable to use ansible due to EULA that I can't seem to stub using debconf
sudo apt-get install steam

dropbox start -i > /dev/null 2>&1 &
/opt/extras.ubuntu.com/variety/bin/variety > /dev/null 2>&1 &
plank > /dev/null 2>&1 &

source ~/.bashrc
exit 0
