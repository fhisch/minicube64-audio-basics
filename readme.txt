This is a demo of using FamiTone to drive audio in minicube64.

I'll be updating this document with more details when my cat stops freaking out.

The FamiTone driver files are "64cube_ft2" for FamiTone2d and "64cube_ft5" for FamiTone5.
The .asm files are the main includes - put these near the bottom of your code, before including song and sfx files.
The .inc files are zeropage variables. These must be placed inside an enum starting at a zeropage address, e.g.:

ENUM $0
include "64cube_ft2.inc"
ENDE

Differences between FamiTone versions:

FamiTone2d is lightweight but can't do a lot of effects. It is also somewhat strict with formatting.

FamiTone5 has a lot more support for fancy effects, but at a cost of size and possibly speed.


To do:
- add more info about the famitone utilities
- add "bare-minimum" example scripts
- credits and references
- probably other stuff but my cat won't leave me alone
