#**************************************************************
# This .sbc file is created by Terasic Tool.
# Users are recommended to modify this file to match users logic.
#**************************************************************

#**************************************************************
# Create Clock
#**************************************************************
create_clock -period 20 [get_ports CLOCK_50]
create_clock -period 20 [get_ports CLOCK2_50]
create_clock -period 20 [get_ports CLOCK3_50]

#RGMII timing control
#receive
create_clock -period 8 -name "ENET1_RX_CLK" [get_ports ENET1_RX_CLK]
#set_input_delay  -clock "ENET1_RX_CLK"  -min 2 [get_ports ENET1_RX_DATA[0]] 
#set_input_delay  -clock "ENET1_RX_CLK"  -min 2 [get_ports ENET1_RX_DATA[1]]
#set_input_delay  -clock "ENET1_RX_CLK"   -min 2 [get_ports ENET1_RX_DATA[2]]
#set_input_delay  -clock "ENET1_RX_CLK"   -min 2 [get_ports ENET1_RX_DATA[3]]
#set_input_delay  -clock "ENET1_RX_CLK"   -min 2 [get_ports ENET1_RX_DV] 
set_input_delay  -clock "ENET1_RX_CLK"  -min 2 [get_ports ENET1_RX_CLK] 
#transmit
#create_clock -period 4 -name "ENET1_GTX_CLK" [get_ports ENET1_GTX_CLK]
#set_output_delay  -clock "ENET1_GTX_CLK"  -clock_fall -rise  -min -0.9 [get_ports ENET1_TX_DATA[0]] 
#set_output_delay  -clock "ENET1_GTX_CLK" -clock_fall -rise  -min -0.9 [get_ports ENET1_TX_DATA[1]] 
#set_output_delay  -clock "ENET1_GTX_CLK" -clock_fall -rise  -min -0.9 [get_ports ENET1_TX_DATA[2]] 
#set_output_delay  -clock "ENET1_GTX_CLK"  -clock_fall -rise  -min -0.9 [get_ports ENET1_TX_DATA[3]] 
#set_output_delay  -clock "ENET1_GTX_CLK"  -clock_fall -rise  -min -0.9 [get_ports ENET1_TX_EN] 
#set_input_delay 1.2 -clock [get_ports ENET0_RX_DATA[*]]


#**************************************************************
# Create Generated Clock
#**************************************************************
derive_pll_clocks



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************
derive_clock_uncertainty



#**************************************************************
# Set Input Delay
#**************************************************************
#set_input_delay -clock "ENET0_RX_CLK" -min 1.2 -max 1.2
#set_input_delay -clock "ENET0_RX_CLK" [-reference_pin ENET0_RX_DV] 2.5

#**************************************************************
# Set Output Delay
#**************************************************************
#set_output_delay -clock "ENET0_GTX_CLK"  -min -0.9 -max 2.7


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************



#**************************************************************
# Set Load
#**************************************************************



