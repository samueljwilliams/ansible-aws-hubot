ansible-aws-hubot
=================

This is an Ansible (2.2.0) project to setup Hubot on the Amazon Linux AMI and integrate it with HipChat or Slack
It assumes:
- You have an AWS account
- You have AWS credential keys
- You have said AWS credential keys in your ~/.boto file, under the "hubot" profile
- You have Ansible installed locally
- You have a public key generated
- __You add your public key added to roles/aws_ec2_key_pairs/files/hubot_rsa.pub__

Setup Configuration
-------------------

__Example ~/.boto config file:__

```
[profile hubot]
output = json
region = us-west-2
aws_access_key_id = abc123
aws_secret_access_key = 123abc
```

__Create a file in vars/secrets.yml with the following:__

```
---
aws_api_access_key: accesskey
aws_api_secret_access_key: secretacesskey

#only needed for hubot slack
slack_bot_token: slacktoken

#only needed for hubot hipchat
hipchat_bot_token: bot_token
hipchat_url: chat.hipchat.com
hipchat_jabber_id: bot_user_jabber_id
hipchat_user_password: "bot_user_password"
hipchat_bot_rooms:
  - 123_room1@conf.hipchat.com
  - 123_room2@conf.hipchat.com`
```

__Set your desired AWS region/VPC details, bot name, and hubot adapter (slack or hipchat) in inventories/group_vars/all__

```
bot_name: myBot
hubot_adapter: hipchat
aws_region: us-west-2

cidr: 10.22.0.0/16
public_subnet: 10.22.0.0/24
private_subnet: 10.22.1.0/24
public_subnet_az: us-west-2a
private_subnet_az: us-west-2b

instance_type: t2.nano
```


Setup Steps
-----------

__Setting up the AWS environment__
This sets up VPC, Subnets, Security Groups, IAM Roles, and EC2 KeyPairs


```
ansible-playbook -i inventories/localhost pb_setup_aws.yml
```

__Provisioning the instance__

```
ansible-playbook -i inventories/localhost pb_provision_hubot.yml
```

__Configure the instance__
This installs hubot and configures the adapter, the bot role can be modified to add additional coffeescript files for your bot

```
ansible-playbook -i inventories/ec2.py pb_configure_hubot.yml
```