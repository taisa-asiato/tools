#G##########################################################
# $B%U%m!<$N?t$r%+%&%s%H$7(B, 1$B%Q%1%C%H%U%m!<$N$_=PNO$9$k(B
###########################################################

flow = Hash.new{ 0 }
user = Hash.new{ 0 }
top100 = Hash.new{ 0 }

# $B85$N%H%l!<%9$+$i(B, $B3F%U%m!<$N(Bid$B$H$=$N9=@.%Q%1%C%H?t$r%+%&%s%H(B
File.open( ARGV[0], "r" ) do | openfile |
	while line = openfile.gets
		line_split = line.split(" ")

		#flow id $B$N:n@.(B
		flow_id = line_split[0] + " " + line_split[1] + " " + line_split[2] + " " + line_split[3] + " " + line_split[4]

		flow[flow_id] = flow[flow_id] + 1;
	end
end

# 1$B%Q%1%C%H%U%m!<$r@8@.$7$?(Buser$BKh$K(B, 1$B%Q%1%C%H%U%m!<$r$$$/$D@8@.$7$?$+%+%&%s%H(B
flow.each{|key, value| 
	if value == 1 then 
		flow_split = key.split(" ")
		user[flow_split[0]] = user[flow_split[0]] + 1
	end
}
user = user.sort{ |(k1, v1), (k2, v2)| v2 <=> v1 }

# top100$B$N@8@.(B
for i in 0...100 do 
	key, value = user.shift
	# print key, " ", value, "\n"
	top100[key] = 1
end

File.open( ARGV[0], "r" ) do | openfile1 |
	while line = openfile1.gets
		line_split = line.split(" ")
		flow_id = line_split[0] + " " + line_split[1] + " " + line_split[2] + " " + line_split[3] + " " + line_split[4]
		
		if ARGV[1] == "all" then 
			if flow[flow_id] != 1 then 
				print line
			end
		elsif ARGV[1] == "top100" then
			if flow[flow_id] == 1 then 
				if top100[line_split[0]] != 1 then 
					print line 
				end
			elsif flow[flow_id] != 1 then 
				print line
			end
		end
	end
end
