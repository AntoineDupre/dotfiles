import requests
import json

res = requests.get("https://docker.maxiv.lu.se/v2/_catalog")

if not res.ok:
    raise Exception("Can not connect to maxiv docker registry")

for d in json.loads(res.content)["repositories"]:
    print(d)
