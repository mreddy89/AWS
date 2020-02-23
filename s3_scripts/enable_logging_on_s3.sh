#!/bin/bash
region=eu-west-1
profile=prod
input="./s3bucketlist.txt"

#while read line;
while IFS= read -r line
do
	s3bucket=${line}
	echo "The S3 bucket is : ${s3bucket}";
	# This is to enalbe the logging on all s3 buckets listed in file s3bucketlist.txt
	result=$(aws --profile ${profile} --region ${region} s3api put-bucket-logging --bucket ${s3bucket} --versioning-configuration Status=Enabled)
	# The below line is to DISABLED the versioning on s3 buckets mentioned
	# result=$(aws --profile ${profile} --region ${region} s3api put-bucket-logging --bucket ${s3bucket} --versioning-configuration Status=Disabled)
	echo ${result}
done < $input
