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

echo -e "please enter your username, followed by [ENTER]" && read PROVISIONING_USER
sudo sed -i "s/^username: .*/username: $PROVISIONING_USER/" roles/common/vars/main.yml

echo -e "please enter your github username, followed by [ENTER]" && read PROVISIONING_GITHUB_USERNAME
sudo sed -i "s/^github_username: .*/github_username: $PROVISIONING_GITHUB_USERNAME/" roles/common/vars/main.yml

mkdir -p ~/ansible
mkdir -p ~/ansible/library
cp ./gconftool ~/ansible/library/gconftool

ansible-playbook setup.yml -i HOSTS --ask-sudo-pass  --module-path ~/ansible/library

# currently unable to use ansible due to EULA that I can't seem to stub using debconf
sudo apt-get install steam

dropbox start -i &
/opt/extras.ubuntu.com/variety/bin/variety $
plank &

source ~/.bashrc
exit 0
