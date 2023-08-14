sudo apt-get update
sudo apt install curl wget git
git config --global user.email "nikhilnsr1998@gmail.com"
git config --global user.name "nikhil"


#python installation
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.11 -y
sudo apt install python3-pip
sudo apt install python-is-python3 -y
sudo apt install python3.11-venv

#utilities
sudo apt install trash-cli -y
sudo apt install cpufetch -y
sudo apt install neofetch -y
sudo apt install tree -y
sudo apt install htop
sudo apt install bat -y
sudo apt install ncdu -y
sudo apt install vlc -y
sudo apt-get install libreoffice -y

#VS Code installation
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code


#CHROME installation
sudo apt install wget
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
trash-put google-chrome-stable_current_amd64.deb

#FIREFOX installation
sudo snap remove firefox
sudo add-apt-repository ppa:mozillateam/ppa
echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
sudo apt install firefox -y


#desktop visual settings
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32


#openssh-server
sudo apt-get install openssh-server
sudo systemctl status ssh
sudo systemctl start ssh
#set the ssh key for github access.
ssh-keygen -o -t rsa -C "nikhilnsr1998@gmail.com"
# copy the contents of the public key and add to github keys
read -p "Press any key to resume ..."

#File Sharing
sudo apt update
sudo apt upgrade
sudo apt install qbittorrent -y
sudo apt install onedrive -y

#ZSH
sudo apt-get update
sudo apt-get install zsh -y
chsh -s $(which zsh)
echo '''you need to retart now and then run below command
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
you might get a connection failure with github in that case you need to append the following to the file /etc/hosts 

echo "185.199.108.133 raw.githubusercontent.com" >> /etc/hosts

also copy the contents of the public key within ~/.ssh and add over to github
'''
sudo -i

#DOCKER installation
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done	#uninstalled old docker installation

sudo apt-get update
sudo apt-get install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo docker run hello-world
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world
# to stop docker daemon rather than just a container,
# sudo systemctl stop docker
# to restart docker daemon
# sudo systemctl start docker

#sudo apt install docker-compose -y
#for version 1 of compose and below steps

#for version 2
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins

curl -SL https://github.com/docker/compose/releases/download/v2.6.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose

chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
# now you may only need to add the alias for $DOCKER_CONFIG/cli-plugins/docker-compose into the zshrc file.

