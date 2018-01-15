require "time"
#line_size = Hash.new( 0 )
month = Hash.new
month["Jan"] = 1
month["Feb"] = 2
month["Mar"] = 3
month["Apr"] = 4
month["May"] = 5
month["Jun"] = 6
month["Jul"] = 7
month["Aug"] = 8
month["Sep"] = 9
month["Oct"] = 10
month["Nov"] = 11
month["Dec"] = 12

first_packet = 0
time_prev = Time.new
time_first = Time.new
prev_ref_time = 0.000000000
first_ref_time = 0.000000000
#time_now = Time.new

File.open( ARGV[0], "r:utf-8" ) do | openfile |
	while line = openfile.gets
		line_split = line.split(" ")
		line_size = line_split.length
		if line_size == 18 || line_size == 24  then 
			srcip_split = line_split[0].split(",")
			dstip_split = line_split[1].split(",")
		
			#$B%Q%1%C%H$NE~Ce;~9o$rBeF~(B, time[0]$B$,(Bh, time[1]=m, time[0]=s
			time = line_split[line_size - 3].split(":")
			#$BF|$K$A$rBeF~(B
			date = line_split[line_size - 5].split(",")

			#Time$B%/%i%9$N%U%)!<%^%C%H$K9g$o$;$F;~9o$r@_Dj(B
			time_now = Time.local( line_split[line_size - 4].to_i, month[line_split[line_size - 6]].to_i, date[0].to_i, time[0].to_i, time[1].to_i, time[2].to_f )

			#$BBh0l%Q%1%C%HL\$O(B, $B;~9o$N:9J,$r5a$a$J$$5a$a$J$$(B
			if first_packet == 0 then 
				time_first = time_now
				first_packet = 1
			end

			#$B0lHV:G=i$N%Q%1%C%H$+$i2?IC8e$KMh$?%Q%1%C%H$+$r5a$a$k(B
			first_ref_time = time_now - time_first

			if srcip_split.length == 1 && dstip_split.length == 1 then
				if line_split[2] == "Transmission" then
					srcport = line_split[7].split(",")
					dstport = line_split[10].split(",")
					print line_split[0], " ", line_split[1], " TCP ", srcport[0], " ", dstport[0], " ", sprintf( "%.6f", first_ref_time ), "000", " ", line_split[line_size-1], "\n"
				elsif line_split[2] == "User" then 
					srcport = line_split[7].split(",")
					print line_split[0], " ", line_split[1], " UDP ", srcport[0], " ", line_split[10], " ", sprintf( "%.6f", first_ref_time ), "000", " ", line_split[line_size-1], "\n"
				end
			end
		end
	end
end
#line_size.sort.each {|size, number| print size, " ", number, "\n" }
