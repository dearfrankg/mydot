
##---------------------------------------------------
## dearfrankg.com aka marylinfashion.com
## hosted at amazon web services EC2
##---------------------------------------------------
    # ssh $awsroot -- login as root
#   awsroot=" -i /Users/frankg/.ssh/web-server-key.pem ubuntu@184.169.146.13"

    # ssh $aws -- login as frankg
#   aws="frankg@dearfrankg.com"

#------------------------------------------------------------------
# aws

<<XXX
aws 

Setup a new user
------------------------------------------------------------------
by default you need a key to login called xxx.pem

you can override this by adding the users public key to the 
.ssh/authorized_users file.

replace sections as appropriate

 cat ~/.ssh/id_dsa.pub | ssh -i amazon-generated-key.pem ec2-user@amazon-instance-public-dns "cat >> .ssh/authorized_keys"


for example: by adding frank's public key the the .ssh/authorized_users 
file for ec2-user.  We allow frank to login using the following:

  ssh ec2-user@xx.xx.xx.xx

Since I want to keep root more secure I require the .pem file

  ssh -i /Users/frankg/.ssh/mbp.pem root@54.213.55.63


XXX

aws_access () {
  [[ "$1" == "" ]] && echo "need user param" && return;


  user="$1"
  public_key="$HOME/.ssh/id_rsa.pub"
  server_key="$HOME/.ssh/mbp.pem"
  aws_host="ec2-54-213-55-63.us-west-2.compute.amazonaws.com"


  echo "copying public key for $1"
  cmd="cat $public_key | ssh -i $server_key $user@$aws_host 'cat >> .ssh/authorized_keys'   "

  echo "best I can do is print the command:"
  echo $cmd
#  echo `$cmd`
}



##-----------
## BOXPOOL
##-----------
#awsroot=' -i /Users/frankg/.ssh/mbp.pem root@54.213.55.63 '
#aws='ec2-user@54.213.55.63'
#awsn='node@54.213.55.63'
## ssh $awsroot
## ssh $aws



#-----------
# BOXPOOL
#-----------
AWS_PUBLIC_IP=54.200.138.232
awsroot=" -i /Users/frankg/.ssh/mbp.pem ubuntu@$AWS_PUBLIC_IP "
aws="ec2-user@$AWS_PUBLIC_IP"
awsn="node@$AWS_PUBLIC_IP"
# ssh $awsroot
# ssh $aws















