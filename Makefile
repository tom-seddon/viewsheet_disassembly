# -*- mode:makefile-gmake; -*-

MAKEFLAGS+=--no-print-directory

ifeq ($(OS),Windows_NT)
PYTHON:=py -3
TASSCMD:=bin\64tass.exe
else
PYTHON:=/usr/bin/python3
TASSCMD:=64tass
endif

##########################################################################
##########################################################################

ifeq ($(VERBOSE),1)
_V:=
_TASSQ:=
else
_V:=@
_TASSQ:=-q
endif

##########################################################################
##########################################################################

SHELLCMD:=$(PYTHON) submodules/shellcmd.py/shellcmd.py
MKDIR:=$(SHELLCMD) mkdir
TASS:=$(TASSCMD) --nostart -Wall $(_TASSQ) --case-sensitive --line-numbers --verbose-list
BUILD:=build

##########################################################################
##########################################################################

.PHONY:all
all:
	$(_V)$(SHELLCMD) mkdir "$(BUILD)"
	$(_V)$(MAKE) _assemble FILE=verB1.0_var1 "DEST=ViewSheet vB1.0 [variant 1]"
	$(_V)$(MAKE) _assemble FILE=verB1.0_var2 "DEST=ViewSheet vB1.0 [variant 2]"
	$(_V)$(MAKE) _assemble FILE=verB1.0_var3 "DEST=ViewSheet vB1.0 [variant 3]"
	$(_V)$(MAKE) _assemble FILE=verB1.01 "DEST=Master MOS v3.50 - ViewSheet vB1.01" CMOS=1
	$(_V)$(PYTHON) "bin/romdiffs.py" -a "orig" -b "$(BUILD)" "ViewSheet vB1.0 [variant 1].rom" "ViewSheet vB1.0 [variant 2].rom" "ViewSheet vB1.0 [variant 3].rom" "Master MOS v3.50 - ViewSheet vB1.01.rom"

.PHONY:_assemble
_assemble:
	$(_V)$(TASS) $(if $(CMOS),--m65c02,--m6502) -L "$(BUILD)/$(DEST).lst" -o "$(BUILD)/$(DEST).rom" "src/$(FILE).s65"

##########################################################################
##########################################################################

.PHONY:_tom
_tom:
	$(_V)$(MAKE)
