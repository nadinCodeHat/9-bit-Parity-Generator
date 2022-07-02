LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY parity_generator IS
  PORT(inputs : IN  STD_LOGIC_VECTOR(8 DOWNTO 0);
        ODD : OUT STD_LOGIC;
        EVEN: BUFFER STD_LOGIC);
END parity_generator;

ARCHITECTURE structural OF parity_generator IS
    -- XOR gate
    COMPONENT XOR2 IS
        PORT(A,B: in STD_LOGIC; z: out STD_LOGIC);
    END COMPONENT;

    -- NOT gate
    COMPONENT INV2
        PORT(A: in STD_LOGIC z: out STD_LOGIC);
    END COMPONENT;

    SIGNAL E0,E1,E2,E3,F0,F1,H0: STD_LOGIC;
BEGIN
    -- parity calculation
    XE0: XOR2 PORT MAP(D(0),D(1),E0);
    XE1: XOR2 PORT MAP(D(2),D(3),E1);
    XE2: XOR2 PORT MAP(D(4),D(5),E2);
    XE3: XOR2 PORT MAP(D(6),D(7),E3);
    XF0: XOR2 PORT MAP(E0,E1,F0);
    XF1: XOR2 PORT MAP(E2,E3,F1);
    XH0: XOR2 PORT MAP(F0,F1,H0);
    -- EVEN parity output
    XEVEN: XOR2 PORT MAP(H0,D(8),EVEN);
    -- ODD partiy output
    XODD: INV2 PORT MAP(EVEN,ODD);
END structural;