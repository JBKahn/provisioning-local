Provisioning My PC
============

A simple ansible script to set up my machine just the way I like it.

How To Install
-------------------

1. Install pip
  ```bash
  sudo easy_install pip
  ```

2. Install Ubuntu packages
  ```bash
  sudo apt-get install aptitude
  sudo apt-get install git
  ```
3. Setup Git
  * [setup git](https://help.github.com/articles/set-up-git)
  * [setup ssh keys](https://help.github.com/articles/generating-ssh-keys)
4.  Checkout this repo and cd into the directory
  ```bash
  git clone git@github.com:JBKahn/provisioning-local.git <dir>
  cd <dir>
  ```

5. Pip install the requirements
  ```bash
  sudo pip install -r requirements.txt
  ```

6. Fill in the variables in the [variables file ](./roles/common/vars/main.yml)

  | variable  | Description  |
  | :------------ |:---------------|
  | username    | username of user you wish to provision for |
  | sager_laptop     | boolean to fix keyboard colors and backlight on ubuntu for sager laptops |
  | vagrant_url | URL to vagrant .deb file you wish to install |
  | virtualbox_url |URL to virtual_box .deb file you wish to install |
  | github_username | github username |
7. Provision your local machine

  ```bash
  ./run.sh
  ```
