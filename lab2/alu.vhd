use work.dlx_types.all;
use work.bv_arithmetic.all; 

--interface

entity alu is
	generic(prop_delay: Time := 15 ns);
	port(operand1, operand2: in dlx_word; operation: in
		alu_operation_code;
		result: out dlx_word; error: out error_code);
end entity alu;

--architecture

architecture behavior1 of alu is
begin
    aluprocess : process(operand1, operand2, operation) is
	variable res : dlx_word;
	variable ov  : boolean := false;
	variable dz  : boolean := false;
	variable op1 : boolean := false;
	variable op2 : boolean := false;
    begin
	error <= "0000" after prop_delay;
	case(operation) is
	    --unsigned add
	    when "0000" =>
		bv_addu(operand1, operand2, res, ov);
		if ov then
		    error <= "0001" after prop_delay;
		else
		    error <= "0000" after prop_delay;
		end if;
		result <= res after prop_delay;

	    --unsigned subtract
	    when "0001" =>
		bv_subu(operand1, operand2, res, ov);
		if ov then
		    error <= "0010" after prop_delay;
		end if;
		result <= res after prop_delay;

	    --two's complement add
	    when "0010" =>
		bv_add(operand1, operand2, res, ov);
		if ov then
		    --overflow
		    if (operand1(31) = '0') AND (operand2(31) = '0') then
			if (res(31) = '1') then
			    error <= "0001" after prop_delay;
			end if;
		    --underflow
		    elsif (operand1(31) = '1') AND (operand2(31) = '1') then
			if (res(31) = '0') then
			    error <= "0010" after prop_delay;
			end if;
		    end if;
		end if;
		result <= res after prop_delay;
		
	    --two's complement subtract
	    when "0011" =>
		bv_sub(operand1, operand2, res, ov);
		if ov then
		    --overflow
		    if (operand1(31) = '0') AND (operand2(31) = '1') then
			if (res(31) = '1') then
			    error <= "0001" after prop_delay;
			end if;
		    --underflow
		    elsif (operand1(31) = '1') AND (operand2(31) = '0') then
			if (res(31) = '0') then
			    error <= "0010" after prop_delay;
			end if;
		    end if;
		end if;
		result <= res after prop_delay;

	    --two's complement multiply
	    when "0100" =>
		bv_mult(operand1, operand2, res, ov);
		if ov then
		    --underflow
		    if (res(31) = '0') then
			if ((operand1(31) = '1') AND (operand2(31) = '0')) OR
				((operand1(31) = '0') AND (operand2(31) = '1')) then
			    error <= "0010" after prop_delay;
			end if;
		    --overflow
		    elsif (res(31) = '1') then
			if ((operand1(31) = '1') AND (operand2(31) = '1')) OR
				((operand1(31) = '0') AND (operand2(31) = '0')) then
			    error <= "0001" after prop_delay;
			end if;
		    end if;
		end if;
		result <= res after prop_delay;

	    --two's complement divide
	    when "0101" =>
		bv_div(operand1, operand2, res, dz, ov);
		--divide by zero
		if dz then
		    error <= "0011" after prop_delay;
		--underflow
		elsif ov then
		    error <= "0010" after prop_delay;
		end if;
		result <= res after prop_delay;

	    --logical AND
	    when "0110" =>
		op1 := false;
		op2 := false;
		for i in 31 downto 0 loop
		    if (operand1(i) = '1') then
			op1 := true;
			exit;
		    end if;
		end loop;
		for j in 31 downto 0 loop
		    if (operand2(j) = '1') then
			op2 := true;
			exit;
		    end if;
		end loop;
		if op1 AND op2 then
		    result <= x"00000001" after prop_delay;
		else
		    result <= x"00000000" after prop_delay;
		end if;

	    --bitwise AND
	    when "0111" =>
		for i in 31 downto 0 loop
		    res(i) := operand1(i) AND operand2(i);
		end loop;
		result <= res after prop_delay;

	    --logical OR
	    when "1000" =>
		op1 := false;
		op2 := false;
		for i in 31 downto 0 loop
		    if (operand1(i) = '1') then
			op1 := true;
			exit;
		    end if;
		end loop;
		for j in 31 downto 0 loop
		    if (operand2(j) = '1') then
			op2 := true;
			exit;
		    end if;
		end loop;
		if op1 OR op2 then
		    result <= x"00000001" after prop_delay;
		else
		    result <= x"00000000" after prop_delay;
		end if;

	    --bitwise OR
	    when "1001" =>
		for i in 31 downto 0 loop
		    res(i) := operand1(i) OR operand2(i);
		end loop;
		result <= res after prop_delay;

	    --logical NOT of operand1 (ignore operand2)
	    when "1010" =>
		result <= x"00000001" after prop_delay;
		for i in 31 downto 0 loop
		    if (operand1(i) = '1') then
			result <= x"00000000" after prop_delay;
			exit;
		    end if;
		end loop;

	    --bitwise NOT of operand1 (ignore operand2)
	    when "1011" =>
		for i in 31 downto 0 loop
		    res(i):= NOT operand1(i);
		end loop;
		result <= res after prop_delay;

	    --output all zeros (1100-1111)
	    when others =>
		result <= x"00000000" after prop_delay;

	end case;
    end process aluprocess;
end architecture behavior1;
