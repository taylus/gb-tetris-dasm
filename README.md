# Disassembly of Tetris for Game Boy
This is a disassembly of Tetris produced by [gbdasm](https://github.com/taylus/gbdasm), reviewed and annotated by hand.

It builds the following ROM:
\
`Tetris (World) (Rev A).gb`
\
`MD5: 982ED5D2B12A0377EB14BCDC4123744E`

## Reassembly
Using the [RGBDS toolchain](https://github.com/rednex/rgbds):

```bat
rgbasm -h -L -o bin\Tetris.o Tetris.asm
rgblink -o bin\Tetris.gb bin\Tetris.o
```

## Confirming the reassembly still matches the original (Windows)

```bat
fc /b "bin\Tetris.gb" "bin\Tetris (World) (Rev A).gb"
```

`fc` will exit with `%errorlevel%`:
* 0 = the files are identical
* 1 = the files are different
* 2 = the file(s) can't be found

The above is put together into the included [`makefile`](makefile).

([Make for Windows](http://gnuwin32.sourceforge.net/packages/make.htm))