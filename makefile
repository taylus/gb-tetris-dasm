# Builds Tetris.asm -> Tetris.gb and then compares it to the original ROM's signature.
# If the signatures don't match, the makefile will exit with an error.

rgbds = rgbds-0.3.9-win64\win64

diff: Tetris.gb
	@pwsh -command "If ((Get-FileHash -Algorithm MD5 bin\Tetris.gb).Hash -ne \"982ED5D2B12A0377EB14BCDC4123744E\") \
				    { \
					    Write-Host -ForegroundColor Red \"Hashes do not match! ROM has been unexpectedly altered.\"; \
						Exit 1 \
				    } \
				    Else \
				    { \
				        Write-Host -ForegroundColor Green \"Hashes match! ROM is unaltered.\" \
				    }"

Tetris.gb: Tetris.o
	$(rgbds)\rgblink.exe -o bin\Tetris.gb -n bin\Tetris.sym  bin\Tetris.o

Tetris.o: Tetris.asm
	$(rgbds)\rgbasm.exe -h -L -o bin\Tetris.o Tetris.asm
