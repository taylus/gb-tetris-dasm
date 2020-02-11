# Builds Tetris.asm -> Tetris.gb and then compares it to the original ROM (not included).
# If the ROMs differ, fc will exit w/ error code 1, failing the makefile.

diff: Tetris.gb
	fc /b bin\Tetris.gb "bin\Tetris (World) (Rev A).gb"

Tetris.gb: Tetris.o
	rgblink -o bin\Tetris.gb -n bin\Tetris.sym  bin\Tetris.o

Tetris.o: Tetris.asm
	rgbasm -h -L -o bin\Tetris.o Tetris.asm
