default: all

all: ..\win\win32\tiles.bmp ..\win\win32\tiles32.bmp

clean:
	-del ..\src\tiles.bmp
	-del ..\src\tiles32.bmp
	-del ..\win\win32\tiles.bmp
	-del ..\win\win32\tiles32.bmp

#======================================================
# Building the tiles file tile.bmp, tile32.bmp
#======================================================

..\src\tiles.bmp : ..\win\share\monsters.txt ..\win\share\objects.txt \
			 ..\win\share\other.txt ..\util\tile2bmp.exe
	   chdir ..\src
	   ..\util\tile2bmp.exe tiles.bmp ..\win\share\monsters.txt ..\win\share\objects.txt \
			 ..\win\share\other.txt
	   chdir ..\build

..\src\tiles32.bmp : ..\win\share\mon32.txt ..\win\share\obj32.txt \
			 ..\win\share\oth32.txt ..\util\tile2bmp.exe
	   chdir ..\src
	   ..\util\tile2bmp.exe tiles32.bmp ..\win\share\mon32.txt ..\win\share\obj32.txt \
			 ..\win\share\oth32.txt
	   chdir ..\build

..\win\win32\tiles.bmp: ..\src\tiles.bmp
	@copy ..\src\tiles.bmp ..\win\win32\tiles.bmp

..\win\win32\tiles32.bmp: ..\src\tiles32.bmp
	@copy ..\src\tiles32.bmp ..\win\win32\tiles32.bmp

..\win\share\monmag.txt:	..\util\magtile.exe ..\win\share\monsters.txt
	..\util\magtile

..\win\share\objmag.txt:	..\util\magtile.exe ..\win\share\objects.txt
	..\util\magtile

..\win\share\othmag.txt:	..\util\magtile.exe ..\win\share\other.txt
	..\util\magtile

..\win\share\mon32.txt:	..\util\txtbg.exe ..\win\share\mon32-t.txt
	   ..\util\txtbg ..\win\share\mon32-t.txt ..\win\share\mon32.txt

..\win\share\obj32.txt:	..\util\txtbg.exe ..\win\share\obj32-t.txt
	   ..\util\txtbg ..\win\share\obj32-t.txt ..\win\share\obj32.txt

..\win\share\oth32.txt:	..\util\txtbg.exe ..\win\share\oth32-t.txt
	   ..\util\txtbg ..\win\share\oth32-t.txt ..\win\share\oth32.txt

..\win\share\mon32-t.txt:	..\util\txtmerge.exe ..\win\share\monmag.txt \
		..\win\share\mon32mi.txt ..\win\share\mon32alg.txt \
		..\win\share\mon32aw.txt 
	   chdir ..\win\share
	   ..\..\util\txtmerge mon32-t.txt monmag.txt -b204040 mon32mi.txt -bff00ff mon32alg.txt 
	   ..\..\util\txtmerge mon32-t.txt mon32-t.txt -bff00ff mon32aw.txt 
	   chdir ..\..\build

..\win\share\obj32-t.txt:	..\util\txtmerge.exe ..\win\share\objmag.txt \
		..\win\share\obj32mi.txt ..\win\share\obj32se.txt \
		..\win\share\obj32alg.txt
	   chdir ..\win\share
	   ..\..\util\txtmerge obj32-t.txt objmag.txt -b204040 obj32mi.txt -b obj32se.txt
	   ..\..\util\txtmerge obj32-t.txt obj32-t.txt -bff00ff obj32alg.txt
	   chdir ..\..\build

..\win\share\oth32-t.txt:	..\util\txtmerge.exe ..\win\share\othmag.txt \
		..\win\share\oth32mi.txt ..\win\share\oth32se.txt \
		..\win\share\oth32alg.txt
	   chdir ..\win\share
	   ..\..\util\txtmerge oth32-t.txt othmag.txt -b204040 oth32mi.txt -b oth32se.txt
	   ..\..\util\txtmerge oth32-t.txt oth32-t.txt -bff00ff oth32alg.txt
	   chdir ..\..\build


