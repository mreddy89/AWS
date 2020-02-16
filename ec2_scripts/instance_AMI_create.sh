#!/bin/bash
region=eu-west-1
profile=dev
input="./instances_list_for_AMI.txt"

#while read line;
while IFS= read -r line
do
	ec2id=${line}
	#datetime=$(echo "$(date +'%d-%m-%Y_%H:%M')")
	#echo "Instance ID is : ${ec2id}";
	# this is to create the AMI of instances mentioned in instances_list_for_AMI.txt file
	result=$(aws --profile ${profile} --region ${region} ec2 create-image --instance-id ${ec2id} --name "${ec2id}_bkp" --description "This is the AMI of ${ec2id}" --no-reboot)
	echo "AMI Initiated for EC2 : ${ec2id}";
echo ${result}
done < $input
#aws --profile dev --region eu-west-1 ec2 create-image --instance-id i-0be52d1198e4d69d3 --name "${ec2id}_$datetime" --description "This is the AMI of ${ec2id}" --no-reboot --dry-run
