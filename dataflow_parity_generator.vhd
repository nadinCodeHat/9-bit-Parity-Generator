LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY parity_generator IS
  PORT(D0,D1,D2,D3,D4,D5,D6,D7,D8 : IN  STD_LOGIC;
        ODD : OUT STD_LOGIC);
END parity_generator;

ARCHITECTURE dataflow OF parity_generator IS
    SIGNAL  E0,E1,E2,E3,F0,F1,H0,EVEN : STD_LOGIC;
BEGIN
    -- parity calculation
    E0 <= D0 XOR D1;
    E1 <= D2 XOR D3;
    E2 <= D4 XOR D5;
    E3 <= D6 XOR D7;
    F0 <= E0 XOR E1;
    F1 <= E2 XOR E3;
    H0 <= F0 XOR F1;
    -- EVEN parity output
    EVEN <= H0 XOR D8;
    -- ODD partiy output
    ODD <= NOT EVEN;
END dataflow;