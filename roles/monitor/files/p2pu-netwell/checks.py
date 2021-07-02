#! /usr/bin/env python3

from netwell.checkers import URL, DNS, Port, Repo, Path
URL('http://p2pu.org').redirects_to('https://www.p2pu.org/en/')
URL('https://p2pu.org').redirects_to('https://www.p2pu.org/en/')
URL('https://www.p2pu.org') \
    .title_matches('P2PU') \
    .has_header('Content-Type', 'text/html; charset=utf-8')
Port('www.p2pu.org', 443).ssl_valid_for(days=10)
Port('p2pu.org', 443).ssl_valid_for(days=10)
Port('learningcircles.p2pu.org', 443).ssl_valid_for(days=10)
Path('/').free_space(gb=2)
#Path('/var/log/syslog').modified_within(hours=1)
#Repo('/home/deploy/src/project').is_clean()

import docker
import os
DOMAIN = os.environ.get('DOMAIN')
client = docker.from_env()
containers = [c.name for c in client.containers.list()]
expected_container = [
    'p2pu-nginx',
    f'{DOMAIN}-celerybeat',
    f'{DOMAIN}-celery',
    f'{DOMAIN}',
    'nginx-letsencrypt-companion',
    'learningcircles-rabbitmq',
    'p2pu-postgres',
    'fluentd',
]
for c in expected_container:
    oknotok = "OK" if c in containers else "ERROR"
    print(f'Checking that docker container {c} is running: {oknotok}')
