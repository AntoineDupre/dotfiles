import requests
import time
import sys
node = 'tango_server_starter_controlled'
node2 = 'tango_server_running'
prometheus = "http://control.maxiv.lu.se/machine/monitor/"
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
        result["metric"]["server"]: int(result["values"][0][1])
        for result in results
    }


def get_output(node, load):
    print("{:<40} {}".format(node.split(":")[0].lower(), load))


node_json = request_prometheus(build_url_now(node))
started = get_cassandra_result(node_json["data"]["result"])

node2_json = request_prometheus(build_url_now(node2))
running = get_cassandra_result(node2_json["data"]["result"])


for k in started:
    if started[k] - running[k] and not k.startswith("Starter"):
        print(k.lower())

