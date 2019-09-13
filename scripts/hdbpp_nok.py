import requests
import time
import sys

node_nok = "hdbpp_eventsubscriber_AttributeNokNumber"
node_total = "hdbpp_eventsubscriber_AttributeNumber"
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
        result["metric"]["device"]: int(result["values"][0][1])
        for result in results
        }


def get_output(node, nok, attr):
    print("{:<40} {} / {} ".format(node.split(":")[0].lower().replace("archiver", ""), nok, attr))

node_json = request_prometheus(build_url_now(node_nok))
total_json = request_prometheus(build_url_now(node_total))

result_nok = get_cassandra_result(node_json["data"]["result"])
result_total = get_cassandra_result(total_json["data"]["result"])



for i in range(0, 10):
    r = max(result_nok, key=result_nok.get)
    if result_nok[r] == 0:
        print(" -- ")
        break
    get_output(r, result_nok[r], result_total[r])
    result_nok[r] = -1

