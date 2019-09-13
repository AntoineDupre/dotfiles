import requests
import time
import sys

node = "node_load15"
prometheus = "http://control.maxiv.lu.se/beamlines/monitor/"
api = "/api/v1"
query_range = "/query_range?query={}&start={}&end={}&step={}s"


def build_url_now(node):
    now = time.time()
    query = query_range.format(node, now, now, "15")
    return prometheus + api + query


def request_prometheus(url):
    reply = requests.get(url)
    if reply.status_code != 200:
        err = "Fail to read from alfresco:\n code: {}\n reply"
        err = err.format(reply.status_code, reply)
        raise ValueError(err)
    return reply.json()


def get_cassandra_result(results):
    return {
        result["metric"]["instance"]: result["values"][0]
        for result in results
        if result["metric"]["instance"].startswith("b-v-db")
    }


def get_output(node, load):
    print("{:<40} {}  %".format(node.split(":")[0].replace("b-v-db-", ""), load))

node_json = request_prometheus(build_url_now(node))

result = get_cassandra_result(node_json["data"]["result"])




keys = result.keys()
keys.sort()

for k in keys:
    get_output(k, 100 * float(result[k][1]) / 4.0)

