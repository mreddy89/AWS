#! /bin/bash 
region=eu-west-1
profile=test
filename="C:\temp\s3bucketslist.txt"

n=1
while read bucketname; do
	echo "The bucket name is : $bucketname"
	aws --profile ${profile} --region ${region} s3api get-bucket-logging --bucket "s3://${bucketname}"
	n=$((n+1))
done < $filename
