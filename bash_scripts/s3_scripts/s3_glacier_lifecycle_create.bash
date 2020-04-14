#!/bin/bash
region=eu-west-1
profile=test
# Below .txt file containes the list of s3 bucket names for which you want to create Glacier lifecycle
input="./s3_list.txt"

#while read line;
while IFS= read -r line
do
	s3bucket=${line}
	#echo "Instance ID is : ${ec2id}";
	# this is to create the Lifecycle to move S3 to Glacier, S3 buckets which are listed in s3_list.txt file
	#aws --profile test --region eu-west-1 s3api put-bucket-lifecycle --bucket test001manju --lifecycle-configuration file://s3_glacier_lifecycle.json
	result=$(aws --profile ${profile} --region ${region} s3api put-bucket-lifecycle --bucket ${s3bucket} --lifecycle-configuration file://s3_glacier_lifecycle.json)
echo ${result}
done < $input
