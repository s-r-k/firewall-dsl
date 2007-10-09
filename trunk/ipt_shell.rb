system("racc /home/srk/dev/ipt/ipt.grammar -o /home/srk/dev/ipt/iptables_parser.rb")

require 'iptables_parser'
parser = IPTablesParser.new
count = 0
scnt	= 0

puts
puts 'type "Q" to quit.'
puts
tests = [
"drop [incoming, outgoing, forwarded] connections",
"allow [incoming, outgoing, forwarded] connections",
"allow [incoming,outgoing] connections in [established, related, invalid] state",
"Allow [incoming] SSH connections from [3.2.1.0/24, 1.4.20.0/24]",
"Allow [incoming] SSH connections from TWI",

"TWI=[3.2.1.0/24, 1.4.20.0/24]"
]
#tests.each do |test|
#  begin
#    puts "Test >> #{test}"
#    val = parser.parse( test )
#    print 'Response >> ', val, "\n"
#  rescue ParseError
#    puts $!
#    count +=1
#  end
#end
#
#p "#{count} Error(s)!!!! beware!" if count > 0

while true do
	puts
	print '? '
	str = gets.chop!
	break if /q/i === str

	begin
		val = parser.parse( str )
		print '= ', val, "\n"
	rescue ParseError
		puts $!
	end

end
