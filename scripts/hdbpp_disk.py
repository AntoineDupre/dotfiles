import requests
import time

node_free = "node_filesystem_free"
node_size = "node_filesystem_size"
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
        if result["metric"]["instance"].startswith("b-picard")
        and result["metric"]["mountpoint"] == "/data"
    }


def get_output(node, free_space, total_size):
    print("{:<25} {}%".format(node.split(":")[0].replace("b-picard-", ""), round(100 - (free_space * 100 / total_size), 2)))


free_json = request_prometheus(build_url_now(node_free))
size_json = request_prometheus(build_url_now(node_size))

free = get_cassandra_result(free_json["data"]["result"])
size = get_cassandra_result(size_json["data"]["result"])


nodes = list(free.keys())
nodes.sort()


for node in nodes:
    get_output(node, int(free[node][1]), int(size[node][1]))
