#!/bin/bash
region=eu-west-1
profile=prod
input="./prod_ticketing_vpc_sg_list.txt"
sourcesid=sg-0012efc80c4d70823

#while read line;
while IFS= read -r line
do
	sgid=${line}
	echo "The Security Group ID is : ${sgid}";
	# this is to attach the newly created security gorup mentioned in code line to all the security groups there in sg_list_dev.txt file
	result=$(aws --profile ${profile} --region ${region} ec2 authorize-security-group-ingress --group-id ${sgid} --source-group ${sourcesid} --protocol all --port 0-65535)
	#This is to revoke the attachment made in above line
	#result=$(aws --profile ${profile} --region ${region} ec2 revoke-security-group-ingress --group-id ${sgid} --source-group sg-014610596384e0392 --protocol all --port 0-65535)
	echo ${result}
done < $input
