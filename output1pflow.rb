#
# 1$B%Q%1%C%H%U%m!<$N$_=PNO$9$k(B
#
	
flow = Hash.new{ 0 }
user = Hash.new{ 0 }
top100 = Hash.new{ 0 }

# $B85$N%H%l!<%9$+$i(B, $B3F%U%m!<$N(Bid$B$H$=$N9=@.%Q%1%C%H?t$r%+%&%s%H(B
File.open( ARGV[0], "r" ) do | openfile |
	while line = openfile.gets
		line_split = line.split(" ")

		#flow id $B$N:n@.(B
		flow_id = line_split[0] + " " + line_split[1] + " " + line_split[2] + " " + line_split[3] + " " + line_split[4] + "\n"
		flow[flow_id] = flow[flow_id] + 1;
	end
end

flow.each{|key, value|
	if value == 1 then 
		print key
	end
}
