Rebuildable (but not very well-commented or labeled) disassembly of
Acornsoft's ViewSheet.

This is related to my [Acorn MOS
disassembly](https://github.com/tom-seddon/acorn_mos_disassembly)
project, as some versions of the MOS came with ViewSheet included.

# versions covered

The supplied code can build the following versions, which can be found
in [The BBC Micro ROM
Library](https://tobylobster.github.io/rom_library/), or in this repo
in the `orig` folder:

- [B1.0 [variant
  1]](https://tobylobster.github.io/rom_library/?md5=7d5a80a8ce929d0a0f6ca8626cb9f436) -
  supplied with Master 128 MOS 3.20
- [B1.0 [variant
  2]](https://tobylobster.github.io/rom_library/?md5=26044139006e9ec0960e609354daba41) -
  similar to variant 1, but with the sideways RAM protection check
  disabled, and an extra mystery byte that shuffle some of the code
  around. Presumably built from the original source code
- [B1.0 [variant
  3]](https://tobylobster.github.io/rom_library/?md5=35ae47c386d347604d41baf2faa042d4) -
  same as variant 1, but with the sideways RAM protection check
  removed with `NOP`s. Presumably a binary patch
- [B1.01](https://tobylobster.github.io/rom_library/?md5=1bc68b7c5eba6a2de2a43c9d1d9d983b) -
  supplied with Master 128 MOS 3.50

This is far from all of the versions available! Coverage may yet
increase. (But the Master-related versions were the priority.)

# build

This repo has submodules. Clone it with `--recursive`:

    git clone --recursive https://github.com/tom-seddon/mos320
	
Alternatively, if you already cloned it non-recursively, you can do
the following from inside the working copy:

    git submodule init
	git submodule update

## prerequisites

* Python 3.x

On Unix:

* [`64tass`](http://tass64.sourceforge.net/) (I use r3243)
* GNU Make

## build steps

Type `make` from the root of the working copy. The build process is
supposed to be silent when there are no errors and when the output
matches the original ROMs.

The build output is assembler listing files (extension `.lst`) that
you can use for reference. Find them in the `build` folder.
