![GitHub search hit counter](https://img.shields.io/github/search/ryanc410/easy_ssh/easy_ssh?color=deepskyblue&style=for-the-badge)
![GitHub Repo stars](https://img.shields.io/github/stars/ryanc410/easy_ssh?color=deepskyblue&label=Github%20Stars&style=for-the-badge)
![GitHub forks](https://img.shields.io/github/forks/ryanc410/easy_ssh?color=deepskyblue&style=for-the-badge)
# easy_ssh
<br>
<br>

![SSH LOGO](https://github.com/ryanc410/easy_ssh/blob/main/ssh_logo.png)

## TABLE OF CONTENTS

<br>

1. [About this Project](https://github.com/ryanc410/easy_ssh/edit/main/README.md#about)

2. [Setup Instructions](https://github.com/ryanc410/easy_ssh/edit/main/README.md#setup)


<br>

## ABOUT

<br>

&nbsp;&nbsp;&nbsp;&nbsp;This script was written to make Authenticating with a Remote Host as easy as one command. When you have multiple remote servers  that you manage and each one has their own private key, it can become a hassle to manage all of them. Hopefully this script will help make managing those remote hosts and private keys easier.</p>

<br>
<br>

## SETUP

<br>

These instructions are just a recommendation of how you COULD set things up. You dont necessarily have to set things up this way for the script to function. This is how I configured the script on my system.

<br>

**BEFORE DOING ANYTHING, ENSURE YOUR PRIVATE KEYS HAVE THE CORRECT PERMISSIONS. IF YOU DO NOT DO THIS YOU WILL GET AN ERROR SAYING YOUR KEY IS NOT SECURE AND THE KEY WILL BE REJECTED!**

````bash
chmod 600 /path/to/keys/privatekey_rsa
````

<br>

**CLONE THE REPOSITORY**

````bash
cd ~
git clone https://github.com/ryanc410/easy_ssh.git
````

<br>

**ADD THE easy_ssh DIRECTORY TO YOUR SYSTEM'S PATH SO YOU CAN EXECUTE THE SCRIPT FROM ANYWHERE.**

````bash
export PATH="~/easy_ssh/:$PATH"
````

<br>

**CD INTO THE easy_ssh DIRECTORY AND COPY THE ssh-login.sh SCRIPT TO A NAME OF YOUR REMOTE SERVER. THEN MAKE THE SCRIPT EXECUTABLE.**

````bash
cd easy_ssh
cp ssh-login.sh DOMAIN.sh
chmod +x DOMAIN.sh
````

<br>

**OPEN THE COPIED SCRIPT AND CHANGE THE VARIABLES JUST BELOW THE SCRIPT INFORMATION BOX TO THE VALUES THAT MATCH YOUR CONFIGURATION.**

````bash
#!/usr/bin/env bash
########################################################
# AUTHOR: Ryan C. 
# GITHUB: https://github.com/ryanc410
# DATE: 02-17-2022
# DESCRIPTION: SSH login template for easy Authentication and management of Remote Hosts.
# VERSION: 1.0
########################################################

# Change this value to the IP address of the Remote Host you want to authenticate with.
IP=    <----REMOTE SERVER IP ADDRESS.
# The username to login to the Remote Host.
USER=    <----THE USERNAME TO LOGIN WITH.
# Path to the Private Key that matches the authorized_keys file on the Remote Host. If SSH keys are not configured leave blank.
KEY_FILE=    <----PATH TO WHERE YOU STORE YOUR PRIVATE KEYS. I USUALLY STORE MINE IN ~/.ssh TO MAKE IT EASIER TO REMEMBER.
# If a port other than 22 is configured in the sshd_config file on the Remote Host, enter it here. If not leave blank.
PORT=    <----IF YOU CHANGED THE SSH LISTEN PORT IN THE SSHD_CONFIG FILE PUT THE LISTEN PORT HERE.
````

<br>

**EXECUTE THE SCRIPT!**

````bash
DOMAIN.sh
````

