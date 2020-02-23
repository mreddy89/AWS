#!/bin/bash
region=eu-west-1
profile=prod
input="./s3bucketlist.txt"

#while read line;
while IFS= read -r line
do
	s3bucket=${line}
	echo "The S3 bucket is : ${s3bucket}";
	# This is to enalbe the versioning on all s3 buckets listed in file s3bucketlist.txt
	result=$(aws --profile ${profile} --region ${region} s3api put-bucket-versioning --bucket ${s3bucket} --versioning-configuration Status=Enabled)
	# Below line is to disable the versioning on S3 buckets mentioned in s3bucketlist.txt file
	# result=$(aws --profile ${profile} --region ${region} s3api put-bucket-versioning --bucket ${s3bucket} --versioning-configuration Status=Disabled)
	echo ${result}
done < $input
