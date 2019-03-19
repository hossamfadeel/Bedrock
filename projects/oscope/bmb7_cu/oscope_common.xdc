# J17: Pmod
set_property IOSTANDARD LVCMOS25 [get_ports {bus_digitizer_J17[0]}]
set_property PACKAGE_PIN E22 [get_ports {bus_digitizer_J17[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {bus_digitizer_J17[1]}]
set_property PACKAGE_PIN D25 [get_ports {bus_digitizer_J17[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {bus_digitizer_J17[2]}]
set_property PACKAGE_PIN C26 [get_ports {bus_digitizer_J17[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {bus_digitizer_J17[3]}]
set_property PACKAGE_PIN D26 [get_ports {bus_digitizer_J17[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {bus_digitizer_J17[4]}]
set_property PACKAGE_PIN E21 [get_ports {bus_digitizer_J17[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {bus_digitizer_J17[5]}]
set_property PACKAGE_PIN E25 [get_ports {bus_digitizer_J17[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {bus_digitizer_J17[6]}]
set_property PACKAGE_PIN B24 [get_ports {bus_digitizer_J17[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {bus_digitizer_J17[7]}]
set_property PACKAGE_PIN A25 [get_ports {bus_digitizer_J17[7]}]

# J18: Pmod
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_J18[0]}]
set_property PACKAGE_PIN Y18 [get_ports {bus_digitizer_J18[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_J18[1]}]
set_property PACKAGE_PIN AD18 [get_ports {bus_digitizer_J18[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_J18[2]}]
set_property PACKAGE_PIN AC18 [get_ports {bus_digitizer_J18[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_J18[3]}]
set_property PACKAGE_PIN Y17 [get_ports {bus_digitizer_J18[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_J18[4]}]
set_property PACKAGE_PIN AE20 [get_ports {bus_digitizer_J18[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_J18[5]}]
set_property PACKAGE_PIN AD15 [get_ports {bus_digitizer_J18[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_J18[6]}]
set_property PACKAGE_PIN AE15 [get_ports {bus_digitizer_J18[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_J18[7]}]
set_property PACKAGE_PIN AD20 [get_ports {bus_digitizer_J18[7]}]

# U15: AMC7823 SPI ADC (Housekeeping)
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_U15[1]}]
set_property PACKAGE_PIN AB19 [get_ports {bus_digitizer_U15[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_U15[2]}]
set_property PACKAGE_PIN AB20 [get_ports {bus_digitizer_U15[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_U18[0]}]

# U18: AD7794 SPI ADC (Thermistors)
set_property PACKAGE_PIN AF19 [get_ports {bus_digitizer_U18[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_U18[1]}]
set_property PACKAGE_PIN AF17 [get_ports {bus_digitizer_U18[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_U18[2]}]
set_property PACKAGE_PIN AE17 [get_ports {bus_digitizer_U18[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_U18[3]}]
set_property PACKAGE_PIN V19 [get_ports {bus_digitizer_U18[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_U18[4]}]
set_property PACKAGE_PIN Y5 [get_ports {bus_digitizer_U18[4]}]

# U1: LMK01801 Clock divider
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U1[0]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U1[4]}]
set_property PACKAGE_PIN P19 [get_ports {bus_digitizer_U1[4]}]
set_property PACKAGE_PIN P20 [get_ports {bus_digitizer_U1[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_U1[5]}]
set_property PACKAGE_PIN AC14 [get_ports {bus_digitizer_U1[5]}]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets digitizer_U1/clk_ibufgds]

# U2: AD9653 ADC
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U2[4]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U2[5]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U2[6]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U2[8]}]
set_property PACKAGE_PIN P23 [get_ports {bus_digitizer_U2[4]}]
set_property PACKAGE_PIN N23 [get_ports {bus_digitizer_U2[8]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U2[9]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U2[10]}]
set_property PACKAGE_PIN U19 [get_ports {bus_digitizer_U2[10]}]
set_property PACKAGE_PIN U20 [get_ports {bus_digitizer_U2[6]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U2[11]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U2[12]}]
set_property PACKAGE_PIN N21 [get_ports {bus_digitizer_U2[11]}]
set_property PACKAGE_PIN N22 [get_ports {bus_digitizer_U2[12]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U2[13]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U2[14]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U2[15]}]
set_property PACKAGE_PIN R21 [get_ports {bus_digitizer_U2[9]}]
set_property PACKAGE_PIN P21 [get_ports {bus_digitizer_U2[15]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U2[16]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U2[17]}]
set_property PACKAGE_PIN T22 [get_ports {bus_digitizer_U2[14]}]
set_property PACKAGE_PIN T23 [get_ports {bus_digitizer_U2[17]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U2[18]}]
set_property PACKAGE_PIN T20 [get_ports {bus_digitizer_U2[13]}]
set_property PACKAGE_PIN R20 [get_ports {bus_digitizer_U2[18]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U2[19]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U2[20]}]
set_property PACKAGE_PIN P24 [get_ports {bus_digitizer_U2[16]}]
set_property PACKAGE_PIN N24 [get_ports {bus_digitizer_U2[20]}]
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_U2[22]}]
set_property PACKAGE_PIN V14 [get_ports {bus_digitizer_U2[22]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U2[23]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U2[24]}]
set_property PACKAGE_PIN R25 [get_ports {bus_digitizer_U2[23]}]
set_property PACKAGE_PIN P25 [get_ports {bus_digitizer_U2[24]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U2[25]}]
set_property PACKAGE_PIN R26 [get_ports {bus_digitizer_U2[25]}]
set_property PACKAGE_PIN P26 [get_ports {bus_digitizer_U2[19]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U2[26]}]
set_property PACKAGE_PIN N26 [get_ports {bus_digitizer_U2[26]}]
set_property PACKAGE_PIN M26 [get_ports {bus_digitizer_U2[5]}]

# U3: AD9653 ADC
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U3[3]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U3[4]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U3[5]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U3[6]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U3[7]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U3[8]}]
set_property PACKAGE_PIN J26 [get_ports {bus_digitizer_U3[5]}]
set_property PACKAGE_PIN H26 [get_ports {bus_digitizer_U3[8]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U3[9]}]
set_property PACKAGE_PIN U17 [get_ports {bus_digitizer_U3[7]}]
set_property PACKAGE_PIN T17 [get_ports {bus_digitizer_U3[9]}]
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_U3[10]}]
set_property PACKAGE_PIN Y6 [get_ports {bus_digitizer_U3[10]}]
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_U3[11]}]
set_property PACKAGE_PIN W14 [get_ports {bus_digitizer_U3[11]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U3[12]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U3[13]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U3[14]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U3[15]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U3[16]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U3[18]}]
set_property PACKAGE_PIN H23 [get_ports {bus_digitizer_U3[16]}]
set_property PACKAGE_PIN H24 [get_ports {bus_digitizer_U3[18]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U3[19]}]
set_property PACKAGE_PIN M24 [get_ports {bus_digitizer_U3[12]}]
set_property PACKAGE_PIN L24 [get_ports {bus_digitizer_U3[19]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U3[20]}]
set_property PACKAGE_PIN G25 [get_ports {bus_digitizer_U3[15]}]
set_property PACKAGE_PIN G26 [get_ports {bus_digitizer_U3[20]}]
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_U3[21]}]
set_property PACKAGE_PIN V18 [get_ports {bus_digitizer_U3[21]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U3[22]}]
set_property PACKAGE_PIN M25 [get_ports {bus_digitizer_U3[3]}]
set_property PACKAGE_PIN L25 [get_ports {bus_digitizer_U3[22]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U3[23]}]
set_property PACKAGE_PIN H21 [get_ports {bus_digitizer_U3[6]}]
set_property PACKAGE_PIN G21 [get_ports {bus_digitizer_U3[23]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U3[24]}]
set_property PACKAGE_PIN F22 [get_ports {bus_digitizer_U3[4]}]
set_property PACKAGE_PIN E23 [get_ports {bus_digitizer_U3[24]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U3[25]}]
set_property PACKAGE_PIN G22 [get_ports {bus_digitizer_U3[13]}]
set_property PACKAGE_PIN F23 [get_ports {bus_digitizer_U3[25]}]
set_property IOSTANDARD LVDS_25 [get_ports {bus_digitizer_U3[26]}]
set_property PACKAGE_PIN M21 [get_ports {bus_digitizer_U3[26]}]
set_property PACKAGE_PIN M22 [get_ports {bus_digitizer_U3[14]}]

# U4: AD9781 DAC
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_U4[0]}]
set_property PACKAGE_PIN AA19 [get_ports {bus_digitizer_U4[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_U4[1]}]
set_property PACKAGE_PIN Y15 [get_ports {bus_digitizer_U4[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_U4[2]}]
set_property PACKAGE_PIN AF20 [get_ports {bus_digitizer_U4[2]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[3]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[4]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[5]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[6]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_U4[8]}]
set_property PACKAGE_PIN AD14 [get_ports {bus_digitizer_U4[8]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[9]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[10]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[11]}]
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_U4[12]}]
set_property PACKAGE_PIN AF14 [get_ports {bus_digitizer_U4[12]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[13]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[14]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[15]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[16]}]
set_property PACKAGE_PIN AF3 [get_ports {bus_digitizer_U4[16]}]
set_property PACKAGE_PIN AF2 [get_ports {bus_digitizer_U4[5]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[17]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[18]}]
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_U4[19]}]
set_property PACKAGE_PIN AF15 [get_ports {bus_digitizer_U4[19]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[20]}]
set_property PACKAGE_PIN AB2 [get_ports {bus_digitizer_U4[20]}]
set_property PACKAGE_PIN AC2 [get_ports {bus_digitizer_U4[18]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[21]}]
set_property PACKAGE_PIN W1 [get_ports {bus_digitizer_U4[3]}]
set_property PACKAGE_PIN Y1 [get_ports {bus_digitizer_U4[21]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[22]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[23]}]
set_property PACKAGE_PIN AA3 [get_ports {bus_digitizer_U4[23]}]
set_property PACKAGE_PIN AA2 [get_ports {bus_digitizer_U4[6]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[24]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[25]}]
set_property PACKAGE_PIN U2 [get_ports {bus_digitizer_U4[25]}]
set_property PACKAGE_PIN U1 [get_ports {bus_digitizer_U4[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_U4[26]}]
set_property PACKAGE_PIN AA20 [get_ports {bus_digitizer_U4[26]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[27]}]
set_property PACKAGE_PIN V4 [get_ports {bus_digitizer_U4[27]}]
set_property PACKAGE_PIN W4 [get_ports {bus_digitizer_U4[4]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[28]}]
set_property PACKAGE_PIN AB6 [get_ports {bus_digitizer_U4[9]}]
set_property PACKAGE_PIN AC6 [get_ports {bus_digitizer_U4[28]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[29]}]
set_property PACKAGE_PIN AC4 [get_ports {bus_digitizer_U4[29]}]
set_property PACKAGE_PIN AC3 [get_ports {bus_digitizer_U4[10]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[30]}]
set_property PACKAGE_PIN V2 [get_ports {bus_digitizer_U4[30]}]
set_property PACKAGE_PIN V1 [get_ports {bus_digitizer_U4[24]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[31]}]
set_property PACKAGE_PIN AD1 [get_ports {bus_digitizer_U4[31]}]
set_property PACKAGE_PIN AE1 [get_ports {bus_digitizer_U4[17]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[32]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[33]}]
set_property PACKAGE_PIN AE6 [get_ports {bus_digitizer_U4[33]}]
set_property PACKAGE_PIN AE5 [get_ports {bus_digitizer_U4[11]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[34]}]
set_property PACKAGE_PIN W6 [get_ports {bus_digitizer_U4[14]}]
set_property PACKAGE_PIN W5 [get_ports {bus_digitizer_U4[34]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[35]}]
set_property PACKAGE_PIN AB1 [get_ports {bus_digitizer_U4[35]}]
set_property PACKAGE_PIN AC1 [get_ports {bus_digitizer_U4[32]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[36]}]
set_property PACKAGE_PIN Y3 [get_ports {bus_digitizer_U4[36]}]
set_property PACKAGE_PIN Y2 [get_ports {bus_digitizer_U4[15]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[37]}]
set_property PACKAGE_PIN AB16 [get_ports {bus_digitizer_U4[13]}]
set_property PACKAGE_PIN AC16 [get_ports {bus_digitizer_U4[37]}]
set_property IOSTANDARD LVDS [get_ports {bus_digitizer_U4[38]}]
set_property PACKAGE_PIN AF5 [get_ports {bus_digitizer_U4[38]}]
set_property PACKAGE_PIN AF4 [get_ports {bus_digitizer_U4[22]}]

# U27: 74AVC4T245 level shifter
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_U27[0]}]
set_property PACKAGE_PIN Y16 [get_ports {bus_digitizer_U27[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_U33U1[0]}]
set_property PACKAGE_PIN AA14 [get_ports {bus_digitizer_U33U1[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {bus_digitizer_U33U1[1]}]
set_property PACKAGE_PIN AA15 [get_ports {bus_digitizer_U33U1[1]}]

# U5: SI571
set_property IOSTANDARD LVCMOS33 [get_ports {bus_bmb7_U5[*]}]
set_property PACKAGE_PIN F6 [get_ports {bus_bmb7_U5[0]}]
set_property PACKAGE_PIN F5 [get_ports {bus_bmb7_U5[1]}]

# U19: CDCE62005
set_property PACKAGE_PIN K6 [get_ports {bus_bmb7_U19[1]}]
set_property PACKAGE_PIN K5 [get_ports {bus_bmb7_U19[0]}]

########
# Clocks
create_clock -period 10.000 -name U1_clkout3     -waveform {0.000 5.000}  [get_ports {bus_digitizer_U1[4]}]
create_clock -period 2.500  -name U2_DCO         -waveform {1.000 2.250}  [get_ports {bus_digitizer_U2[15]}]
create_clock -period 2.500  -name U3_DCO         -waveform {1.000 2.250}  [get_ports {bus_digitizer_U3[24]}]
create_clock -period 5.000  -name U4_DCO         -waveform {1.000 3.500}  [get_ports {bus_digitizer_U4[13]}]
create_generated_clock -name U4_DCI    -source [get_pins {digitizer_U4/oddr_dci/C}] -divide_by 1 -invert [get_ports {bus_digitizer_U4[29]}]

create_clock -period 8.000  -name GTXREFCLK3     -waveform {0.000 4.000}  [get_ports {bus_bmb7_U19[1]}]
create_clock -period 16.000 -name TXOUTCLK       -waveform {0.000 8.000}  [get_nets {U50_txoutclk[0]}]
create_clock -period 16.000 -name RXOUTCLK       -waveform {0.000 8.000}  [get_nets {U50_rxoutclk[0]}]

set_clock_groups -name prc -asynchronous \
-group [get_clocks -include_generated_clocks S6_TO_K7_CLK_1] \
-group [get_clocks -include_generated_clocks {U1_clkout3}] \
-group [get_clocks -include_generated_clocks {U2_DCO}] \
-group [get_clocks -include_generated_clocks {U3_DCO}] \
-group [get_clocks -include_generated_clocks {U4_DCO U4_DCI}]
