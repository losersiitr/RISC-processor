; Basic test of Processor 
;   Primary Tests:
;       > Memory Tests: Write to memory address : 0x3FC
;       > Register Tests: Load each register with its index
;       > Instruction Tests: Test subset of instructions:
;           ADD, SUB, AND, OR, XOR, "A" (LDR), SHL, SHR, SRA,
;           CMPEQ, CMPLT, CMPLE, ADDC, SUBC, ANDC, ORC, XORC,
;           ST, LD, SHLC, SHRC, SRAC, CMPEQC, CMPLTC, CMPLEC

; This program ends after 250 cycles, following writes to memory are
; performed during the program 
;  on cycle  14: should write 0x00000002  PC = 0x034
;  on cycle  41: should write 0x0000011A  PC = 0x0A0
;  on cycle  69: should write 0x00011F12  PC = 0x110
;  on cycle 112: should write 0x047C7B8C  PC = 0x1BC
;  on cycle 126: should write 0xC7B8C7A7  PC = 0x1F4
;  on cycle 158: should write 0xA17A11C7  PC = 0x274
;  on cycle 188: should write 0xA1638E2C  PC = 0x2EC
;  on cycle 235: should write 0x871C71C7  PC = 0x3A8
;  on cycle 242: should write 0x47A2B9C0  PC = 0x3C4

;
; First load each register with its
; number using only OP instructions
;
	AND %r31, %r31, %r0
	CMPEQ %r31, %r31, %r1
	ADD %r1, %r1, %r2
	OR %r2, %r1, %r3
	SHL %r1, %r2, %r4

	SHL %r0, %r1, %r0	XOR %r0, %r1, %r0
	SHL %r0, %r1, %r0	XOR %r0, %r2, %r0
	SHL %r0, %r1, %r0	XOR %r0, %r3, %r0
	SHL %r0, %r1, %r0	XOR %r0, %r4, %r0
	ST %r0, 0x3FC, %r31	; cycle 14: should write 0x2

	XOR %r4, %r1, %r5
	SHL %r3, %r1, %r6
	OR %r2, %r5, %r7
	SHL %r1, %r3, %r8
	ADD %r5, %r5, %r9
	SUB %r9, %r1, %r9
	ADD %r3, %r7, %r10
	OR %r8, %r3, %r11
	SHL %r6, %r10, %r12
	SHR %r12, %r9, %r12

	SHL %r0, %r1, %r0	
    XOR %r0, %r5, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r6, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r7, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r8, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r9, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r10, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r11, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r12, %r0
	ST %r0,0x3FC, %r31	; cycle 41: should write 0x11A

	ADD %r7, %r6, %r13
	ADD %r9, %r5, %r14
	XOR %r10, %r5, %r15
	XOR %r15, %r7, %r16
	ADD %r16, %r16, %r16
	ADD %r4, %r13, %r17
	ADD %r15, %r15, %r18
	SUB %r18, %r12, %r18
	OR %r18, %r1, %r19
	CMPLT %r17, %r18, %r20
	ADD %r19, %r20, %r20

	SHL %r0, %r1, %r0	
    XOR %r0, %r13, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r14, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r15, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r16, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r17, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r18, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r19, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r20, %r0
	ST %r0,0x3FC,%r31	; cycle 69: should write 0x11F12

	SHL %r16, %r20, %r21
	SHL %r21, %r7, %r21
	SRA %r21, %r20, %r21
	SRA %r21, %r9, %r21
	SUB %r17, %r21, %r21
	CMPLE %r19, %r20, %r22
	ADD %r22, %r21, %r22
	OR %r20, %r3, %r23
	SHL %r6, %r2, %r24
	SHL %r5, %r3, %r25
	SUB %r25, %r15, %r25
	SUB %r4, %r24, %r26
	SUB %r6, %r26, %r26
	ADD %r14, %r13, %r27
	SHL %r27, %r27, %r28
	SHR %r28, %r27, %r28
	ADD %r1, %r28, %r28
	SHL %r15, %r23, %r29
	SRA %r29, %r23, %r29
	ADD %r29, %r14, %r29
	AND %r29, %r28, %r30
	XOR %r30, %r2, %r30

	SHL %r0, %r1, %r0	
    XOR %r0, %r21, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r22, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r23, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r24, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r25, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r26, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r27, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r28, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r29, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r30, %r0
	ST %r0,0x3FC,%r31	; cycle 112: should write 0x47C7B8C

