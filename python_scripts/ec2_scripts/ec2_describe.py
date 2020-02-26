import boto3

ec2 = boto3.client('ec2')
response = ec2.describe_instances()
for reservation in response["Reservations"]:
    for instance in reservation["Instances"]:
        # the below print line provides output of all dimentions
        #print (instance)
        print(instance["InstanceId"], instance["InstanceType"], instance["ImageId"], instance["PrivateIpAddress"], instance["State"])
        #print(instance["InstanceType"])
        #print(instance["ImageId"])