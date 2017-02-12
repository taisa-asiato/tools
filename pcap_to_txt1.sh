#!/bin/bash
num=0

echo "2009_0402_0100 >> sample_2009.out"
tshark -r 2009_0402_0100.pcap -T fields -E separator=" " \
	-e ip.src -e ip.dst \
	-e tcp -e udp \
	-e _ws.col.Protocol \
	-e frame.time \
	-Y "udp or tcp" 

#ipはIPv4, ipv6はIPv6:どちらか判別して表示できればそれのほうが良いか
#-e tpc -e udp の部分も, TCPかUDPか判別して表示できれば最高だが
#_ws.col.Protocol は, プロトコルを文字にして表示する (OpenVPNやDNS, ICMPなど)
#最後の一行は, TCPまたはUDPのもののみ表示する
# -e tcp.srcport -e udp.srcport -e tcp.dstport -e udp.dstport \
