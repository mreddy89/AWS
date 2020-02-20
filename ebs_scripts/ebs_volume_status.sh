#!/bin/bash
region=eu-west-1
profile=test
input="./ebs_list.txt"

#while read line;
while IFS= read -r line
do
	volumeid=${line}
	#datetime=$(echo "$(date +'%d-%m-%Y_%H:%M')")
	#echo "Instance ID is : ${ec2id}";
	# this is to fetch the volumeid, size and state of the EBS volumes for the above mentioned account and volume IDs mentioned in ebs_list.txt file
	result=$(aws --profile ${profile} --region ${region} ec2 describe-volumes --volume-id ${volumeid} --query 'Volumes[].[VolumeId,Size,State]' --output text)
echo ${result}
done < $input
