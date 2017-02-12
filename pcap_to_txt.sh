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

#ipはIPv4, ipv6はIPv6:どちらか判別して表示できればそれのほうが良いか
#-e tpc -e udp の部分も, TCPかUDPか判別して表示できれば最高だが
#_ws.col.Protocol は, プロトコルを文字にして表示する (OpenVPNやDNS, ICMPなど)
#最後の一行は, TCPまたはUDPのもののみ表示する
# -e tcp.srcport -e udp.srcport -e tcp.dstport -e udp.dstport \
