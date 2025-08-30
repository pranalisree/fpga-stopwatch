
set_property -dict { PACKAGE_PIN T11 IOSTANDARD LVCMOS33 } [get_ports {digit[0]}]; #LSB
set_property -dict { PACKAGE_PIN T10 IOSTANDARD LVCMOS33 } [get_ports {digit[1]}];
set_property -dict { PACKAGE_PIN T12 IOSTANDARD LVCMOS33 } [get_ports {digit[2]}];
set_property -dict { PACKAGE_PIN U12 IOSTANDARD LVCMOS33 } [get_ports {digit[3]}];#MSB
 
set_property -dict { PACKAGE_PIN V13 IOSTANDARD LVCMOS33 } [get_ports {Seven_Segment[7]}];#A
set_property -dict { PACKAGE_PIN V12 IOSTANDARD LVCMOS33 } [get_ports {Seven_Segment[6]}];#B
set_property -dict { PACKAGE_PIN W13 IOSTANDARD LVCMOS33 } [get_ports {Seven_Segment[5]}];#C
set_property -dict { PACKAGE_PIN T14 IOSTANDARD LVCMOS33 } [get_ports {Seven_Segment[4]}];#D
set_property -dict { PACKAGE_PIN T15 IOSTANDARD LVCMOS33 } [get_ports {Seven_Segment[3]}];#E
set_property -dict { PACKAGE_PIN P14 IOSTANDARD LVCMOS33 } [get_ports {Seven_Segment[2]}];#F
set_property -dict { PACKAGE_PIN R14 IOSTANDARD LVCMOS33 } [get_ports {Seven_Segment[1]}];#G
set_property -dict { PACKAGE_PIN Y16 IOSTANDARD LVCMOS33 } [get_ports {Seven_Segment[0]}];#DP

set_property -dict { PACKAGE_PIN U18 IOSTANDARD LVCMOS33 } [get_ports { clk }];
