#!/bin/bash
region=eu-west-1
profile=test
input="./instances_list.txt"

#while read line;
while IFS= read -r line
do
	ec2id=${line}
	#echo "Instance ID is : ${ec2id}";
	# this is to findout the Instance state, like running,stopped,terminated,etc for the instances IDs mentioned in the instances_list.txt file
	result=$(aws --profile ${profile} --region ${region} ec2 describe-instances --instance-id ${ec2id} --query 'Reservations[].[Instances[].[InstanceId,Platform,State.Name]]' --output text)
echo ${result}
done < $input
