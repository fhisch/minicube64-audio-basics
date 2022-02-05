; zeropage variables for famitone5
; 36 bytes
; MUST be included within an ENUM

volume_Sq1 	.db 0
volume_Sq2 	.db 0
volume_Nz 	.db 0
vol_change 	.db 0
multiple1 	.db 0
;multiple2 	.db 0

vibrato_depth1 	.db 0 ;zero = off
vibrato_depth2 	.db 0
vibrato_depth3 	.db 0
vibrato_count 	.db 0 ;goes up every frame, shared by all

slide_mode1  .db 0 ;0 = off, 1 = up, 2 = down, 3 = portamento, 4 q/r
slide_mode2  .db 0
slide_mode3  .db 0
slide_speed1 	.db 0 ;how much each frame, zero = off
slide_speed2 	.db 0
slide_speed3 	.db 0
slide_count_low1 	.db 0 ;how much to add / subtract from low byte - cumulative
slide_count_low2 	.db 0
slide_count_low3 	.db 0
slide_count_high1 	.db 0 ; how much to add / subtract from high byte
slide_count_high2 	.db 0
slide_count_high3 	.db 0

temp_low 		.db 0 ;low byte of frequency
temp_high 		.db 0
channel 		.db 0

temp_duty 		.db 0
qr_flag 		.db 0
qr_offset 		.db 0
qr_rate 		.db 0
zero_flag1 		.db 0 ;for remembering if 100,200,300
zero_flag2 		.db 0
zero_flag3		.db 0 ;31 new variables

scratch_temp1	.db 0

FT_TEMP	.db 0,0,0	; allocate 3 bytes for the library to use as a scratchpad
