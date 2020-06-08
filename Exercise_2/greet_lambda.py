import os

def lambda_handler(event, context):
    print(os.environ)
    return "Greet from Lambda!"
