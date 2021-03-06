#
# DO NOT MODIFY!!!!
# This file is automatically generated by racc 1.4.5
# from racc grammer file "ipt.grammar".
#

require 'racc/parser'


require 'strscan'

class IPTablesParser < Racc::Parser

module_eval <<'..end ipt.grammar modeval..id50882cb9d6', 'ipt.grammar', 44

attr_accessor :symbols

def _assign(name, value)
  @symbols = {} if @symbols.nil?
  @symbols[name] = value
end

def _addDirection(dir)
    @directions = [] if @directions.nil?
    @directions.push(DIRECTIONSMAP[dir])
end

def _dereference(name)
  @symbols[name]  
end

def _default_policy(a, direction)
    res = ""
    action = a.upcase
    @directions.each do |dir|
        res += "/sbin/iptables -P #{dir} #{action}\n"
    end
    res
end

def _append(a, direction)
  "/sbin/iptables -A #{direction} -j #{a.upcase}"
end

def _state(a, state)
   "#{a} -m state --state #{state}"
end

def _protocol(a, proto)
   "#{a} -p #{proto}"
end

DIRECTIONSMAP = {"incoming" => "INPUT", "outgoing" => "OUTPUT"}
def parse( str )
  tokens = []
  str = "" if str.nil?
  scanner = StringScanner.new(str)

  until scanner.empty?
    case
    when scanner.scan(/\s+/)
      # ignore space
    when m = scanner.scan(/connections/i)
      tokens.push [:CONNECTIONS, m]
    when m = scanner.scan(/by/i)
      tokens.push [:BY, m]
    when m = scanner.scan(/default/i)
      tokens.push [:DEFAULT, m]
    when m = scanner.scan(/state/i)
      tokens.push [:STATE, m]
    when m = scanner.scan(/ssh/i)
      tokens.push   [:TYPE, m]
    when m = scanner.scan(/from/i)
      tokens.push   [:FROM, m]
    when m = scanner.scan(/drop|accept/i)
      tokens.push   [:ACTION, m]
    when m = scanner.scan(/incoming|outgoing|forwarded/i)
      tokens.push   [:DIRECTION, m]
    when m = scanner.scan(/established|related|new/i)
      tokens.push   [:A_STATE, m]
    when m = scanner.scan(/tcp|udmp|icmp/i)
      tokens.push   [:PROTOCOL, m]
    when m = scanner.scan(/in/i)
      tokens.push [:IN, m]
    when m = scanner.scan(/\d{1,3}\.\d{1,3}\.\d{1,3}.\d{1,3}((\/\d{1,3}\.\d{1,3}\.\d{1,3}.\d{1,3})|(\/\d{1,2}))?/)
      tokens.push [:IP_ADDRESS, m]
    when m = scanner.scan(/\[([\w\:\.\/\-\s]+\,\s*)*[\w\:\.\/\-\s]+\]/)
      tokens.push   [:PARAMS, m]
    when m = scanner.scan(/\d+(?:\.\d{0,2})?\.\.\d+(?:\.\d{0,2})?/)
      tokens.push   [:RANGE, m]
    when m = scanner.scan(/\w+/)
      tokens.push   [:VARIABLE, m]
    when m = scanner.scan(/.|\n/)
      tokens.push   [m, m]
    end
  end
  tokens.push [false, false]
  @directions = []
  yyparse(tokens, :each)
end

def on_error(error_token_id, error_value, value_stack)
  msg = "parse error "
  msg << "after #{value_stack.last} " if value_stack.length > 1
  msg << "on #{token_to_str(error_token_id)}  Stack: #{value_stack.inspect}"
  raise ParseError, msg
end
..end ipt.grammar modeval..id50882cb9d6

##### racc 1.4.5 generates ###

racc_reduce_table = [
 0, 0, :racc_error,
 4, 17, :_reduce_1,
 6, 17, :_reduce_2,
 3, 17, :_reduce_3,
 3, 17, :_reduce_4,
 1, 17, :_reduce_none,
 0, 17, :_reduce_6,
 5, 18, :_reduce_7,
 4, 18, :_reduce_8,
 3, 18, :_reduce_9,
 4, 18, :_reduce_10,
 1, 21, :_reduce_11,
 3, 21, :_reduce_12,
 1, 22, :_reduce_none,
 0, 22, :_reduce_14,
 1, 19, :_reduce_15,
 1, 20, :_reduce_none,
 1, 20, :_reduce_17 ]

racc_reduce_n = 18

racc_shift_n = 33

racc_action_table = [
    14,    14,    21,     1,    24,     3,    19,    20,    19,     7,
    13,    13,     8,    11,    26,    12,     6,     8,    16,     5,
    25,     7,    27,    28,    29,    30,     8,    32 ]

racc_action_check = [
    12,     5,    10,     0,    17,     0,    10,    10,    17,     3,
    12,     5,     3,     4,    19,     4,     2,    11,     6,     1,
    18,     9,    21,    22,    23,    27,    29,    31 ]

