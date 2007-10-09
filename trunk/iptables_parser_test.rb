require 'test/unit'

class IPTablesParserTest < Test::Unit::TestCase

  def setup
    system("racc ipt.grammar -o iptables_parser.rb")
#    puts "Generated....."
    require 'iptables_parser'
  end


  def test_default_actions_with_individual_directions
    parser = IPTablesParser.new
    result = parser.parse "accept incoming connections by default"
    expected = "/sbin/iptables -P INPUT ACCEPT\n"
    assert_equal expected, result

    result = parser.parse "drop outgoing connections by default"
    expected = "/sbin/iptables -P OUTPUT DROP\n"
    assert_equal expected, result
  end

  def test_action_with_direction_and_state
    parser = IPTablesParser.new
    result = parser.parse "accept incoming connections in established state"
    expected = "/sbin/iptables -A INPUT -j ACCEPT -m state --state ESTABLISHED"
    assert_equal expected, result

    result = parser.parse "drop outgoing connections in related state"
    expected = "/sbin/iptables -A OUTPUT -j DROP -m state --state RELATED"
    assert_equal expected, result
  end

  def test_action_with_direction_and_source
    parser = IPTablesParser.new
    result = parser.parse "accept incoming connections from 192.168.1.1"
    expected = "/sbin/iptables -A INPUT -j ACCEPT -s 192.168.1.1"
    assert_equal expected, result

    result = parser.parse "accept incoming connections from 192.168.1.1/24"
    expected = "/sbin/iptables -A INPUT -j ACCEPT -s 192.168.1.1/24"
    assert_equal expected, result

    result = parser.parse "accept incoming connections from 5.4.50.0/255.255.255.0"
    expected = "/sbin/iptables -A INPUT -j ACCEPT -s 5.4.50.0/255.255.255.0"
    assert_equal expected, result

    result = parser.parse "accept incoming connections from 7.0.10.40/255.255.255.0 in new state"
    expected = "/sbin/iptables -A INPUT -j ACCEPT -s 7.0.10.40/255.255.255.0 -m state --state NEW"
    assert_equal expected, result

    result = parser.parse "accept new incoming connections from 5.4.50.0/255.255.255.0"
    expected = "/sbin/iptables -A INPUT -j ACCEPT -m state --state NEW -s 5.4.50.0/255.255.255.0"
    assert_equal expected, result
  end

  def test_variable_assignment
    parser = IPTablesParser.new
    parser.parse "TW = 192.168.1.1"
    result = parser.parse "accept incoming connections from TW"
    expected = "/sbin/iptables -A INPUT -j ACCEPT -s 192.168.1.1"
    assert_equal expected, result
  end

  def test_connection_protocols
    parser = IPTablesParser.new
    parser.parse "TW = 192.168.1.1"
    result = parser.parse "accept incoming tcp connections from TW"
    expected = "/sbin/iptables -A INPUT -j ACCEPT -p tcp -s 192.168.1.1"
    assert_equal expected, result
  end

  def test_multiple_directions
    parser = IPTablesParser.new
    result = parser.parse "accept incoming, outgoing connections by default"
    expected = "/sbin/iptables -P INPUT ACCEPT"
    expected += "\n/sbin/iptables -P OUTPUT ACCEPT\n"
    assert_equal expected, result
  end

  def xtest_multiple_directions_more
    parser = IPTablesParser.new
    result = parser.parse "drop incoming, outgoing, forwarded connections"
    expected = "/sbin/iptables -P INPUT DROP"
    expected += "\n/sbin/iptables -P OUTPUT DROP\n"
    expected += "\n/sbin/iptables -P FORWARD DROP\n"
    assert_equal expected, result
  end
end
