+++
title = "Ops notes"
description = "I don't want to forget these anymore"
date = 2019-03-17
weight = 110
draft = false
in_search_index = true
[extra]
+++

## Riak

attach to running riak node
```shell
riak attach
```

list processes by memory usage

```shell
riak-admin top -sort msg_q
```

programatically build a pid

```erlang
c:pid(0,227,0)
```

get info about a process

```erlang
erlang:process_info(c:pid(0,227,0)).
```

## Haproxy

[Haproxy doc (1.9)](https://cbonte.github.io/haproxy-dconv/1.9/configuration.html)

use the runtime api to get some info

```bash
/usr/bin/socat -T 15 -t 5 /run/haproxy/admin.sock - <<< "show activity" 
```

some of the stuff:
- show errors    : report last request and response errors for each proxy
- clear counters : clear max statistics counters (add 'all' for all counters)
- show info      : report information about the running process
- show stat      : report counters for each proxy and server
- show schema json : report schema used for stats

how to get the socket?

```bash
grep "stats socket" conf
```

## JVM

[Adopt A JDK](https://adoptopenjdk.net/) to get a free JDK

### jshell

```java
HttpURLConnection con = (HttpURLConnection) new URL("https://***").openConnection();
con.setRequestMethod("GET"); con.getResponseCode();
```

To test whether the JVM can deal with the pointed server.

### jmx stuff

for quick debugging

```shell
ex -vnE /...java11.../conf/security/java.policy <<EOF
/grant {/ a
    permission java.security.AllPermission;
.
wq
EOF
# stuff that works for my start scripts
ex -vnE ...startscript... <<EOF
/Heap/ a
-Dcom.sun.management.jmxremote !
-Dcom.sun.management.jmxremote.ssl=false !
-Dcom.sun.management.jmxremote.authenticate=false !
-Dcom.sun.management.jmxremote.port=1098 !
.
%s/!/\\\\/
wq
EOF
reset
killall java
unset JAVA_TOOL_OPTIONS
jstatd -p ...whatever... &
```
## Security

- script for quick securing of servers: [github repo](https://github.com/marshyski/quick-secure)
- non root port 80 binding: [link](https://wiki.apache.org/httpd/NonRootPortBinding)

## TLS

- [some certificate making example stuff](https://gist.github.com/ncw/9253562#file-makecert-sh)

## Networking

- [Reminder about TIME_WAIT state](https://vincent.bernat.ch/en/blog/2014-tcp-time-wait-state-linux)

## Static website

[Cloudflare + AWS S3](https://medium.com/pixelpoint/99-9-uptime-static-site-deployment-with-cloudflare-and-aws-s3-388e82b4b9b6)

Extra stuff to do because moving stands... (2019/06/04):
1. Click on bucket
2. Click on permission
3. Click on "Block public access"
4. Untick "Block all public access"
5. Set "Block public access to buckets and objects granted through new access control lists (ACLs)" as "OFF"
6. Set "Block public access to buckets and objects granted through any access control lists (ACLs)" as "OFF" 

Try Cloudflare workers for serverless?

## Netflix suddenly fucking up (loads but won't play)

```chrome://settings/clearBrowserData```

and remove 1h or so


