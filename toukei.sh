#!/bin/bash
num=0

echo "2009_0402_0100.pcap toukei.sh"
tshark -r 2009_0402_0100.pcap \
	-q \
	-z io,phs

#ip$B$O(BIPv4, ipv6$B$O(BIPv6:$B$I$A$i$+H=JL$7$FI=<($G$-$l$P$=$l$N$[$&$,NI$$$+(B
#-e tpc -e udp $B$NItJ,$b(B, TCP$B$+(BUDP$B$+H=JL$7$FI=<($G$-$l$P:G9b$@$,(B
#_ws.col.Protocol $B$O(B, $B%W%m%H%3%k$rJ8;z$K$7$FI=<($9$k(B (OpenVPN$B$d(BDNS, ICMP$B$J$I(B)
#$B:G8e$N0l9T$O(B, TCP$B$^$?$O(BUDP$B$N$b$N$N$_I=<($9$k(B
# -e tcp.srcport -e udp.srcport -e tcp.dstport -e udp.dstport \
#2016_0402_bunkatu_00000
