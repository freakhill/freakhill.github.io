+++
title = "Teach programming to my friend"
description = "... stuff to teach so he can work with me..."
date = 2019-03-17
weight = 85
draft = false
in_search_index = true
+++

How to go through:
1. Complete Part 1
2. Go through Parts 2-6 in a non-linear way
3. Go through Parts 7-9 in a non-linear way

My friend is on MacOS, so the current curriculum is a bit macos centric.

**Important!**

- The student will write an online book containing their acquired knowledge.
- The student will write anki cards for the purpose of review
- The teacher will collaboratively edit the student's book and anki cards.

https://apps.ankiweb.net/

☮ <- stuff the student should be able to check out first, independently

## Curriculum

1. Basic use and knowledge of common Tools (git,vscode,docker,zola,markdown)
   - ☮ update student's computer's OS
   - ☮ brew, install git/tldr/bash4/iterm2/python3
   - ☮ [markdown](https://www.markdowntutorial.com)
   - git
     - ☮ [Tutorial](https://learngitbranching.js.org/)
     - ☮ [Git simple Guide](http://rogerdudler.github.io/git-guide/)
     - ☮ [Slightly more advanced guide](http://gitimmersion.com/lab_01.html)
   - bash
     - ☮ [bash academy](https://www.bash.academy/)
     - ☮ [ryan's tutorials](https://ryanstutorials.net/bash-scripting-tutorial/)
     - [bash reference manual](https://www.gnu.org/software/bash/manual/bash.html)
     - [advanced bash scripting guide](http://www.tldp.org/LDP/abs/html/)
   - ☮ vim (use vimtutor)
   - ☮ install vscode (get markdown plugins, get vim plugin) [doc](https://code.visualstudio.com/docs?start=true)
   - github [lessons](https://lab.github.com/) run following courses:
       - ☮ Introduction to GitHub
       - ☮ Introduction to HTML
       - ☮ GitHub pages
       - ☮ Uploading your project to GitHub
       - ☮ Communicating using Markdown
       - ☮ Managing merge conflicts
       - make a github account
       - make a github pages repository
       - make a github repository for anki cards
   - [Zola](https://www.getzola.org/documentation/getting-started/installation/)
   - docker
     1. [install](https://docs.docker.com/docker-for-mac/install/)
     2. [Docker in 12 minutes](https://www.youtube.com/watch?v=YFl2mCHdv24)
     3. [Getting started with Docker](https://serversforhackers.com/c/getting-started-with-docker)
     4. [learndocker.online](https://learndocker.online/)
     5. [sysadmin crash course on docker](https://sysadmincasts.com/episodes/31-introduction-to-docker)
     6. or maybe 6 or 7 or 2... [Docker for beginners](https://docker-curriculum.com/)
   - man
   - ☮ anki
   - ☮ A taste of programming: 
     1. ☮ brew install python3
     2. ☮ launch "python3" in iterm2
     3. ☮ [Learn X in Y minutes - Python 3](https://learnxinyminutes.com/docs/python3/)
     4. [Write Yourself a Git!](https://wyag.thb.lt/)
     5. [Python documentation](https://docs.python.org/3/)
   - **Deliverables**: student github repositories, online book & anki cards and knowledge necessary to start editing
2. Computers
   - Logical model & Physical reality - the power of abstractions!
   - Layer 1 of knowledge
     - ☮ [Von Neumann architecture](https://en.wikipedia.org/wiki/Von_Neumann_architecture)
     - ☮ [Harvard architecture](https://en.wikipedia.org/wiki/Harvard_architecture)
     - ☮ [Modified harvard architecture](https://en.wikipedia.org/wiki/Harvard_architecture)
     - ☮ [Study Tonight - Computer Architecture](https://www.studytonight.com/computer-architecture/introduction-to-history-of-computing)
     - ☮ [Study Tonight - Introduction to Operating Systems](https://www.studytonight.com/operating-system/introduction-operating-systems)
   - Layer 2 of knowledge
     - ☮ [Build and 8 bit computer from scratch](https://eater.net/8bit)
     - ☮ [GeeksForGeeks Operating Systems](https://www.geeksforgeeks.org/operating-systems/)
     - ☮ [BIOS](https://en.wikipedia.org/wiki/BIOS)
     - ☮ [UEFI](https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface)
     - ☮ [Protection levels](https://en.wikipedia.org/wiki/Protection_ring)
     - ☮ [Virtualization](https://en.wikipedia.org/wiki/Virtualization)
     - ☮ [File Systems (Wikipedia)](https://en.wikipedia.org/wiki/File_system)
     - ☮ [Ext4 and other linux filesystems](https://opensource.com/article/18/4/ext4-filesystem)
     - ☮ [what every programmer should know about memory](https://people.freebsd.org/~lstewart/articles/cpumemory.pdf)
     - ☮ [what every programmer should know about concurrency](https://assets.bitbashing.io/papers/concurrency-primer.pdf)
   - Layer 3 of knowledge
     - "Modern processor design" book
     - "Formal development of a network-centric RTOS" book
     - [Operating Systems 3 easy pieces](http://pages.cs.wisc.edu/~remzi/OSTEP/)
     - [Hack The Kernel - Harvard? OS course](https://www.ops-class.org/)
   - Assembly
     - [Programming from the Ground up / practical assembly](http://ftp.yzu.edu.tw/nongnu/pgubook/ProgrammingGroundUp-1-0-booksize.pdf)
     - [Assembly programming with Ubuntu](http://www.egr.unlv.edu/~ed/assembly64.pdf)
     - [Reverse engineering for beginners](https://beginners.re/dl.html)
   - **Deliverables**: Program a GameBoy emulator
     - [doc that will help](https://www.cl.cam.ac.uk/~pv273/slides/emulation.pdf)
     - [Awesome GameBoy development](https://github.com/gbdev/awesome-gbdev)
     - [GameBoy complete hardware reference](https://gekkio.fi/files/gb-docs/gbchr.pdf)
     - [GameBoy complete technical reference](https://gekkio.fi/files/gb-docs/gbctr.pdf)
     - [The ultimate GameBoy talk](https://media.ccc.de/v/33c3-8029-the_ultimate_game_boy_talk)
     - [GameBoy CPU manual](http://marc.rawer.de/Gameboy/Docs/GBCPUman.pdf)
     - [PySQL2 Python SDL library for IO](https://pypi.org/project/PySDL2/)
3. Networking
   - ☮ [Networking fundamentals](https://mva.microsoft.com/en-US/training-courses/networking-fundamentals-8249?l=zcmNgKKy_1704984382)
   - [StudyTonight Computer Networks](https://www.studytonight.com/computer-networks/overview-of-computer-networks)
   - OSI 7 layers and tools to poke and probe
   - How internet works
   - More about the big protocols, TCP, IP, UDP, DNS, TLS, HTTP1.1, HTTP2
   - L4 load balancers, L7 load balancers
   - VLAN
   - SDN
   - learn about curl, ping, wireshark, dig, netstat, ip, hostname, ifconfig, hosts file others...
   - A little diving about mobile phones low level layers? LTE etc?
   - **Deliverables**:
     1. Implement GameBoy Game Link over network, LAN and Internet
4. Databases
   - text files & bash
     - head,tail,cut,sed,tr,awk...
   - CSV files
     - [csvtool, csv from bash](https://colin.maudry.com/csvtool-manual-page/)
     - [CSV from python](https://docs.python.org/3/library/csv.html)
   - Json files
     - [Learn X in Y minutes - json](https://learnxinyminutes.com/docs/json/)
     - [jq tutorial](https://stedolan.github.io/jq/tutorial/) 
     - [python json](https://docs.python.org/3/library/json.html)
   - Excel sheets
     - [Access excel files from python](https://openpyxl.readthedocs.io/en/stable/)
   - Redis
     - [Redis doc](https://redis.io/documentation)
   - SQLite, MySQL & SQL
     - [SQLbolt - a nice interactive guide](https://sqlbolt.com/)
     - [StudyTonight - overview of DBMS](https://www.studytonight.com/dbms/overview-of-dbms.php)
     - [SQL course for beginners](https://www.youtube.com/watch?v=HXV3zeQKqGY)
     - Popsql & MysqlWorkbench
     - [SQLite doc](https://sqlite.org/docs.html)
     - "SQL and Relational Theory: How to Write Accurate SQL Code" book
     - [A basic MySQL tutorial](https://www.digitalocean.com/community/tutorials/a-basic-mysql-tutorial)
     - [Sysadmin crash course on mysql](https://sysadmincasts.com/episodes/38-crash-course-on-mysql)
     - [MySQL doc](https://dev.mysql.com/doc/)
   - ANSI isolation model (and its critique)
     - [Transactions](https://en.wikipedia.org/wiki/Database_transaction)
     - [Isolation (database systems)](https://en.wikipedia.org/wiki/Isolation_(database_systems))
     - [A Quick Primer on Isolation Levels and Dirty Reads](https://www.infoq.com/articles/Isolation-Levels)
     - [A critique of ANSI SQL isolation levels](https://blog.acolyer.org/2016/02/24/a-critique-of-ansi-sql-isolation-levels/)
     - Mention AWS Aurora and its [limitations](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Replication.html)
   - Indexes
     - [Use The Index Luke!](https://www.geeksforgeeks.org/fundamentals-of-algorithms/)
   - MVCC, 2PC etc. (find my book on databases systems at home)
   - RIAK & Eventual consistency
   - **Deliverables**: ???
5. Programming
   - ☮ [What is a programmer?](./handmade/programmer.md)
   - ☮ [TODO: really basic maths](./handmade/maths.md)
   - Information & Compression (a quick way to "show" information)
   - The power of representation, moving a point in cartesian coordinate system, or in polar coordinate system
   - ☮ Speedrun through [Harvard Introduction to computer sciences](https://courses.edx.org/courses/course-v1:HarvardX+CS50+X/course/)
   - ☮ [MIT's Introduction to algorithms](https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-006-introduction-to-algorithms-fall-2011/lecture-videos/)
   - [The law of leaky abstractions](https://en.wikipedia.org/wiki/Leaky_abstraction)
   - A quick passage on HTMK to start being able to make websites
     - "HTML5 Up and Running"
     - "HTML&CSS"
     - "JAVASCRIPT&JQUERY"
   - Algorithms 
     - "Introduction to algorithms" book
     - [Berkeley's Algorithms & Data Structures](https://archive.org/details/ucberkeley-webcast-PL-XXv-cvA_iDD4nnsfVIqPFORTgZi9xRp)
     - Princeton's [Algorithms, Part 1](https://www.coursera.org/learn/algorithms-part1?ranMID=40328&ranEAID=jU79Zysihs4&ranSiteID=jU79Zysihs4-Z7RPjkUnAqM22ezTfFEpbg&siteID=jU79Zysihs4-Z7RPjkUnAqM22ezTfFEpbg&utm_content=10&utm_medium=partners&utm_source=linkshare&utm_campaign=jU79Zysihs4)
     - "Pearls of functional algorithm design" book
     - [GeeksForGeeks algorithms](https://www.geeksforgeeks.org/fundamentals-of-algorithms/)
     - [GeeksForGeeks data structures](https://www.geeksforgeeks.org/data-structures/)
   - Go through the big families of languages with "Concepts, Techniques and Models of Computer Programming"
   - Assembly
   - C
     - [Learn X in Y minutes - C](https://learnxinyminutes.com/docs/c/)
     - debating getting "Learn C the hard way" book
     - [Study Tonight - C programming language](https://www.studytonight.com/c/overview-of-c.php)
   - Clojure
   - Smalltalk
     - [Learn X in Y minutes - smalltalk](https://learnxinyminutes.com/docs/smalltalk/)
     - [pharo](http://pharo.org/web)
   - Haskell
     - [Learn you a haskell for great good](http://learnyouahaskell.com/)
   - more more more languages... 
   - [Object relational impedance mismatch](https://en.wikipedia.org/wiki/Object-relational_impedance_mismatch)
   - "Purely functional data structures"
   - "Pears of functional algorithm design"
   - **Deliverables**: ???
6. Engineering
   - Explain tradeoffs and hoe no concepts in the following books are absolute. Always look for the tradeoffs.
   - ☮ [Joe Armstrong's "The Mess we are in"](https://www.youtube.com/watch?v=lKXe3HUG2l4)
   - ☮ [Rich Hickey's greatest hits](https://changelog.com/posts/rich-hickeys-greatest-hits)
   - "Clean Code: A Handbook of Agile Software Craftsmanship"
   - "Refactoring: Improving the Design of Existing Code (2nd Edition)"
   - "Enterprise Integration Patterns: Designing, Building, and Deploying Messaging Solutions"
   - "Domain-Driven Design: Tackling Complexity in the Heart of Software"
   - "Design Patterns: Elements of Reusable Object-Oriented Software"
   - "SOA Patterns"
   - "Site reliability Engineering"
   - "Systems Performance - Entreprise and the cloud"
   - find my book on Queueing systems
   - **Deliverables**: ?? make a full web app for something ??
7. Specialization to work in my team
   - ssh
   - Linux
     - Get access to a Linux machine on AWS or GCP or Azure or whatever...
       - [Amazon EC2 doc](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html)
     - setup a docker image to work with for usual stuff
     - [checkout all the courses on Linux basics](https://sysadmincasts.com/episode-guide)
     - [sysadmin introduction to cgroups](https://sysadmincasts.com/episodes/14-introduction-to-linux-control-groups-cgroups)
     - [The Linux Journey](https://linuxjourney.com/)
     - "The Linux Programming Interface"book
     - "Understanding Linux Network Internals"
     - "Linux Kernel Networking" book
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
       - [Learn X in Y minutes - Clojure](https://learnxinyminutes.com/docs/clojure/)
       - [official doc](https://clojure.org/guides/learn/syntax)
       - [4clojure](http://www.4clojure.com/)
       - [exercism](https://exercism.io/)
     - intermediate Rust
       - [Learn X in Y minutes - rust](https://learnxinyminutes.com/docs/rust/)
       - [The Rust Programming Language](https://doc.rust-lang.org/book/)
       - [exercism](https://exercism.io/)
     - intermediate Java
       - [Learn X in Y minutes - Java](https://learnxinyminutes.com/docs/java/)
       - [Oracle doc](https://docs.oracle.com/javase/tutorial/index.html)
       - [exercism](https://exercism.io/)
     - intermediate Javascript
       - [Eloquent JavaScript](http://eloquentjavascript.net/)
       - [You don't know JS](https://github.com/getify/You-Dont-Know-JS/blob/master/README.md)
       - [JS the right way](http://jstherightway.org/)
       - [MDN JS Guide](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide)
       - [exercism](https://exercism.io/)
     - intermediate Python
       - [Python Tutorial for Beginners](https://www.youtube.com/watch?v=yE9v9rt6ziw)
       - [Google Python Class](https://developers.google.com/edu/python/)
       - [Automating the boring stuff with Python](http://automatetheboringstuff.com/)
       - [Introduction to Computer Science and Programming using Python](https://courses.edx.org/courses/course-v1:MITx+6.00.1x+1T2019/course/)
       - [Python documentation](https://docs.python.org/3/)
       - [exercism](https://exercism.io/)
     - Centos7 & SystemD
     - **Deliverables**: ???
8. Security, debugging, reverse engineering
   ... lots of stuff i picked up organically there...
9. Optional
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

Notes:
- [GameMaker Studio 2](https://www.yoyogames.com/learn)
- [Nice ZFS video guide](https://sysadmincasts.com/episodes/35-zfs-on-linux-part-1-of-2)
- [hacker.io, resource to find courses and tutorials](https://hackr.io/)
- [blackshadows cheat sheets](https://github.com/black-shadows/Cheat-Sheets)
