add wave -position insertpoint \
sim:/alu/operand1 \
sim:/alu/operand2 \
sim:/alu/operation \
sim:/alu/result \
sim:/alu/error

#unsigned add
force -freeze sim:/alu/operand1 32'h0000FFFF 0
force -freeze sim:/alu/operand2 32'h00000001 0
force -freeze sim:/alu/operation 4'h0 0
run 100 ns

#unsigned add with error
force -freeze sim:/alu/operand1 32'hFFFFFFFF 0
force -freeze sim:/alu/operand2 32'h00000001 0
force -freeze sim:/alu/operation 4'h0 0
run 100 ns

#unsigned subtract
force -freeze sim:/alu/operand1 32'hF0000000 0
force -freeze sim:/alu/operand2 32'h00000001 0
force -freeze sim:/alu/operation 4'h1 0
run 100 ns

#unsigned subtract with error
force -freeze sim:/alu/operand1 32'h00000001 0
force -freeze sim:/alu/operand2 32'h00000010 0
force -freeze sim:/alu/operation 4'h1 0
run 100 ns

#two's complement add
force -freeze sim:/alu/operand1 32'h0F0F0F0F 0
force -freeze sim:/alu/operand2 32'h01010101 0
force -freeze sim:/alu/operation 4'h2 0
run 100 ns

#two's complement add with error
force -freeze sim:/alu/operand1 32'h7FFFFFFF 0
force -freeze sim:/alu/operand2 32'h00000001 0
force -freeze sim:/alu/operation 4'h2 0
run 100 ns

#two's complement subtract
force -freeze sim:/alu/operand1 32'h10101010 0
force -freeze sim:/alu/operand2 32'h01010101 0
force -freeze sim:/alu/operation 4'h3 0
run 100 ns

#two's complement subtract with error
force -freeze sim:/alu/operand1 32'h80000000 0
force -freeze sim:/alu/operand2 32'h7FFFFFFF 0
force -freeze sim:/alu/operation 4'h3 0
run 100 ns

#two's complement multiply
force -freeze sim:/alu/operand1 32'h00001010 0
force -freeze sim:/alu/operand2 32'h00000101 0
force -freeze sim:/alu/operation 4'h4 0
run 100 ns

#two's complement multiply with error
force -freeze sim:/alu/operand1 32'h00FF00FF 0
force -freeze sim:/alu/operand2 32'h1111FFFF 0
force -freeze sim:/alu/operation 4'h4 0
run 100 ns

#two's complement divide
force -freeze sim:/alu/operand1 32'h0F0F0F0F 0
force -freeze sim:/alu/operand2 32'h01010101 0
force -freeze sim:/alu/operation 4'h5 0
run 100 ns

#two's complement divide with error
force -freeze sim:/alu/operand1 32'h0000AAAA 0
force -freeze sim:/alu/operand2 32'h00000000 0
force -freeze sim:/alu/operation 4'h5 0
run 100 ns

#logical AND with result true
force -freeze sim:/alu/operand1 32'h00000075 0
force -freeze sim:/alu/operand2 32'h00000022 0
force -freeze sim:/alu/operation 4'h6 0
run 100 ns

#logical AND with result false
force -freeze sim:/alu/operand1 32'h00000075 0
force -freeze sim:/alu/operand2 32'h00000000 0
force -freeze sim:/alu/operation 4'h6 0
run 100 ns

#bitwise AND
force -freeze sim:/alu/operand1 32'h00000075 0
force -freeze sim:/alu/operand2 32'h00000022 0
force -freeze sim:/alu/operation 4'h7 0
run 100 ns

#bitwise AND
force -freeze sim:/alu/operand1 32'h00000075 0
force -freeze sim:/alu/operand2 32'h00000000 0
force -freeze sim:/alu/operation 4'h7 0
run 100 ns

#logical OR with result true
force -freeze sim:/alu/operand1 32'h00000075 0
force -freeze sim:/alu/operand2 32'h00000000 0
force -freeze sim:/alu/operation 4'h8 0
run 100 ns

#logical OR with result false
force -freeze sim:/alu/operand1 32'h00000000 0
force -freeze sim:/alu/operand2 32'h00000000 0
force -freeze sim:/alu/operation 4'h8 0
run 100 ns

#bitwise OR
force -freeze sim:/alu/operand1 32'h00000075 0
force -freeze sim:/alu/operand2 32'h00000000 0
force -freeze sim:/alu/operation 4'h9 0
run 100 ns

#bitwise OR
force -freeze sim:/alu/operand1 32'h0000EEEE 0
force -freeze sim:/alu/operand2 32'h00001111 0
force -freeze sim:/alu/operation 4'h9 0
run 100 ns

#logical NOT of operand1
force -freeze sim:/alu/operand1 32'h00000055 0
force -freeze sim:/alu/operand2 32'h00000000 0
force -freeze sim:/alu/operation 4'hA 0
run 100 ns

#bitwise NOT of operand1
force -freeze sim:/alu/operand1 32'h00000055 0
force -freeze sim:/alu/operand2 32'h00000000 0
force -freeze sim:/alu/operation 4'hB 0
run 100 ns

#output all zeros for 1100-1111
force -freeze sim:/alu/operand1 32'h10101010 0
force -freeze sim:/alu/operand2 32'h01010101 0
force -freeze sim:/alu/operation 4'hC 0
run 100 ns

force -freeze sim:/alu/operand1 32'h10101010 0
force -freeze sim:/alu/operand2 32'h01010101 0
force -freeze sim:/alu/operation 4'hD 0
run 100 ns

force -freeze sim:/alu/operand1 32'h10101010 0
force -freeze sim:/alu/operand2 32'h01010101 0
force -freeze sim:/alu/operation 4'hE 0
run 100 ns

force -freeze sim:/alu/operand1 32'h10101010 0
force -freeze sim:/alu/operand2 32'h01010101 0
force -freeze sim:/alu/operation 4'hF 0
run 100 ns


