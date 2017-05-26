#G##########################################################
# フローの数をカウントし, 1パケットフローのみ出力する
###########################################################

flow = Hash.new{ 0 }
user = Hash.new{ 0 }
top100 = Hash.new{ 0 }

# 元のトレースから, 各フローのidとその構成パケット数をカウント
File.open( ARGV[0], "r" ) do | openfile |
	while line = openfile.gets
		line_split = line.split(" ")

		#flow id の作成
		flow_id = line_split[0] + " " + line_split[1] + " " + line_split[2] + " " + line_split[3] + " " + line_split[4]

		flow[flow_id] = flow[flow_id] + 1;
	end
end

# 1パケットフローを生成したuser毎に, 1パケットフローをいくつ生成したかカウント
flow.each{|key, value| 
	if value == 1 then 
		flow_split = key.split(" ")
		user[flow_split[0]] = user[flow_split[0]] + 1
	end
}
user = user.sort{ |(k1, v1), (k2, v2)| v2 <=> v1 }

# top100の生成
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
