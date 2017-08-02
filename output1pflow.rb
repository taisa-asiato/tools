#
# 1パケットフローのみ出力する
#
	
flow = Hash.new{ 0 }
user = Hash.new{ 0 }
top100 = Hash.new{ 0 }

# 元のトレースから, 各フローのidとその構成パケット数をカウント
File.open( ARGV[0], "r" ) do | openfile |
	while line = openfile.gets
		line_split = line.split(" ")

		#flow id の作成
		flow_id = line_split[0] + " " + line_split[1] + " " + line_split[2] + " " + line_split[3] + " " + line_split[4] + "\n"
		flow[flow_id] = flow[flow_id] + 1;
	end
end

flow.each{|key, value|
	if value == 1 then 
		print key
	end
}
