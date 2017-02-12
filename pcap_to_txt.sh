#!/bin/bash
num=9

while [ $num -le 4 ]
do
echo "./20160601/20160601_bunkatu_0000$num >> sample_20160601.out"
tshark -r ./20160402_bunkatu_0000$num -T fields -E separator=" " \
	-e ip.src -e ip.dst \
	-e tcp -e udp \
	-e _ws.col.Protocol \
	-e frame.time_relative \
	-Y "udp or tcp"  >> sample_20160402.out
num=`expr $num + 1`
done

#ip$B$O(BIPv4, ipv6$B$O(BIPv6:$B$I$A$i$+H=JL$7$FI=<($G$-$l$P$=$l$N$[$&$,NI$$$+(B
#-e tpc -e udp $B$NItJ,$b(B, TCP$B$+(BUDP$B$+H=JL$7$FI=<($G$-$l$P:G9b$@$,(B
#_ws.col.Protocol $B$O(B, $B%W%m%H%3%k$rJ8;z$K$7$FI=<($9$k(B (OpenVPN$B$d(BDNS, ICMP$B$J$I(B)
#$B:G8e$N0l9T$O(B, TCP$B$^$?$O(BUDP$B$N$b$N$N$_I=<($9$k(B
# -e tcp.srcport -e udp.srcport -e tcp.dstport -e udp.dstport \
