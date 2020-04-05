#!/bin/bash
region=eu-west-1
profile=dev
# Below .txt file containes the list of Instance ID's on which termination lock should be disabled
input="./instances_list.txt"

#while read line;
while IFS= read -r line
do
	ec2id=${line}
	#echo "Instance ID is : ${ec2id}";
	# this is to disable the termination lock on the EC2 instances (Disable the terminatoin lock) Instance IDs mentioned in the instances_list.txt file
	result=$(aws --profile ${profile} --region ${region} ec2 modify-instance-attribute --instance-id ${ec2id}  --disable-api-termination)
	# Below cmd is to enable the lock on Instance ID's mentioned in .txt file
	# result=$(aws --profile ${profile} --region ${region} ec2 modify-instance-attribute --instance-id ${ec2id}  --no-disable-api-termination)
echo ${result}
done < $input
