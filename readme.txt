+==================================================+
+                                                  +
+ Audio implementation for the Minicube64 emulator +
+    using FamiTone2 and FamiTone5                 +
+                                                  +
+==================================================+

This is a demo of using the FamiTone audio library with the Minicube64 fantasy
console emulator. I'll be updating this document with more details when my cat
stops freaking out.

OVERVIEW-----------------------------------------

The FamiTone driver files are "64cube_ft2" for FamiTone2d and "64cube_ft5" for
FamiTone5.

The .asm files are the main includes - put these near the bottom of your code,
before including song and sfx files.

The .inc files are zeropage variables. These must be placed inside an enum
starting at a zeropage address, e.g.:

  ENUM $0
  include "64cube_ft2.inc"
  ENDE

Differences between FamiTone versions:

FamiTone2d is lightweight but can't do a lot of effects. It is also somewhat
strict with formatting.

FamiTone5 has a lot more support for fancy effects, but at a cost of size and
possibly speed.


CONVERSION TOOLS---------------------------------

Music and SFX each need to be contained in their own separate files. When using
the following conversion tools, always be sure to use the -asm6 flag.

:: Music

  FamiTone2d: text2data.exe
  FamiTone5:  text2vol5.exe
  Usage: text2data.exe [music_file.txt] -asm6

  Converts a song exported as .txt to .asm. If you are using any DPCM samples,
  the tool will create an additional file

:: SFX

  FamiTone2d: nsf2data.exe
  FamiTone5:  nsf2data5.exe
  Usage: nsf2data.exe [sfx_file.nsf] -asm6

  Converts .nsf file to .asm.

LIMITATIONS AND CAVEATS--------------------------

:: FamiTone2d Limitations

:: FamiTone5 Limitations


DEMO AND EXAMPLE FILES---------------------------

:: FamiTone2d  ( ./ft2-demo/ )

    mc64_ft2audio_demo.s   - Contains both music and sound effects.
    mc64_ft2basic_music.s  - A bare minimum of code to have music playing.
    ft2testsong.asm        - Music created with FamiTracker and converted using
                             text2data.exe.
    ft2testsfx.asm         - Sound effects created with FamiTracker and
                             converted using nsf2data.exe.

:: FamiTone5 ( ./ft5-demo/ )

    mc64_ft5audio_demo.s   - Contains both music and sound effects.
    mc64_ft5basic_music.s  - A bare minimum of code to have music playing.
    ft5testsong.asm        - Music created with FamiTracker and converted using
                             text2vol5.exe.
    ft5testsfx.asm         - Sound effects created with FamiTracker and
                             converted using nsf2data5.exe.


ABOUT MINICUBE64---------------------------------

ABOUT FAMITONE-----------------------------------

FamiTone was originally written by Shiru 04'17. Versions 2d and 5 are
unofficial updates by Doug Fraker (nesdoug.com).

-------------------------------------------------
-------------------------------------------------
To do:
- add more info about the famitone utilities
- add "bare-minimum" example scripts
- more credits and references
- probably other stuff but my cat won't leave me alone
