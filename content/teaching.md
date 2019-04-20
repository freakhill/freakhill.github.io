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

We will run parallely through these courses, insisting on practical use of knowledge. Demonstrating the concepts on the student's computer and other electronic appliances (iphone? PS4?).

We will start with practical use of industry tools before brushing the theory so that it is easier to anchor the student't knowledge in reality.

My friend is on MacOS, so the current curriculum is a bit macos centric.

[hacker.io, resource to find courses and tutorials](https://hackr.io/)

- We will go through the content in a non-linear way.
- We will code in bash until Python is introduced.
- The student will write an online book containing their acquired knowledge.
- The student will write anki cards for the purpose of review
- The teacher will collaboratively edit the student's book and anki cards.

https://apps.ankiweb.net/

## Curriculum

1. Basic use and knowledge of common Tools (git,vscode,docker,zola,markdown)
   - update student's computer's OS
   - brew, install git/tldr/bash4/iterm2
   - [markdown](https://www.markdowntutorial.com)
   - git
     - [Tutorial](https://learngitbranching.js.org/)
     - [Git simple Guide](http://rogerdudler.github.io/git-guide/)
     - [Slightly more advanced guide](http://gitimmersion.com/lab_01.html)
   - bash
     - [bash academy](https://www.bash.academy/)
     - [ryan's tutorials](https://ryanstutorials.net/bash-scripting-tutorial/)
     - [bash reference manual](https://www.gnu.org/software/bash/manual/bash.html)
     - [advanced bash scripting guide](http://www.tldp.org/LDP/abs/html/)
   - vim (use vimtutor)
   - vscode (get markdown plugins, get vim plugin) [doc](https://code.visualstudio.com/docs?start=true)
   - github [lessons](https://lab.github.com/) run following courses:
       - Introduction to GitHub
       - Introduction to HTML
       - GitHub pages
       - Uploading your project to GitHub
       - Communicating using Markdown
       - Managing merge conflicts
   - [zola](https://www.getzola.org/documentation/getting-started/installation/) (or any other static website generator the teacher fancies)
   - docker
     1. [install](https://docs.docker.com/docker-for-mac/install/)
     2. [Docker in 12 minutes](https://www.youtube.com/watch?v=YFl2mCHdv24)
     3. [Getting started with Docker](https://serversforhackers.com/c/getting-started-with-docker)
     4. [learndocker.online](https://learndocker.online/)
     5. or maybe 6 or 7 or 2... [Docker for beginners](https://docker-curriculum.com/)
   - man
   - anki
   - **Deliverables**: student github repositories, online book & anki cards and knowledge necessary to start editing
   - A taste of programming: [Write Yourself a Git!](https://wyag.thb.lt/)
2. Computers
   - ... todo ... how a computer works from scratch
   - Ring level, BIOS, MBR, Partitions, Operating systems, filesystems...
   - everything a system programmer should know about /concurrency/memory/
     - [what every programmer should know about concurrency](https://assets.bitbashing.io/papers/concurrency-primer.pdf)
     - [what every programmer should know about memory](https://people.freebsd.org/~lstewart/articles/cpumemory.pdf)
3. Networking
   - [Networking fundamentals](https://mva.microsoft.com/en-US/training-courses/networking-fundamentals-8249?l=zcmNgKKy_1704984382)
   - OSI 7 layers and tools to poke and probe
   - How internet works
   - More about the big protocols, TCP, IP, UDP, DNS, TLS, HTTP1.1, HTTP2
   - L4 load balancers, L7 load balancers
   - VLAN
   - SDN
   - learn about curl, ping, wireshark, dig, netstat, ip, hostname, ifconfig, hosts file others...
4. Databases
   - text files & bash
   - CSV files & ???
   - Json file & jq
   - Excel sheets
   - Key Value storage (Redis)
     - Redis doc
   - SQLite, MySQL & SQL
     - "SQL and Relational Theory: How to Write Accurate SQL Code" book
   - ANSI isolation model (and its critique)
     - [Transactions](https://en.wikipedia.org/wiki/Database_transaction)
     - [Isolation (database systems)](https://en.wikipedia.org/wiki/Isolation_(database_systems))
     - [A Quick Primer on Isolation Levels and Dirty Reads](https://www.infoq.com/articles/Isolation-Levels)
     - [A critique of ANSI SQL isolation levels](https://blog.acolyer.org/2016/02/24/a-critique-of-ansi-sql-isolation-levels/)
   - Indexes
     - [Use The Index Luke!](https://www.geeksforgeeks.org/fundamentals-of-algorithms/)
   - MVCC, 2 phase commit, PAXOS, CAP theorem
   - RIAK
   - Eventual consistency
5. Programming
   - ... todo ... ordering stuff
   - what is a program?
   - A very brief over html5/css/js/the dom model
     - "HTML5 Up and Running" book
     - "HTML&CSS" book, "JAVASCRIPT&JQUERY" book
     - [30 days to learn HTML and CSS](https://www.youtube.com/playlist?list=PLgGbWId6zgaWZkPFI4Sc9QXDmmOWa1v5F)
   - Go through the big families of languages with "Concepts, Techniques and Models of Computer Programming"
   - Assembly
   - C
   - Clojure
   - Rust
   - Algorithms 
     - "Introduction to algorithms" book
     - Princeton's [Algorithms, Part 1](https://www.coursera.org/learn/algorithms-part1?ranMID=40328&ranEAID=jU79Zysihs4&ranSiteID=jU79Zysihs4-Z7RPjkUnAqM22ezTfFEpbg&siteID=jU79Zysihs4-Z7RPjkUnAqM22ezTfFEpbg&utm_content=10&utm_medium=partners&utm_source=linkshare&utm_campaign=jU79Zysihs4)
     - [GeeksForGeeks algorithms](https://www.geeksforgeeks.org/fundamentals-of-algorithms/)
     - [GeeksForGeeks data structures](https://www.geeksforgeeks.org/data-structures/)
     
   - Data structure
   - Purely functional data structures
   - Programming pearls
6. Engineering
   - i need to brush out on clean code & 4 gang to make a curriculum here
   - ... TDD,DDD,Agile,Refactoring,Design patterns?
7. Specialization to work in my team
   - ssh
   - Linux
     - Get access to a Linux machine on AWS or GCP or Azure or whatever...
       - [Amazon EC2 doc](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html)
     - [The Linux Journey](https://linuxjourney.com/)
     - "The Linux Programming Interface" (lend him my book)
     - [Linux System Administration Basics](https://www.linode.com/docs/tools-reference/linux-system-administration-basics/)
     - [Introduction to Linux EDX guide](https://courses.edx.org/courses/course-v1:LinuxFoundationX+LFS101x+3T2018/course/)
     - debating on buying "UNIX and Linux System AdministrationHandbook (5th edition)"
   - ELK
   - Prometheus
   - Haproxy
   - MySQL
   - Jenkins
     - [short video guide](https://www.youtube.com/watch?list=PL9ooVrP1hQOGM6eCsjnfAousUSvpqD8dW&v=Lxd6JMMxuwo)
     - [o'reilly book - Jenkins, the definitive guide](https://www.bogotobogo.com/DevOps/Jenkins/images/Intro_install/jenkins-the-definitive-guide.pdf)
     - Jenkinsfiles
     - [Chef](https://learn.chef.io/#/)
     - intermediate Clojure
     - intermediate Rust
     - intermediate Java
     - intermediate Javascript
       - [Eloquent JavaScript](http://eloquentjavascript.net/)
       - [You don't know JS](https://github.com/getify/You-Dont-Know-JS/blob/master/README.md)
       - [MDN JS Guide](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide)
     - intermediate Python
       - [Python Tutorial for Beginners](https://www.youtube.com/watch?v=yE9v9rt6ziw)
       - [Google Python Class](https://developers.google.com/edu/python/)
       - [Automating the boring stuff with Python](http://automatetheboringstuff.com/)
       - [Python documentation](https://docs.python.org/3/)
     - Centos7 & SystemD
8. Optional
   - Android dev.
     - [Stanford Android Development course](http://web.stanford.edu/class/cs193a/videos.shtml)
     
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
