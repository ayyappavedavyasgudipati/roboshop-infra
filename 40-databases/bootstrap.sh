#!/bin/bash

component=$1

sudo dnf install ansible -y
cd /home/ec2-user
git clone https://github.com/ayyappavedavyasgudipati/ansible-roboshop-tf.git

cd ansible-roboshop-tf
git pull

ansible-playbook -e component=$component roboshop.yaml