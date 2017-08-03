#
# 八巻先生が生成したテキストデータを, 自身のシミュレータや解析プログラムで
# 使用できるようにテキストデータを変更するプログラム
#

File.open( ARGV[0], "r" ) do | openfile |
	while line = openfile.gets
		line_split = line.split(" ")
		print line_split[1], " ", line_split[3], " ", line_split[5], " ", line_split[2], " ", line_split[4], " ", line_split[0], "\n"
	end 
end
