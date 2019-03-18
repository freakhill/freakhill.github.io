+++
title = "Notes about operating riak"
description = "I don't want to forget these anymore"
date = 2019-03-17
weight = 5
draft = false
in_search_index = true
[extra]
+++

...

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
erlang:process_info(c:pid(0,227,0))
```

