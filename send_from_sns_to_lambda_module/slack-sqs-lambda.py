import os
import json
import sys
import random
import requests
print("start")
def lambda_handler(event, context):
    print(event)
    url=os.environ['SLACK_URL']
    sns_message = event['Records'][0]['Sns']['Message']
    sns_dictionary = json.loads(sns_message)
    title = sns_dictionary["Title"]
    message = sns_dictionary["Message"]
    slack_data = {
        "username": sns_dictionary["Username"],
        "icon_emoji": ":satellite:",
        #"channel" : "#somerandomcahnnel",
        "attachments": [
            {
                "color": "#9733EE",
                "fields": [
                    {
                        "title": title,
                        "value": message,
                        "short": "false",
                    }
                ]
            }
        ]
    }
    byte_length = str(sys.getsizeof(slack_data))
    headers = {'Content-Type': "application/json", 'Content-Length': byte_length}
    response = requests.post(url, data=json.dumps(slack_data), headers=headers)
    if response.status_code != 200:
        raise Exception(response.status_code, response.text)
print("end")