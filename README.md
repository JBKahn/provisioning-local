[![Stories in Ready](https://badge.waffle.io/JBKahn/provisioning-local.png?label=ready&title=Ready)](https://waffle.io/JBKahn/provisioning-local)
Provisioning My PC
============

A simple ansible script to set up my machine just the way I like it.

How To Install With One Command
-------------------------------

```bash
wget -qO- https://github.com/JBKahn/provisioning-local/raw/master/run.sh | sudo bash
```


How To Install The Old Fashioned Way
------------------------------------

1. Install pip
  ```bash
  sudo apt-get install python-setuptools
  sudo easy_install pip
  ```

2. Install Ubuntu packages
  ```bash
  sudo apt-get install aptitude
  sudo apt-get install git
  sudo apt-get install python-dev libxml2-dev libxslt-dev
  ```
3. Setup Git
  * [setup git](https://help.github.com/articles/set-up-git)
  * [setup ssh keys](https://help.github.com/articles/generating-ssh-keys)
4.  Checkout this repo and cd into the directory
  ```bash
  git clone https://github.com/JBKahn/provisioning-local.git <dir>
  cd <dir>
  ```

5. Pip install the requirements
  ```bash
  sudo pip install -r requirements.txt
  ```

6. Fill in the variables in the [variables file ](./config.json)

  | variable  | Description  |
  | :------------ |:---------------|
  | sager_laptop     | boolean to fix keyboard colors and backlight on ubuntu for sager laptops |
  | vagrant_url | URL to vagrant .deb file you wish to install |
  | virtualbox_url |URL to virtual_box .deb file you wish to install |
  | github_username | github username |
7. Provision your local machine

  ```bash
  ansible-playbook setup.yml -i HOSTS --ask-sudo-pass --module-path ./ansible_modules --extra-vars "@config.json"
  ```

Possible Issues
---------------

1. /usr/bin/ohai does not exist (Haven't hit since early development)

The fix was to remove old version of ruby, use rvm and then gem install ohai

http://stackoverflow.com/questions/4464985/rails-3-ruby-1-9-2-does-it-need-usr-bin-ruby1-8
https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-on-ubuntu-12-04-lts-precise-pangolin-with-rvm
https://wiki.opscode.com/display/chef/Ohai+Installation+and+Use
