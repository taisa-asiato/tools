#!/bin/bash
num=0

while [ $num -le 4 ]
do
echo "2016_0402_bunkatu_0000$num toukei.sh"
tshark -r 2016_0402_bunkatu_0000$num \
	-q \
	-z io,phs
num=`expr $num + 1`
done

#ipはIPv4, ipv6はIPv6:どちらか判別して表示できればそれのほうが良いか
#-e tpc -e udp の部分も, TCPかUDPか判別して表示できれば最高だが
#_ws.col.Protocol は, プロトコルを文字にして表示する (OpenVPNやDNS, ICMPなど)
#最後の一行は, TCPまたはUDPのもののみ表示する
# -e tcp.srcport -e udp.srcport -e tcp.dstport -e udp.dstport \
#2016_0402_bunkatu_00000
