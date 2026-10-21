# ***************************************************
# * Copyright © 2026 Sergey Chusov.
# * Version 1.0.0.
# * Licensed under CC BY-NC-ND 4.0
# * (Attribution-NonCommercial-NoDerivatives).
# * https://creativecommons.org/licenses/by-nc-nd/4.0
# * SPDX-License-Identifier: CC-BY-NC-ND-4.0
# ***************************************************

##-----------------------------------------------------------------------
##
## This is common examples/tasks Makefile.
##
## You can run concrete example/task from directory of this Makefile via:
##   | make EXAMPLE=<example-directory>
##
## Available arguments:
##
##   * EXAMPLE  - example directory                
##                default is ''
##
##   * SIM_OPTS - simulation options               
##                default is '-gui'
##
##   * COMP_OPTS - compilation options
##                default is ''
##
##   * RTL_FILE - file with list of all RTL sources
##                default is '$(EXAMPLE)/dv/build/rtl.f'
##
##   * TB_FILE  - file with list of all DV sources 
##                default is '$(EXAMPLE)/dv/build/tb.f'
##
##   * CONFIG   - additional configuration files
##                default is ''
##
##   * INCLUDE  - include files (in package for example);
##                these files are tracked but not compiled
##                default is ''
##
##   * TOP      - top module for simulation        
##                default is 'testbench'
##
##   * OUT      - simulation logs directory        
##                default is '$(EXAMPLE)/out'
##
##   * WAVES    - waveform save enable             
##                default is '1'
##
## Examples:
##
##   * Run example 02_sum with batch
##     | make EXAMPLE=02_sum SIM_OPTS=-c
##
##   * Run example 03_sum with batch with randomization seed 12345
##     | make EXAMPLE=03_sum SIM_OPTS="-c -sv_seed 12345"
##
##   * Run example 10_initial with GUI with no waveform saving
##     | make EXAMPLE=10_initial WAVES=0
##
##   * Run example 06_alu with batch and passing define VERSION_4
##     to the compilation
##     | make EXAMPLE=06_alu SIM_OPTS=-c COMP_OPTS=+define+VERSION_4
##     
##-----------------------------------------------------------------------


#------------------------------------------------------------------------
# Settings
#------------------------------------------------------------------------

# Example select
EXAMPLE ?= 

# RTL file
RTL_FILE ?= $(EXAMPLE)/dv/build/rtl.f

# DV file
TB_FILE ?= $(EXAMPLE)/dv/build/tb.f

# Configuration files
CONFIG ?=

# Include files
INCLUDE ?=

# Top simulation module select
TOP ?= testbench
export TOP

# Output directory
OUT ?= $(EXAMPLE)/out
export OUT

# Compilation and optimization directory
COMP ?= $(OUT)/compile

# Simulation directory
SIM ?= $(OUT)/sim

# Waveforms save enable
WAVES ?= 1
export WAVES

# Compilation options
COMP_OPTS ?= 

# Simulation options
SIM_OPTS ?= -gui


#------------------------------------------------------------------------
# Local variables
#------------------------------------------------------------------------

# All RTL sources
rtl_src = $(shell cat $(RTL_FILE)) $(CONFIG)

# All DV sources
dv_src = $(shell cat $(TB_FILE))

# Root directory
root_dir = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# Compilation options file
comp_file = $(COMP)/COMP_OPTS.$(subst $() ,,$(subst /,,$(COMP_OPTS)))

# Configuration file
ifneq ($(CONFIG),)
	config_file = $(COMP)/CONFIG.$(subst $() ,,$(subst /,,$(CONFIG)))
endif

# Verbosity
v = @


#------------------------------------------------------------------------
# Targets
#------------------------------------------------------------------------

.PHONY: run clean help

# Run target
run: $(COMP)/compile.stamp | $(SIM)
	@echo "Running $(notdir $(EXAMPLE)) (log file at $(notdir $(SIM))/sim.log) ..."
	$(v)vsim work.$(TOP) -do questa.tcl $(SIM_OPTS) \
		-voptargs="+acc" -l $(SIM)/sim.log -wlf $(SIM)/sim.wlf > $(SIM)/sim.log

# Clean target
clean:
	@echo "Removing $(OUT) ..."
	$(v)rm -rf $(OUT)

# Compile target
$(COMP)/compile.stamp: $(rtl_src) $(dv_src) $(INCLUDE) \
	$(config_file) $(comp_file) | $(COMP)
	@echo "Compiling $(notdir $(EXAMPLE)) (log file at $(notdir $(COMP))/compile.log) ..."
	$(v)vlib $(COMP)/work > $(COMP)/compile.log
	$(v)vmap work $(COMP)/work >> $(COMP)/compile.log
	$(v)vlog -sv $(COMP_OPTS) -work work $(rtl_src) $(dv_src) >> $(COMP)/compile.log
	@touch $@

# Configuration file target
# Because we depend on this variable for compilation
$(config_file): | $(COMP)
	$(v)if ! [ -e "$@" ] ; then \
		rm -f $(COMP)/CONFIG.*; \
		touch "$@"; \
	fi

# Compilation options target
# Because we depend on this variable for compilation
$(comp_file): | $(COMP)
	$(v)if ! [ -e "$@" ] ; then \
		rm -f $(COMP)/COMP_OPTS.*; \
		touch "$@"; \
	fi

# Simulation directory target
$(SIM): | $(OUT)
	@mkdir -p $@

# Compilation directory target
$(COMP): | $(OUT)
	@mkdir -p $@

# Output directory target
$(OUT):
	@mkdir -p $@

include $(root_dir)/make_help.mk
