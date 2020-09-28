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
