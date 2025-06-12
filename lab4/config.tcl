set ::env(DESIGN_NAME) "project4"
set ::env(VERILOG_FILES) "/openlane/designs/project4/src/project4.v"
set ::env(CLOCK_PORT) "CLK"
set ::env(CLOCK_PERIOD) 10

set ::env(PNR_SDC_FILE) "/openlane/designs/project4/src/project4.sdc"
set ::env(SIGNOFF_SDC_FILE) "/openlane/designs/project4/src/project4.sdc"

set ::env(DIE_AREA) "0 0 400 400"
set ::env(PL_TARGET_DENSITY) 0.65
set ::env(FP_SIZING) "absolute"
set ::env(PL_RANDOM_GLB_PLACEMENT) false

set ::env(FP_PDN_AUTO_ADJUST) false
set ::env(FP_PDN_VPITCH) 25
set ::env(FP_PDN_HPITCH) 25
set ::env(FP_PDN_VOFFSET) 5
set ::env(FP_PDN_HOFFSET) 5

set ::env(GRT_REPAIR_ANTENNAS) true
set ::env(DIODE_ON_PORTS) "none"
set ::env(DIODE_CELL) "sky130_fd_sc_hd__diode_2"
set ::env(DIODE_PIN) "DIODE"
set ::env(DIODE_THRESHOLD) "Infinity"
set ::env(DIODE_SIDE_STRATEGY) "source"

set ::env(FP_CORE_UTIL) 0.85