;
; Now test OPC instructions
; by loading setting each reg
; to 2^reg+1 - 1 
;
	ORC %r31, 3, %r1
	XORC %r1, 4, %r2
	ORC %r2, -1, %r3
	ANDC %r3, 15, %r3
	ADDC %r3, 16, %r4

	SHL %r0, %r1, %r0	
    XOR %r0, %r1, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r2, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r3, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r4, %r0
	ST %r0,0x3FC,%r31	; cycle 126: should write 0xC7B8C7A7

	SUBC %r4, -32, %r5
	CMPEQC %r5, 63, %r6
	ADDC %r6, 126, %r6
	CMPLTC %r6, 128, %r7
	SUBC %r7, -254, %r7
	CMPLECr31, 7, %r8
	ORC %r8, 0x1fe, %r8
	CMPEQC %r8, 0x1fe, %r9
	ADDC %r9, 0x3ff, %r9
	CMPLTC %r9, 0x3fe, %r10
	XORC %r10, 0x7ff, %r10
	CMPLEC %r10, 0x7fe, %r11
	XORC %r11, 0xfff, %r11
	SHLC %r11, 1, %r12
	XORC %r12, 1, %r12

	SHL %r0, %r1, %r0	
    XOR %r0, %r5, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r6, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r7, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r8, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r9, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r10, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r11, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r12, %r0
	ST %r0,0x3FC,%r31	; cycle 158: should write 0xA17A11C7

	ADDC %r31, -1, %r13
	SHRC %r13, 18, %r13
	ADDC %r13, 0x4000, %r14
	ADDC %r14, 1, %r15
	ADDC %r15, 0x7fff, %r15
	ADDC %r31, -1, %r16
	SHRC %r16, 15, %r16
	SUBC %r31, 16384, %r17
	SHRC %r17, 14, %r17
	SHLC %r17, 1, %r18
	ADDC %r18, 1, %r18
	SHLC %r18, 1, %r19
	ADDC %r19, 1, %r19

	SHL %r0, %r1, %r0	
    XOR %r0, %r13, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r14, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r15, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r16, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r17, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r18, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r19, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r20, %r0
	ST %r0,0x3FC,%r31	; cycle 188: should write 0xA1638E2C

	SUBC %r31, 1, %r20
	SRAC %r20, 31, %r20
	SHRC %r20, 11, %r20
	SRAC %r20, 12, %r21
	SHLC %r21, 13, %r21
	ADDC %r21, 8191, %r21
	ANDC %r21, -1, %r22
	SHLC %r22, 1, %r22
	ADDC %r22, 1, %r22
	SHLC %r22, 1, %r23
	SUBC %r23, -1, %r23
	ORC %r31, 0x3ff, %r24
	SHLC %r24, 15, %r24
	XORC %r24, 0x7fff, %r24
	SUBC %r31, 1, %r25
	SHRC %r25, 6, %r25
	SUBC %r31, 1, %r26
	SHRC %r26, 5, %r26
	SUBC %r31, 1, %r27
	SHRC %r27, 4, %r27
	SUBC %r31, 1, %r28
	SHRC %r28, 3, %r28
	SUBC %r31, 1, %r29
	SHRC %r29, 2, %r29
	SUBC %r31, 1, %r30
	SHRC %r30, 1, %r30

	SHL %r0, %r1, %r0	
    XOR %r0, %r21, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r22, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r23, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r24, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r25, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r26, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r27, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r28, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r29, %r0
	SHL %r0, %r1, %r0	
    XOR %r0, %r30, %r0
	ST %r0,0x3FC,%r31	; cycle 235: should write 0x871C71C7

; test LD and ST

       LD %r31, 0, %r2	; location 0
       SHL %r0, %r1, %r0
       XOR %r0, %r2, %r0
       LDr1,5,r3	; location 8
       SHL %r0, %r1, %r0
       XOR %r0, %r3, %r0
       ST %r0,0x3FC,%r31	; cycle 242: should write 0x47A2B9C0

	.breakpoint
       
	ADD %r31, %r31, %r31
	ADD %r31, %r31, %r31
	ADD %r31, %r31, %r31
	ADD %r31, %r31, %r31
	ADD %r31, %r31, %r31
	ADD %r31, %r31, %r31
	ADD %r31, %r31, %r31
	ADD %r31, %r31, %r31
	ADD %r31, %r31, %r31
	ADD %r31, %r31, %r31
	ADD %r31, %r31, %r31
	ADD %r31, %r31, %r31
	ADD %r31, %r31, %r31
