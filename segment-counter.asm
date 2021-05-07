			ORG 00H

MOV P1,#11111111B ; initializes P1 as input port
MOV P0,#00000000B ; initializes P0 as output port
MOV P3,#00000000B ; initializes P3 as output port
MOV DPTR
#LABEL ; loads the address of "LABEL" to DPTRMAIN: MOV R4,#250 ; loads register R4 with 250D




Select:		SetB P0.7   ;Chip select
			SetB P3.3   ;Select Disp
			SetB P3.4	;Select Disp	
				
Init:		Mov R3,#00Ah	
Main:		Mov DPTR,#LUT
Back:		Clr A
			Movc A,@A+DPTR
			Mov P1,A
			Acall Delay
			Inc DPTR
			Djnz R3,Back

			Sjmp Init
			

Delay: 		Mov	R0, #05h  ; Outer loop
Again: 		Mov	R1, #0BCh  ; inner loop
Here:  		Djnz R1, Here   ; jump if r1 not 0
			Djnz R0, Again  ; jump if r0 not 0
			Ret
			
			Org 0200h
LUT:        DB 0C0h, 0F9h, 0A4h, 0B0h, 99h, 92h, 82h, 0F8h, 80h, 90h, 0
	
			End