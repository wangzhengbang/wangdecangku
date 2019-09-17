#!/usr/bin/python

import time
import json


output = [{"endpoint": "open-falcon-server", "tags": "", "timestamp": int(time.time()), "metric": "agent.cpu", "value": 1.8, "counterType": "GAUGE", "step": 60}]

print  json.dumps(output)
