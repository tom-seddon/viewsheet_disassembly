Rebuildable (but not very well-commented or labeled) disassembly of
Acornsoft's ViewSheet.

This is related to my [Acorn MOS
disassembly](https://github.com/tom-seddon/acorn_mos_disassembly)
project, as some versions of the MOS came with ViewSheet included.

# versions covered

The supplied code can build the following versions, covering all the
useful 1.0 (or later) ViewSheet ROMs in [The BBC Micro ROM
Library](https://tobylobster.github.io/rom_library/). For ROM images,
follow the links or see the files in this repo in the `orig` folder.

Master 128 ROM originals:

- [B1.0 [variant
  1]](https://tobylobster.github.io/rom_library/?md5=7d5a80a8ce929d0a0f6ca8626cb9f436) -
  supplied with Master 128 MOS 3.20
- [B1.01](https://tobylobster.github.io/rom_library/?md5=1bc68b7c5eba6a2de2a43c9d1d9d983b) -
  supplied with Master 128 MOS 3.50

Master 128 ROM variants:

- [B1.0 [variant
  2]](https://tobylobster.github.io/rom_library/?md5=26044139006e9ec0960e609354daba41) -
  similar to variant 1, but with the sideways RAM protection
  disabled, and an extra mystery byte that shuffle some of the code
  around. Presumably built from the original source code
- [B1.0 [variant
  3]](https://tobylobster.github.io/rom_library/?md5=35ae47c386d347604d41baf2faa042d4) -
  same as variant 1, but with the sideways RAM protection check
  removed with `NOP`s. Presumably a binary patch

Olivetti PC 128 S version:

- [I1.1](https://tobylobster.github.io/rom_library/?md5=ad630f9328fdef66ee0d3d8d65f1132f) -
  esesntially B1.01 with Italian strings

BBC ROMs marked as good in the ROM library:

- [1.0 [variant
  3]](https://tobylobster.github.io/rom_library/?md5=08fdaaab2e6c9f993a99060a9297f53b) -
  marked as known good in the ROM library

BBC ROM variants:

- [1.0 [variant
  2]](https://tobylobster.github.io/rom_library/?md5=c191dba7350011c7ccfa77d47feb9245) -
  same as variant 3, but with the sideways RAM protection disabled in
  a way that isn't Master-friendly
- [1.0 [variant
  11]](https://tobylobster.github.io/rom_library/?md5=45a023e099d007e5b4c574ba5ccb0d59) -
  same as variant 3, but with the sideways RAM protection disabled,
  and the ROM marked as having no language entry point (

Electron ROMs:

- [E1.0](https://tobylobster.github.io/rom_library/?md5=d96ad778fef8b67ab55c1738fc5ec907)



# build

This repo has submodules. Clone it with `--recursive`:

    git clone --recursive https://github.com/tom-seddon/mos320
	
Alternatively, if you already cloned it non-recursively, you can do
the following from inside the working copy:

    git submodule init
	git submodule update

## prerequisites

Tested on Windows, macOS and Linux.

Required for all:

* Python 3.x

Required for macOS and Linux:

* [`64tass`](http://tass64.sourceforge.net/) (I use r3243)
* GNU Make

(Prebuilt standalone Windows EXEs, and a `make.bat`, are included in
the repo.)

## build steps

Type `make` from the root of the working copy. The build process is
supposed to be silent when there are no errors and when the output
matches the original ROMs.

The build output is assembler listing files (extension `.lst`) that
you can use for reference. Find them in the `build` folder.
