#!/usr/bin/env bash
########################################################
# AUTHOR: Ryan C. 
# GITHUB: https://github.com/ryanc410
# DATE: 02-17-2022
# DESCRIPTION: SSH login template for easy Authentication and management of Remote Hosts.
# VERSION: 1.0
########################################################

# Change this value to the IP address of the Remote Host you want to authenticate with.
IP=
# The username to login to the Remote Host.
USER=
# Path to the Private Key that matches the authorized_keys file on the Remote Host. If SSH keys are not configured leave blank.
KEY_FILE=
# If a port other than 22 is configured in the sshd_config file on the Remote Host, enter it here. If not leave blank.
PORT=

if [[ ! -f $KEY_FILE ]]; then
  echo "Check the KEY_FILE path. Could not be found at $KEY_FILE."
  sleep 3
  exit 1
fi

ping -c 1 "$IP" &>/dev/null
if [[ $? != 0 ]]; then
  echo "The host at $IP could not be reached over the Network. Check your Network and try again."
  sleep 3
  exit 2
fi

if [[ -z $KEY_FILE ]]; then
  echo "No KEY_FILE specified, using Password authentication.."
  sleep 3
  ssh "$USER"@"$IP" -p "$PORT"
fi

if [[ -z $PORT ]]; then
  echo "No PORT specified, using default SSH port(22)."
  sleep 3
  ssh -i "$KEY_FILE" "$USER"@"$IP"
fi

if [[ -z $KEY_FILE ]] && [[ -z $PORT ]]; then
  echo "No KEY_FILE or PORT specified... Using password authentication with default SSH port(22)."
  sleep 3
  ssh "$USER"@"$IP"
fi

ssh -i "$KEY_FILE" "$USER"@"$IP" -p "$PORT"
