#!/bin/bash

if [ ! -n "$WERCKER_INSTALL_AWS_CLI_KEY" ]; then
	error 'Please specify key property'
	exit 1
fi

if [ ! -n "$WERCKER_INSTALL_AWS_CLI_SECRET" ]; then
  error 'Please specify secret property'
  exit 1
fi

if [ ! -n "$WERCKER_INSTALL_AWS_CLI_REGION" ]; then
  echo '[WARN] No Region Specified'
fi


echo 'Synchronizing References in apt-get...'
sudo apt-get update

echo 'Installing Unzip...'
sudo apt-get install unzip -y

echo 'Installing libpython-dev...'
sudo apt-get install libpython-dev -y

echo 'Grabbing AWS CLI...'
wget https://s3.amazonaws.com/aws-cli/awscli-bundle.zip
unzip awscli-bundle.zip

echo 'Installing AWS CLI...'
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
rm -rf awscli-bundle*

echo 'Synchronizing System Time...'
sudo ntpdate ntp.ubuntu.com

echo 'Configuring based on parameters...'
aws configure set aws_access_key_id $WERCKER_INSTALL_AWS_CLI_KEY
aws configure set aws_secret_access_key $WERCKER_INSTALL_AWS_CLI_SECRET
if [ -n "$WERCKER_INSTALL_AWS_CLI_REGION" ]; then
  aws configure set default.region $WERCKER_INSTALL_AWS_CLI_REGION
fi

echo 'Done.'
