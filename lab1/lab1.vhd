-- interface

entity full_adder is
	generic(prop_delay: Time :=10 ns);
	port(carry_in,a_in,b_in: in bit;
		result, carry_out: out bit);
end entity full_adder;

--architecture

architecture behaviour1 of full_adder is
begin
	fullProccess : process(carry_in,a_in,b_in) is --sensitivity list

	begin
		if carry_in = '0' then -- first line (0 0 0)
		  if a_in = '0' then
		    if b_in = '0' then
		      result <= '0' after prop_delay;
		      carry_out <= '0' after prop_delay;
		    else
		      -- second line (0 0 1)
		      result <= '1' after prop_delay;
		      carry_out <= '0' after prop_delay;
		    end if;
		  else
		    -- third line (0 1 0)
		    if b_in = '0' then
		      result <= '1' after prop_delay;
		      carry_out <= '0' after prop_delay;
		    else
		    -- fourth line (0 1 1)
		      result <= '0' after prop_delay;
		      carry_out <= '1' after prop_delay;
		    end if;
		  end if;
		else
		  --fifth line (1 0 0)
		  if a_in = '0' then
		    if b_in = '0' then
		      result <= '1' after prop_delay;
		      carry_out <= '0' after prop_delay;
		    else
		      -- sixth line (1 0 1)
		      result <= '0' after prop_delay;
		      carry_out <= '1' after prop_delay;
		    end if;
		  else
		    -- seventh line (1 1 0)
		    if b_in = '0' then
		      result <= '0' after prop_delay;
		      carry_out <= '1' after prop_delay;
		    else
		      -- eighth line (1 1 1)
		      result <= '1' after prop_delay;
		      carry_out <= '1' after prop_delay;
		    end if;
		  end if;
		end if;
	end process fullProccess;
end architecture behaviour1;
