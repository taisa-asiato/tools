#!/bin/bash
num=0

echo "2009_0402_0100.pcap toukei.sh"
tshark -r 2009_0402_0100.pcap \
	-q \
	-z io,phs

#ipはIPv4, ipv6はIPv6:どちらか判別して表示できればそれのほうが良いか
#-e tpc -e udp の部分も, TCPかUDPか判別して表示できれば最高だが
#_ws.col.Protocol は, プロトコルを文字にして表示する (OpenVPNやDNS, ICMPなど)
#最後の一行は, TCPまたはUDPのもののみ表示する
# -e tcp.srcport -e udp.srcport -e tcp.dstport -e udp.dstport \
#2016_0402_bunkatu_00000
