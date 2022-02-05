	include "64cube.inc"

macro draw color,h,v
	lda color
	sta framebuf+h+64*v
endm

enum $0
	colorTimer db 0
	mainColor db #63
	colorToggle db 0
	include "64cube_ft2.inc"	; FamiTone2 uses 3 bytes of zeropage.
	;include "64cube_ft5.inc"	; FamiTone5 uses 36 bytes of zeropage.
ende

framepage equ #$1
framebuf equ #$1000

	;	Boot
	org $200
	sei
	ldx #$ff	;	set stack
	txs

	; Load song data
	ldx #<ft2testsong_music_data
	ldy #>ft2testsong_music_data
	lda #1 ; 1 ntsc, 0 pal
	jsr FamiToneInit		;init FamiTone

	; Load sound effects and init the SFX driver
	ldx #<sounds
	ldy #>sounds
	jsr FamiToneSfxInit

	; Start playing the first song (#0)
	lda #0
	jsr FamiToneMusicPlay

	lda framepage
	sta VIDEO

	lda #63
	sta mainColor

	_setw irq,VBLANK_IRQ
	cli


main:
	; draw crosshair
	draw mainColor, 31, 31
	draw mainColor, 30, 32
	draw mainColor, 31, 32
	draw mainColor, 32, 32
	draw mainColor, 31, 33

	jmp main


irq:
	inc colorTimer
	jsr ColorUpdate
	jsr FamiToneUpdate		; This must be called in an irq when playing music
	rti

; Subroutine for toggling color white (63) or red (2)
; Plays a sound effect whenever color changes
ColorUpdate:
		ldx colorTimer
  	cpx #$40
  	bcc +++								; if timer is less than $40, do nothing
		ldx #0
		stx colorTimer
		lda colorToggle
  	eor #1
  	sta colorToggle
		ldx FT_SFX_CH0				; set the channel for this sfx (optional)
		jsr FamiToneSfxPlay		; since colorToggle is in register A, we'll play the sfx # = to colorToggle's value
		lda colorToggle
  	cmp #0
  	beq +
  	lda #2
  	jmp ++
+		lda #63
++	sta mainColor
+++	rts

; FamiTone Settings
	FT_BASE_ADR		= $Df00		; page in the RAM used for FT2 variables, should be $xx00
	;FT_DPCM_ENABLE					; include DMC code
	;FT_DPCM_OFF		= $fc00	; $c000..$ffc0, 64-byte steps (must be defined if dpcm enabled)
	FT_SFX_STREAMS	= 4			; number of sound effects played at once, 1..4

	FT_SFX_ENABLE						; include SFX code
	;FT_THREAD								; undefine if you are calling sound effects from the same thread as the sound update call

	;FT_PAL_SUPPORT					; include PAL support
	FT_NTSC_SUPPORT					; include NTSC support

	include "64cube_ft2.asm"	; FamiTone2 driver
	;include "64cube_ft5.asm"	; FamiTone5 driver
	include "ft2testsong.asm"	; our beautiful song
	include "ft2testsfx.asm"	; our lovely sound effects
