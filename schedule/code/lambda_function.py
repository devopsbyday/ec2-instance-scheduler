import boto3

def lambda_handler(event, context):
    ec2 = boto3.resource('ec2')
    instances = ec2.instances.filter(
        Filters=[{'Name': 'tag:Name', 'Values': ['*Rowden*']}]
    )
    
    for instance in instances:
        print(f"Stopping instance: {instance.id}")
        instance.stop()
