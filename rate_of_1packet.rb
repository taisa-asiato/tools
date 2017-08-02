#
# ./sim $B$r(Bdebug$BIU$-$GF0:n$5$;$?;~$N=PNO%Q%1%C%H$K(B, $B$I$l$[$I(B1$B%Q%1%C%H%U%m!<$,:.F~$7$F$$$k$+$rD4$Y$k(B
#
	
flow_1p = Hash.new{ 0 }
skip_1p_count = 0.0
count = 0.0
# 1$B%Q%1%C%H%U%m!<$N%O%C%7%e$N:n@.(B
File.open( ARGV[0], "r:utf-8" ) do | openfile |
	while line = openfile.gets
		line_split = line.split(" ")

		# flow id $B$N:n@.(B
		flow_id = line_split[0] + " " + line_split[1] + " " + line_split[2] + " " + line_split[3] + " " + line_split[4]
		flow_1p[flow_id] = flow_1p[flow_id] + 1;
		#puts line
	end
end

File.open( ARGV[1], "r" ) do | openfile1 |
	while line = openfile1.gets
		line_split = line.split(" ")
		flow_id = line_split[0] + " " + line_split[1] + " " + line_split[2] + " " + line_split[3] + " " + line_split[4]
		if flow_1p[flow_id] == 1 then 
			skip_1p_count = skip_1p_count + 1
		end
		count = count + 1
	end
end

print skip_1p_count / count, "\n"
