#!/bin/bash
region=eu-west-1
profile=prod
input="C:\Users\Manjunath\Desktop\myscripts\aws_scripts\bash\ec2_instance_list.txt"

n=0
while read line; do
ec2vm=${line}
echo "ec2 VM Name is :   ${ec2vm}";
result=$(aws --profile ${profile} --region ${region} ec2 describe-instances --instance-id ${ec2vm} --query 'Reservations[*].Instances[*].{InstanceId:InstanceId,VolumeInfo:BlockDeviceMappings}' --output text | awk '{print $2,$5}' | grep -v 2018)
echo $result
n=$((n+1))
done < $input


sg-014610596384e0392
sg-014610596384e0392

sg-0ac827eeadda3e8e8 - sg for prod vpc
sg-0e209c3646970b8fe - sg for ticketing prod vpc

