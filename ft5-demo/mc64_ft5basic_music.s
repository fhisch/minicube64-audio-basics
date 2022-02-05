; Bare minimum to play music in minicube64 with the FamiTone driver
; This does NOT include any DPCM samples

include "includes/64cube.inc"

enum $0
include "includes/64cube_ft5.inc"
ende

  ; Boot
  org $200
  sei
  ldx #$ff
  txs

  ; Load song data
  ldx #<ft2testsong_music_data
  ldy #>ft2testsong_music_data
  lda #1 ; 1 ntsc, 0 pal
  jsr FamiToneInit		;init FamiTone

  ; Tell FamiTone to start playing song 0
  lda #0
  jsr FamiToneMusicPlay

  ; We need an interrupt process where music updates can happen
  _setw irq,VBLANK_IRQ
  cli

main:
  jmp main

irq:
  jsr FamiToneUpdate ; Music won't play without this update call
  rti

  ; FamiTone Settings
  ; Since we're ONLY loading music and have no DPCM samples,
  ; we can disable a lot of code, making the file smaller/more efficient
  	FT_BASE_ADR		= $Df00		; page in the RAM used for FT2 variables, should be $xx00
  	;FT_DPCM_ENABLE					; include DMC code
  	;FT_DPCM_OFF		= $fc00	; $c000..$ffc0, 64-byte steps (must be defined if dpcm enabled)
  	FT_SFX_STREAMS	= 1			; number of sound effects played at once, 1..4

  	;FT_SFX_ENABLE						; include SFX code
  	;FT_THREAD								; undefine if you are calling sound effects from the same thread as the sound update call

  	;FT_PAL_SUPPORT					; include PAL support
  	FT_NTSC_SUPPORT					; include NTSC support

include "includes/64cube_ft5.asm"  ; FamiTone2d driver
include "ft5-demo/ft5testsong.asm" ; music file
