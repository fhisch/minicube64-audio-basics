+==================================================+
+                                                  +
+ FamiTone File Converters - Basic Usage           +
+                                                  +
+==================================================+

(This doc is a work in progress)

Utilities for converting FamiTracker files for use with the FamiTone driver.

After using FamiTracker's text export, you can use the following to create
properly formatted .asm files:

Famitone2:
  text2data.exe <file.txt> -asm6
Famitone5:
  text2vol5.exe <file.txt> -asm6

If your file contains DPCM sample data, these converters will output two files:
an .asm and a (binary of some sort).

- to do: nsf2data = sfx
- dpcm
