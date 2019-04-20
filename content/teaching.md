+++
title = "Teach programming to my friend"
description = "... stuff to teach so he can work with me..."
date = 2019-03-17
weight = 85
draft = false
in_search_index = true
[taxonomies]
# tags = ["sfv"]
[extra]
+++

Teach by layers, from big general view to details!

While teaching everything, use observability and test "powertools" to demonstrate the concepts on his own computer.

He needs to make a simple website to explain his learnings & share his anki cards

https://apps.ankiweb.net/

https://github.com/capaldo/ankARIO

Share his anki cards on a git repo, and I can modify them too https://apps.ankiweb.net/docs/manual.html

Big list of stuff to teach:
- How computers work
- What's an operating system
- How local networks works
- How internet works
- Markdown
- Git&Github
- How to make a personal website (like this one), setup DNS, follow instructions etc.
- VScode
- Powershell & Bash
- cd, mv, cp, top, htop, ls, lsof, find, sed, vi
- Linux, Kernel, glibc, systemd, Centos, Ubuntu
- Haproxy, Docker, ELK, Prometheus
- BIOS, MBR, Partitions, filesystems, LVM https://opensource.com/article/18/4/ext4-filesystem https://opensource.com/tags/linux
- Brush through the world of programming languages with "Concepts, Techniques and Models of Computer Programming"
- Clojure, Rust, C?, JS?, Typescript?, Python?, Go? (exercism, 4clojure, internet doc)
- Stuff programmers should know about concurrency/memory https://assets.bitbashing.io/papers/concurrency-primer.pdf https://people.freebsd.org/~lstewart/articles/cpumemory.pdf
- JVM, debug stuff, read a dump file
- Algorithms & Data Structures (Introduction to algorithms, Programming pearls, Functional data structures) + impact of real hardware on real performance (Vectors... memory affinity)
- Finite State Machines, regexes, actual practical regexes (with backtracking etc.), DSLs
- Explain the power of abstraction and the power of restriction
- Explain how adding information restricting your domain of operation results in better/faster/smaller stuff (Programming Pearls?)
- ANSI isolation levels, SQL, https://use-the-index-luke.com/
- TDD,DDD (DDD book)
- Gang of 4 design patterns/refactoring/soa/clean code etc.

Find lots of projects to make him code stuff all the time.

### How computers work

... earth how the books explaining how to build a computer from scratch at work ...
Modern processors design book

### How Internet Work

Internet protocol suite:
| layer       | protocols                                                                                                                       |
|-------------|---------------------------------------------------------------------------------------------------------------------------------|
| Application | BGP DHCP DNS FTP HTTP HTTPS IMAP LDAP MGCP MQTT NNTP NTP POP ONC/RPC RTP RTSP RIP SIP SMTP SNMP SSH Telnet TLS/SSL XMPP more... |
| Transport   | TCP UDP DCCP SCTP RSVP more...                                                                                                  |
| Internet    | IP IPv4 IPv6 ICMP ICMPv6 ECN IGMP IPsec more...                                                                                 |
| Link        | ARP NDP OSPF Tunnels L2TP PPP MAC Ethernet Wi-Fi DSL ISDN FDDI                                                                  |

OSI 7 layers
| n | name         | protocols                                                                                                                                                                        |
|---|--------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 7 | Application  | NNTP SIP SSI DNS FTP Gopher HTTP NFS NTP SMPP SMTP SNMP Telnet DHCP Netconf more....                                                                                             |
| 6 | Presentation | MIME XDR ASN.1                                                                                                                                                                   |
| 5 | Session      | Named pipe NetBIOS SAP PPTP RTP SOCKS SPDY                                                                                                                                       |
| 4 | Transport    | TCP UDP SCTP DCCP SPX                                                                                                                                                            |
| 3 | Network      | IP IPv4 IPv6 ICMP IPsec IGMP IPX AppleTalk X.25 PLP                                                                                                                              |
| 2 | Data link    | ATM ARP IS-IS SDLC HDLC CSLIP SLIP GFP PLIP IEEE 802.2 LLC MAC L2TP IEEE 802.3 Frame Relay ITU-T G.hn DLL PPP X.25 LAPB Q.921 LAPD Q.922 LAPF                                    |
| 1 | Physical     | EIA/TIA-232 EIA/TIA-449 ITU-T V-Series I.430 I.431 PDH SONET/SDH PON OTN DSL IEEE 802.3 IEEE 802.11 IEEE 802.15 IEEE 802.16 IEEE 1394 ITU-T G.hn PHY USB Bluetooth RS-232 RS-449 |

watch a bunch of vids on the net

Go through all the layers and check out tools to explore the layers on his own computer!
