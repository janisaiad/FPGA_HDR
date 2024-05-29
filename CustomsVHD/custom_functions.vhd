library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package custom_functions is
    function sqrt_simple(input: real; N: integer := 8; precision: real := 0.001) return real;  -- Added precision parameter
    function abs_simple(input: real) return real;
end package custom_functions;

package body custom_functions is
    -- FILEPATH: /C:/Users/thoma/Documents/MODAL/custom_functions.vhd

    -- This package contains custom functions for mathematical calculations.

    -- This function calculates the square root of a real number using the Newton's method.
    -- The precision of the result can be adjusted by changing the value of the constant K.
    -- The function returns the approximate square root of the input number.
    function sqrt_simple(input: real; N: integer := 8; precision: real := 0.001) return real is  -- Added precision parameter
        constant K : integer := N;  -- Nombre d'itérations (Number of iterations)
        variable approx: real := 1.0;  -- Initial approximation
        variable better_approx: real;  -- Improved approximation
    begin
        for i in 0 to K-1 loop
            -- Iterate K times to improve the approximation of the square root
            better_approx := (approx + input / approx) / 2.0;  -- Calculate a better approximation using Newton's method
            if abs(approx - better_approx) < precision then  -- Use the precision parameter here
                exit;
            end if;
            approx := better_approx;
        end loop;
        return approx;
    end function sqrt_simple;

    function abs_simple(input: real) return real is
    begin
        if input < 0.0 then
            return -input;
        else
            return input;
        end if;
    end function abs_simple;
end package body custom_functions;