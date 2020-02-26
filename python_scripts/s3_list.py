import boto3
import datetime

s3 = boto3.client('s3')
response = s3.list_buckets()

for bucket in response["Buckets"]:
    print(bucket["Name"], bucket["CreationDate"])
#print (response)