racc_action_pointer = [
    -2,    13,    16,    -2,    11,    -4,    18,   nil,   nil,    10,
    -6,     3,    -5,   nil,   nil,   nil,   nil,    -4,    12,     3,
   nil,    13,    20,    22,   nil,   nil,   nil,    15,   nil,    12,
   nil,    24,   nil ]

racc_action_default = [
    -6,   -18,   -18,   -18,    -5,   -18,   -18,   -11,   -15,   -18,
   -18,   -18,   -18,   -16,   -17,    -4,    33,   -18,   -18,   -18,
   -13,    -9,   -18,    -3,   -10,    -8,   -12,   -18,    -1,   -18,
    -7,   -18,    -2 ]

racc_goto_table = [
     9,    10,    15,     2,     4,    18,   nil,    17,    22,    23,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,    31 ]

racc_goto_check = [
     3,     5,     4,     1,     2,     6,   nil,     5,     3,     4,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,     3 ]

racc_goto_pointer = [
   nil,     3,     4,    -3,    -3,    -2,    -5 ]

racc_goto_default = [
   nil,   nil,   nil,   nil,   nil,   nil,   nil ]

racc_token_table = {
 false => 0,
 Object.new => 1,
 :IN => 2,
 :STATE => 3,
 :FROM => 4,
 :VARIABLE => 5,
 "=" => 6,
 :ACTION => 7,
 :CONNECTIONS => 8,
 :BY => 9,
 :DEFAULT => 10,
 :DIRECTION => 11,
 "," => 12,
 :PROTOCOL => 13,
 :A_STATE => 14,
 :IP_ADDRESS => 15 }

racc_use_result_var = true

racc_nt_base = 16

Racc_arg = [
 racc_action_table,
 racc_action_check,
 racc_action_default,
 racc_action_pointer,
 racc_goto_table,
 racc_goto_check,
 racc_goto_default,
 racc_goto_pointer,
 racc_nt_base,
 racc_reduce_table,
 racc_token_table,
 racc_shift_n,
 racc_reduce_n,
 racc_use_result_var ]

Racc_token_to_s_table = [
'$end',
'error',
'IN',
'STATE',
'FROM',
'VARIABLE',
'"="',
'ACTION',
'CONNECTIONS',
'BY',
'DEFAULT',
'DIRECTION',
'","',
'PROTOCOL',
'A_STATE',
'IP_ADDRESS',
'$start',
'target',
'action',
'states',
'addresses',
'directions',
'protocols']

Racc_debug_parser = false

##### racc system variables end #####

 # reduce 0 omitted

module_eval <<'.,.,', 'ipt.grammar', 4
  def _reduce_1( val, _values, result )
 result = _state(val[0], val[2])
   result
  end
.,.,

module_eval <<'.,.,', 'ipt.grammar', 5
  def _reduce_2( val, _values, result )
 result = _state("#{val[0]} -s #{val[2]}", val[4])
   result
  end
.,.,

module_eval <<'.,.,', 'ipt.grammar', 6
  def _reduce_3( val, _values, result )
 result = "#{val[0]} -s #{val[2]}"
   result
  end
.,.,

module_eval <<'.,.,', 'ipt.grammar', 7
  def _reduce_4( val, _values, result )
 result = _assign(val[0], val[2])
   result
  end
.,.,

 # reduce 5 omitted

module_eval <<'.,.,', 'ipt.grammar', 9
  def _reduce_6( val, _values, result )
 result = "hello there! say something!"
   result
  end
.,.,

module_eval <<'.,.,', 'ipt.grammar', 13
  def _reduce_7( val, _values, result )
   result = _default_policy(val[0], val[1])
   result
  end
.,.,

module_eval <<'.,.,', 'ipt.grammar', 14
  def _reduce_8( val, _values, result )
   result = _protocol(_append(val[0], val[1]), val[2])
   result
  end
.,.,

module_eval <<'.,.,', 'ipt.grammar', 15
  def _reduce_9( val, _values, result )
   result = _append(val[0], val[1])
   result
  end
.,.,

module_eval <<'.,.,', 'ipt.grammar', 16
  def _reduce_10( val, _values, result )
   result = _state(_append(val[0], val[2]), val[1])
   result
  end
.,.,

module_eval <<'.,.,', 'ipt.grammar', 20
  def _reduce_11( val, _values, result )
 result = _addDirection(val[0])
   result
  end
.,.,

module_eval <<'.,.,', 'ipt.grammar', 21
  def _reduce_12( val, _values, result )
 result = _addDirection(val[2])
   result
  end
.,.,

 # reduce 13 omitted

module_eval <<'.,.,', 'ipt.grammar', 26
  def _reduce_14( val, _values, result )
 result = " all "
   result
  end
.,.,

module_eval <<'.,.,', 'ipt.grammar', 30
  def _reduce_15( val, _values, result )
 result = val[0].upcase
   result
  end
.,.,

 # reduce 16 omitted

module_eval <<'.,.,', 'ipt.grammar', 35
  def _reduce_17( val, _values, result )
result = _dereference(val[0])
   result
  end
.,.,

 def _reduce_none( val, _values, result )
  result
 end

end   # class IPTablesParser
