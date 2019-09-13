import requests
import time
import sys

node = "(node_load15/(count(count(node_cpu) without (mode)) without (cpu)))"
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
        result["metric"]["instance"]: float(result["values"][0][1])
        for result in results
    }


def get_output(node, load):
    print("{:02.2f} {:>40}".format(load, node.split(":")[0]))


node_json = request_prometheus(build_url_now(node))

result = get_cassandra_result(node_json["data"]["result"])




for i in range(0, 10):
    r = max(result, key=result.get)
    if result[r] == 0:
        print(" -- ")
        break
    get_output(r, result[r])
    result[r] = -1


