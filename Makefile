# -*- mode:makefile-gmake; -*-

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
TASS:=$(TASSCMD) --m6502 --nostart -Wall $(_TASSQ) --case-sensitive --line-numbers --verbose-list
BUILD:=build

##########################################################################
##########################################################################

.PHONY:all
all:
	$(_V)$(SHELLCMD) mkdir "$(BUILD)"
	$(_V)$(MAKE) _assemble FILE=verB1.0_var1 "DEST=ViewSheet vB1.0 [variant 1]"
	$(_V)$(MAKE) _assemble FILE=verB1.0_var2 "DEST=ViewSheet vB1.0 [variant 2]"
	$(_V)$(MAKE) _assemble FILE=verB1.0_var3 "DEST=ViewSheet vB1.0 [variant 3]"
	$(_V)$(PYTHON) "bin/romdiffs.py" -a "orig" -b "$(BUILD)" "ViewSheet vB1.0 [variant 1].rom" "ViewSheet vB1.0 [variant 2].rom" "ViewSheet vB1.0 [variant 3].rom"

.PHONY:_assemble
_assemble:
	$(_V)$(TASS) -L "$(BUILD)/$(DEST).lst" -o "$(BUILD)/$(DEST).rom" "src/$(FILE).s65"

##########################################################################
##########################################################################

.PHONY:_tom
_tom:
	$(_V)$(MAKE)
