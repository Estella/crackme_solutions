.586
.model flat,c

comment ~

algo			: HAVAL v.1
message digest size	: 128, 160, 192, 224 or 256 bits


	push	offset ptrData			;The address of the data to be hashed
	push	nSize 				;The number of bytes of data to be hashed
	push	offset ptrBuffer		;The pointer to the buffer to receive message digest
	call	Haval


WiteG//xtreeme (witeg@poczta.fm, www.witeg.prv.pl)

~
; ---------------------------------------------------------------------------
; You should set number of passes (PASS) and size of message digest (FPTLEN) !
; ---------------------------------------------------------------------------

PASS	equ 3			;3, 4, 5
FPTLEN	equ 128			;128, 160, 192, 224, 256

; ---------------------------------------------------------------------------

include	d2k2_crackme08_hash.mac

d2k2_crackme08_hash	PROTO	:DWORD, :DWORD, :DWORD

.data?
_hash_0		dd ?
_hash_1		dd ?
_hash_2		dd ?
_hash_3		dd ?
_hash_4		dd ?
_hash_5		dd ?
_hash_6		dd ?
_hash_7		dd ?
_temp_hash_0	dd ?
_temp_hash_1	dd ?
_temp_hash_2	dd ?
_temp_hash_3	dd ?
_temp_hash_4	dd ?
_temp_hash_5	dd ?
_temp_hash_6	dd ?
_temp_hash_7	dd ?
_temp_bufor 	db 256 dup(?)
_size		dd ?
_flag		dd ?
_count		dd ?

.code
d2k2_crackme08_hash		proc	ptrOut: DWORD, lData: DWORD, ptrData: DWORD
	pushad

	mov	ecx, lData
	mov	esi, ptrData
	mov	dword ptr [_size] , ecx
	mov	byte ptr  [_flag] , 1
	mov	dword ptr [_count], ecx

	mov	edi, offset _temp_hash_0
	mov	dword ptr [_hash_0] , 0344F7A98h
	mov	dword ptr [_hash_1] , 085A308D3h
	mov	dword ptr [_hash_2] , 013198A2Eh
	mov	dword ptr [_hash_3] , 003707344h
	mov	dword ptr [_hash_4] , 0A4093822h
	mov	dword ptr [_hash_5] , 0299F31D0h
	mov	dword ptr [_hash_6] , 0082EFA98h
	mov	dword ptr [_hash_7] , 0EC4E6C89h

	mov	dword ptr [edi+ 0] , 0243F6A88h
	mov	dword ptr [edi+ 4] , 085A308D3h
	mov	dword ptr [edi+ 8] , 013198A2Eh
	mov	dword ptr [edi+12] , 003707344h
	mov	dword ptr [edi+16] , 0A4093822h
	mov	dword ptr [edi+20] , 0299F31D0h
	mov	dword ptr [edi+24] , 0082EFA98h
	mov	dword ptr [edi+28] , 0EC4E6C89h

@@HAVAL_Loop:
	cmp	dword ptr [_count] , 128
	jb	@@HAVAL_POF
	
	FF_1	y7,y6,y5,y4,y3,y2,y1,y0, dword ptr [esi+4* 0]
	FF_1	y6,y5,y4,y3,y2,y1,y0,y7, dword ptr [esi+4* 1]
	FF_1	y5,y4,y3,y2,y1,y0,y7,y6, dword ptr [esi+4* 2]
	FF_1	y4,y3,y2,y1,y0,y7,y6,y5, dword ptr [esi+4* 3]
	FF_1	y3,y2,y1,y0,y7,y6,y5,y4, dword ptr [esi+4* 4]
	FF_1	y2,y1,y0,y7,y6,y5,y4,y3, dword ptr [esi+4* 5]
	FF_1	y1,y0,y7,y6,y5,y4,y3,y2, dword ptr [esi+4* 6]
	FF_1	y0,y7,y6,y5,y4,y3,y2,y1, dword ptr [esi+4* 7]
	FF_1	y7,y6,y5,y4,y3,y2,y1,y0, dword ptr [esi+4* 8]
	FF_1	y6,y5,y4,y3,y2,y1,y0,y7, dword ptr [esi+4* 9]
	FF_1	y5,y4,y3,y2,y1,y0,y7,y6, dword ptr [esi+4*10]
	FF_1	y4,y3,y2,y1,y0,y7,y6,y5, dword ptr [esi+4*11]
	FF_1	y3,y2,y1,y0,y7,y6,y5,y4, dword ptr [esi+4*12]
	FF_1	y2,y1,y0,y7,y6,y5,y4,y3, dword ptr [esi+4*13]
	FF_1	y1,y0,y7,y6,y5,y4,y3,y2, dword ptr [esi+4*14]
	FF_1	y0,y7,y6,y5,y4,y3,y2,y1, dword ptr [esi+4*15]
	FF_1	y7,y6,y5,y4,y3,y2,y1,y0, dword ptr [esi+4*16]
	FF_1	y6,y5,y4,y3,y2,y1,y0,y7, dword ptr [esi+4*17]
	FF_1	y5,y4,y3,y2,y1,y0,y7,y6, dword ptr [esi+4*18]
	FF_1	y4,y3,y2,y1,y0,y7,y6,y5, dword ptr [esi+4*19]
	FF_1	y3,y2,y1,y0,y7,y6,y5,y4, dword ptr [esi+4*20]
	FF_1	y2,y1,y0,y7,y6,y5,y4,y3, dword ptr [esi+4*21]
	FF_1	y1,y0,y7,y6,y5,y4,y3,y2, dword ptr [esi+4*22]
	FF_1	y0,y7,y6,y5,y4,y3,y2,y1, dword ptr [esi+4*23]
	FF_1	y7,y6,y5,y4,y3,y2,y1,y0, dword ptr [esi+4*24]
	FF_1	y6,y5,y4,y3,y2,y1,y0,y7, dword ptr [esi+4*25]
	FF_1	y5,y4,y3,y2,y1,y0,y7,y6, dword ptr [esi+4*26]
	FF_1	y4,y3,y2,y1,y0,y7,y6,y5, dword ptr [esi+4*27]
	FF_1	y3,y2,y1,y0,y7,y6,y5,y4, dword ptr [esi+4*28]
	FF_1	y2,y1,y0,y7,y6,y5,y4,y3, dword ptr [esi+4*29]
	FF_1	y1,y0,y7,y6,y5,y4,y3,y2, dword ptr [esi+4*30]
	FF_1	y0,y7,y6,y5,y4,y3,y2,y1, dword ptr [esi+4*31]

	FF_2	y7,y6,y5,y4,y3,y2,y1,y0, dword ptr [esi+4* 5],0452821E6h
	FF_2	y6,y5,y4,y3,y2,y1,y0,y7, dword ptr [esi+4*14],038D01377h
	FF_2	y5,y4,y3,y2,y1,y0,y7,y6, dword ptr [esi+4*26],0BE5466CFh
	FF_2	y4,y3,y2,y1,y0,y7,y6,y5, dword ptr [esi+4*18],034E90C6Ch
	FF_2	y3,y2,y1,y0,y7,y6,y5,y4, dword ptr [esi+4*11],0C0AC29B7h
	FF_2	y2,y1,y0,y7,y6,y5,y4,y3, dword ptr [esi+4*28],0C97C50DDh
	FF_2	y1,y0,y7,y6,y5,y4,y3,y2, dword ptr [esi+4* 7],03F84D5B5h
	FF_2	y0,y7,y6,y5,y4,y3,y2,y1, dword ptr [esi+4*16],0B5470917h
	FF_2	y7,y6,y5,y4,y3,y2,y1,y0, dword ptr [esi+4* 0],09216D5D9h
	FF_2	y6,y5,y4,y3,y2,y1,y0,y7, dword ptr [esi+4*23],08979FB1Bh
	FF_2	y5,y4,y3,y2,y1,y0,y7,y6, dword ptr [esi+4*20],0D1310BA6h
	FF_2	y4,y3,y2,y1,y0,y7,y6,y5, dword ptr [esi+4*22],098DFB5ACh
	FF_2	y3,y2,y1,y0,y7,y6,y5,y4, dword ptr [esi+4* 1],02FFD72DBh
	FF_2	y2,y1,y0,y7,y6,y5,y4,y3, dword ptr [esi+4*10],0D01ADFB7h
	FF_2	y1,y0,y7,y6,y5,y4,y3,y2, dword ptr [esi+4* 4],0B8E1AFEDh
	FF_2	y0,y7,y6,y5,y4,y3,y2,y1, dword ptr [esi+4* 8],06A267E96h
	FF_2	y7,y6,y5,y4,y3,y2,y1,y0, dword ptr [esi+4*30],0BA7C9045h
	FF_2	y6,y5,y4,y3,y2,y1,y0,y7, dword ptr [esi+4* 3],0F12C7F99h
	FF_2	y5,y4,y3,y2,y1,y0,y7,y6, dword ptr [esi+4*21],024A19947h
	FF_2	y4,y3,y2,y1,y0,y7,y6,y5, dword ptr [esi+4* 9],0B3916CF7h
	FF_2	y3,y2,y1,y0,y7,y6,y5,y4, dword ptr [esi+4*17],00801F2E2h
	FF_2	y2,y1,y0,y7,y6,y5,y4,y3, dword ptr [esi+4*24],0858EFC16h
	FF_2	y1,y0,y7,y6,y5,y4,y3,y2, dword ptr [esi+4*29],0636920D8h
	FF_2	y0,y7,y6,y5,y4,y3,y2,y1, dword ptr [esi+4* 6],071574E69h
	FF_2	y7,y6,y5,y4,y3,y2,y1,y0, dword ptr [esi+4*19],0A458FEA3h
	FF_2	y6,y5,y4,y3,y2,y1,y0,y7, dword ptr [esi+4*12],0F4933D7Eh
	FF_2	y5,y4,y3,y2,y1,y0,y7,y6, dword ptr [esi+4*15],00D95748Fh
	FF_2	y4,y3,y2,y1,y0,y7,y6,y5, dword ptr [esi+4*13],0728EB658h
	FF_2	y3,y2,y1,y0,y7,y6,y5,y4, dword ptr [esi+4* 2],0718BCD58h
	FF_2	y2,y1,y0,y7,y6,y5,y4,y3, dword ptr [esi+4*25],082154AEEh
	FF_2	y1,y0,y7,y6,y5,y4,y3,y2, dword ptr [esi+4*31],07B54A41Dh
	FF_2	y0,y7,y6,y5,y4,y3,y2,y1, dword ptr [esi+4*27],0C25A59B5h

	FF_3	y7,y6,y5,y4,y3,y2,y1,y0, dword ptr [esi+4*19],09C30D539h
	FF_3	y6,y5,y4,y3,y2,y1,y0,y7, dword ptr [esi+4* 9],02AF26013h
	FF_3	y5,y4,y3,y2,y1,y0,y7,y6, dword ptr [esi+4* 4],0C5D1B023h
	FF_3	y4,y3,y2,y1,y0,y7,y6,y5, dword ptr [esi+4*20],0286085F0h
	FF_3	y3,y2,y1,y0,y7,y6,y5,y4, dword ptr [esi+4*28],0CA417918h
	FF_3	y2,y1,y0,y7,y6,y5,y4,y3, dword ptr [esi+4*17],0B8DB38EFh
	FF_3	y1,y0,y7,y6,y5,y4,y3,y2, dword ptr [esi+4* 8],08E79DCB0h
	FF_3	y0,y7,y6,y5,y4,y3,y2,y1, dword ptr [esi+4*22],0603A180Eh
	FF_3	y7,y6,y5,y4,y3,y2,y1,y0, dword ptr [esi+4*29],06C9E0E8Bh
	FF_3	y6,y5,y4,y3,y2,y1,y0,y7, dword ptr [esi+4*14],0B01E8A3Eh
	FF_3	y5,y4,y3,y2,y1,y0,y7,y6, dword ptr [esi+4*25],0D71577C1h
	FF_3	y4,y3,y2,y1,y0,y7,y6,y5, dword ptr [esi+4*12],0BD314B27h
	FF_3	y3,y2,y1,y0,y7,y6,y5,y4, dword ptr [esi+4*24],078AF2FDAh
	FF_3	y2,y1,y0,y7,y6,y5,y4,y3, dword ptr [esi+4*30],055605C60h
	FF_3	y1,y0,y7,y6,y5,y4,y3,y2, dword ptr [esi+4*16],0E65525F3h
	FF_3	y0,y7,y6,y5,y4,y3,y2,y1, dword ptr [esi+4*26],0AA55AB94h
	FF_3	y7,y6,y5,y4,y3,y2,y1,y0, dword ptr [esi+4*31],057489862h
	FF_3	y6,y5,y4,y3,y2,y1,y0,y7, dword ptr [esi+4*15],063E81440h
	FF_3	y5,y4,y3,y2,y1,y0,y7,y6, dword ptr [esi+4* 7],055CA396Ah
	FF_3	y4,y3,y2,y1,y0,y7,y6,y5, dword ptr [esi+4* 3],02AAB10B6h
	FF_3	y3,y2,y1,y0,y7,y6,y5,y4, dword ptr [esi+4* 1],0B4CC5C34h
	FF_3	y2,y1,y0,y7,y6,y5,y4,y3, dword ptr [esi+4* 0],01141E8CEh
	FF_3	y1,y0,y7,y6,y5,y4,y3,y2, dword ptr [esi+4*18],0A15486AFh
	FF_3	y0,y7,y6,y5,y4,y3,y2,y1, dword ptr [esi+4*27],07C72E993h
	FF_3	y7,y6,y5,y4,y3,y2,y1,y0, dword ptr [esi+4*13],0B3EE1411h
	FF_3	y6,y5,y4,y3,y2,y1,y0,y7, dword ptr [esi+4* 6],0636FBC2Ah
	FF_3	y5,y4,y3,y2,y1,y0,y7,y6, dword ptr [esi+4*21],02BA9C55Dh
	FF_3	y4,y3,y2,y1,y0,y7,y6,y5, dword ptr [esi+4*10],0741831F6h
	FF_3	y3,y2,y1,y0,y7,y6,y5,y4, dword ptr [esi+4*23],0CE5C3E16h
	FF_3	y2,y1,y0,y7,y6,y5,y4,y3, dword ptr [esi+4*11],09B87931Eh
	FF_3	y1,y0,y7,y6,y5,y4,y3,y2, dword ptr [esi+4* 5],0AFD6BA33h
	FF_3	y0,y7,y6,y5,y4,y3,y2,y1, dword ptr [esi+4* 2],06C24CF5Ch

IFE	(PASS - 4)

	FF_4	y7,y6,y5,y4,y3,y2,y1,y0, dword ptr [esi+4*24],07A325381h
	FF_4	y6,y5,y4,y3,y2,y1,y0,y7, dword ptr [esi+4* 4],028958677h
	FF_4	y5,y4,y3,y2,y1,y0,y7,y6, dword ptr [esi+4* 0],03B8F4898h
	FF_4	y4,y3,y2,y1,y0,y7,y6,y5, dword ptr [esi+4*14],06B4BB9AFh
	FF_4	y3,y2,y1,y0,y7,y6,y5,y4, dword ptr [esi+4* 2],0C4BFE81Bh
	FF_4	y2,y1,y0,y7,y6,y5,y4,y3, dword ptr [esi+4* 7],066282193h
	FF_4	y1,y0,y7,y6,y5,y4,y3,y2, dword ptr [esi+4*28],061D809CCh
	FF_4	y0,y7,y6,y5,y4,y3,y2,y1, dword ptr [esi+4*23],0FB21A991h
	FF_4	y7,y6,y5,y4,y3,y2,y1,y0, dword ptr [esi+4*26],0487CAC60h
	FF_4	y6,y5,y4,y3,y2,y1,y0,y7, dword ptr [esi+4* 6],05DEC8032h
	FF_4	y5,y4,y3,y2,y1,y0,y7,y6, dword ptr [esi+4*30],0EF845D5Dh
	FF_4	y4,y3,y2,y1,y0,y7,y6,y5, dword ptr [esi+4*20],0E98575B1h
	FF_4	y3,y2,y1,y0,y7,y6,y5,y4, dword ptr [esi+4*18],0DC262302h
	FF_4	y2,y1,y0,y7,y6,y5,y4,y3, dword ptr [esi+4*25],0EB651B88h
	FF_4	y1,y0,y7,y6,y5,y4,y3,y2, dword ptr [esi+4*19],023893E81h
	FF_4	y0,y7,y6,y5,y4,y3,y2,y1, dword ptr [esi+4* 3],0D396ACC5h
	FF_4	y7,y6,y5,y4,y3,y2,y1,y0, dword ptr [esi+4*22],00F6D6FF3h
	FF_4	y6,y5,y4,y3,y2,y1,y0,y7, dword ptr [esi+4*11],083F44239h
	FF_4	y5,y4,y3,y2,y1,y0,y7,y6, dword ptr [esi+4*31],02E0B4482h
	FF_4	y4,y3,y2,y1,y0,y7,y6,y5, dword ptr [esi+4*21],0A4842004h
	FF_4	y3,y2,y1,y0,y7,y6,y5,y4, dword ptr [esi+4* 8],069C8F04Ah
	FF_4	y2,y1,y0,y7,y6,y5,y4,y3, dword ptr [esi+4*27],09E1F9B5Eh
	FF_4	y1,y0,y7,y6,y5,y4,y3,y2, dword ptr [esi+4*12],021C66842h
	FF_4	y0,y7,y6,y5,y4,y3,y2,y1, dword ptr [esi+4* 9],0F6E96C9Ah
	FF_4	y7,y6,y5,y4,y3,y2,y1,y0, dword ptr [esi+4* 1],0670C9C61h
	FF_4	y6,y5,y4,y3,y2,y1,y0,y7, dword ptr [esi+4*29],0ABD388F0h
	FF_4	y5,y4,y3,y2,y1,y0,y7,y6, dword ptr [esi+4* 5],06A51A0D2h
	FF_4	y4,y3,y2,y1,y0,y7,y6,y5, dword ptr [esi+4*15],0D8542F68h
	FF_4	y3,y2,y1,y0,y7,y6,y5,y4, dword ptr [esi+4*17],0960FA728h
	FF_4	y2,y1,y0,y7,y6,y5,y4,y3, dword ptr [esi+4*10],0AB5133A3h
	FF_4	y1,y0,y7,y6,y5,y4,y3,y2, dword ptr [esi+4*16],06EEF0B6Ch
	FF_4	y0,y7,y6,y5,y4,y3,y2,y1, dword ptr [esi+4*13],0137A3BE4h

ENDIF
	
IFE	(PASS - 5)

	FF_4	y7,y6,y5,y4,y3,y2,y1,y0, dword ptr [esi+4*24],07A325381h
	FF_4	y6,y5,y4,y3,y2,y1,y0,y7, dword ptr [esi+4* 4],028958677h
	FF_4	y5,y4,y3,y2,y1,y0,y7,y6, dword ptr [esi+4* 0],03B8F4898h
	FF_4	y4,y3,y2,y1,y0,y7,y6,y5, dword ptr [esi+4*14],06B4BB9AFh
	FF_4	y3,y2,y1,y0,y7,y6,y5,y4, dword ptr [esi+4* 2],0C4BFE81Bh
	FF_4	y2,y1,y0,y7,y6,y5,y4,y3, dword ptr [esi+4* 7],066282193h
	FF_4	y1,y0,y7,y6,y5,y4,y3,y2, dword ptr [esi+4*28],061D809CCh
	FF_4	y0,y7,y6,y5,y4,y3,y2,y1, dword ptr [esi+4*23],0FB21A991h
	FF_4	y7,y6,y5,y4,y3,y2,y1,y0, dword ptr [esi+4*26],0487CAC60h
	FF_4	y6,y5,y4,y3,y2,y1,y0,y7, dword ptr [esi+4* 6],05DEC8032h
	FF_4	y5,y4,y3,y2,y1,y0,y7,y6, dword ptr [esi+4*30],0EF845D5Dh
	FF_4	y4,y3,y2,y1,y0,y7,y6,y5, dword ptr [esi+4*20],0E98575B1h
	FF_4	y3,y2,y1,y0,y7,y6,y5,y4, dword ptr [esi+4*18],0DC262302h
	FF_4	y2,y1,y0,y7,y6,y5,y4,y3, dword ptr [esi+4*25],0EB651B88h
	FF_4	y1,y0,y7,y6,y5,y4,y3,y2, dword ptr [esi+4*19],023893E81h
	FF_4	y0,y7,y6,y5,y4,y3,y2,y1, dword ptr [esi+4* 3],0D396ACC5h
	FF_4	y7,y6,y5,y4,y3,y2,y1,y0, dword ptr [esi+4*22],00F6D6FF3h
	FF_4	y6,y5,y4,y3,y2,y1,y0,y7, dword ptr [esi+4*11],083F44239h
	FF_4	y5,y4,y3,y2,y1,y0,y7,y6, dword ptr [esi+4*31],02E0B4482h
	FF_4	y4,y3,y2,y1,y0,y7,y6,y5, dword ptr [esi+4*21],0A4842004h
	FF_4	y3,y2,y1,y0,y7,y6,y5,y4, dword ptr [esi+4* 8],069C8F04Ah
	FF_4	y2,y1,y0,y7,y6,y5,y4,y3, dword ptr [esi+4*27],09E1F9B5Eh
	FF_4	y1,y0,y7,y6,y5,y4,y3,y2, dword ptr [esi+4*12],021C66842h
	FF_4	y0,y7,y6,y5,y4,y3,y2,y1, dword ptr [esi+4* 9],0F6E96C9Ah
	FF_4	y7,y6,y5,y4,y3,y2,y1,y0, dword ptr [esi+4* 1],0670C9C61h
	FF_4	y6,y5,y4,y3,y2,y1,y0,y7, dword ptr [esi+4*29],0ABD388F0h
	FF_4	y5,y4,y3,y2,y1,y0,y7,y6, dword ptr [esi+4* 5],06A51A0D2h
	FF_4	y4,y3,y2,y1,y0,y7,y6,y5, dword ptr [esi+4*15],0D8542F68h
	FF_4	y3,y2,y1,y0,y7,y6,y5,y4, dword ptr [esi+4*17],0960FA728h
	FF_4	y2,y1,y0,y7,y6,y5,y4,y3, dword ptr [esi+4*10],0AB5133A3h
	FF_4	y1,y0,y7,y6,y5,y4,y3,y2, dword ptr [esi+4*16],06EEF0B6Ch
	FF_4	y0,y7,y6,y5,y4,y3,y2,y1, dword ptr [esi+4*13],0137A3BE4h

	FF_5	y7,y6,y5,y4,y3,y2,y1,y0, dword ptr [esi+4*27],0BA3BF050h
	FF_5	y6,y5,y4,y3,y2,y1,y0,y7, dword ptr [esi+4* 3],07EFB2A98h
	FF_5	y5,y4,y3,y2,y1,y0,y7,y6, dword ptr [esi+4*21],0A1F1651Dh
	FF_5	y4,y3,y2,y1,y0,y7,y6,y5, dword ptr [esi+4*26],039AF0176h
	FF_5	y3,y2,y1,y0,y7,y6,y5,y4, dword ptr [esi+4*17],066CA593Eh
	FF_5	y2,y1,y0,y7,y6,y5,y4,y3, dword ptr [esi+4*11],082430E88h
	FF_5	y1,y0,y7,y6,y5,y4,y3,y2, dword ptr [esi+4*20],08CEE8619h
	FF_5	y0,y7,y6,y5,y4,y3,y2,y1, dword ptr [esi+4*29],0456F9FB4h
	FF_5	y7,y6,y5,y4,y3,y2,y1,y0, dword ptr [esi+4*19],07D84A5C3h
	FF_5	y6,y5,y4,y3,y2,y1,y0,y7, dword ptr [esi+4* 0],03B8B5EBEh
	FF_5	y5,y4,y3,y2,y1,y0,y7,y6, dword ptr [esi+4*12],0E06F75D8h
	FF_5	y4,y3,y2,y1,y0,y7,y6,y5, dword ptr [esi+4* 7],085C12073h
	FF_5	y3,y2,y1,y0,y7,y6,y5,y4, dword ptr [esi+4*13],0401A449Fh
	FF_5	y2,y1,y0,y7,y6,y5,y4,y3, dword ptr [esi+4* 8],056C16AA6h
	FF_5	y1,y0,y7,y6,y5,y4,y3,y2, dword ptr [esi+4*31],04ED3AA62h
	FF_5	y0,y7,y6,y5,y4,y3,y2,y1, dword ptr [esi+4*10],0363F7706h
	FF_5	y7,y6,y5,y4,y3,y2,y1,y0, dword ptr [esi+4* 5],01BFEDF72h
	FF_5	y6,y5,y4,y3,y2,y1,y0,y7, dword ptr [esi+4* 9],0429B023Dh
	FF_5	y5,y4,y3,y2,y1,y0,y7,y6, dword ptr [esi+4*14],037D0D724h
	FF_5	y4,y3,y2,y1,y0,y7,y6,y5, dword ptr [esi+4*30],0D00A1248h
	FF_5	y3,y2,y1,y0,y7,y6,y5,y4, dword ptr [esi+4*18],0DB0FEAD3h
	FF_5	y2,y1,y0,y7,y6,y5,y4,y3, dword ptr [esi+4* 6],049F1C09Bh
	FF_5	y1,y0,y7,y6,y5,y4,y3,y2, dword ptr [esi+4*28],0075372C9h
	FF_5	y0,y7,y6,y5,y4,y3,y2,y1, dword ptr [esi+4*24],080991B7Bh
	FF_5	y7,y6,y5,y4,y3,y2,y1,y0, dword ptr [esi+4* 2],025D479D8h
	FF_5	y6,y5,y4,y3,y2,y1,y0,y7, dword ptr [esi+4*23],0F6E8DEF7h
	FF_5	y5,y4,y3,y2,y1,y0,y7,y6, dword ptr [esi+4*16],0E3FE501Ah
	FF_5	y4,y3,y2,y1,y0,y7,y6,y5, dword ptr [esi+4*22],0B6794C3Bh
	FF_5	y3,y2,y1,y0,y7,y6,y5,y4, dword ptr [esi+4* 4],0976CE0BDh
	FF_5	y2,y1,y0,y7,y6,y5,y4,y3, dword ptr [esi+4* 1],004C006BAh
	FF_5	y1,y0,y7,y6,y5,y4,y3,y2, dword ptr [esi+4*25],0C1A94FB6h
	FF_5	y0,y7,y6,y5,y4,y3,y2,y1, dword ptr [esi+4*15],0409F60C4h

ENDIF
	mov	edx, dword ptr [edi + 0]
	mov	ecx, dword ptr [edi + 4]
	mov	ebx, dword ptr [edi + 8]
	mov	eax, dword ptr [edi +12]

	add	edx, dword ptr [_hash_0]
	add	ecx, dword ptr [_hash_1]
	add	ebx, dword ptr [_hash_2]
	add	eax, dword ptr [_hash_3]

	mov	dword ptr [_hash_0], edx
	mov	dword ptr [_hash_1], ecx
	mov	dword ptr [_hash_2], ebx
	mov	dword ptr [_hash_3], eax

	mov	dword ptr [edi + 0], edx
	mov	dword ptr [edi + 4], ecx
	mov	dword ptr [edi + 8], ebx
	mov	dword ptr [edi +12], eax

	mov	edx, dword ptr [edi +16]
	mov	ecx, dword ptr [edi +20]
	mov	ebx, dword ptr [edi +24]
	mov	eax, dword ptr [edi +28]

	add	edx, dword ptr [_hash_4]
	add	ecx, dword ptr [_hash_5]
	add	ebx, dword ptr [_hash_6]
	add	eax, dword ptr [_hash_7]

	mov	dword ptr [_hash_4], edx
	mov	dword ptr [_hash_5], ecx
	mov	dword ptr [_hash_6], ebx
	mov	dword ptr [_hash_7], eax

	mov	dword ptr [edi +16], edx
	mov	dword ptr [edi +20], ecx
	mov	dword ptr [edi +24], ebx
	mov	dword ptr [edi +28], eax

	sub	dword ptr [_count], 128
	add	esi, 128
	jmp	@@HAVAL_Loop

@@HAVAL_POF:
	cmp	byte ptr [_flag], 0
	jz	@@Finishing

;padding
	mov	ecx, dword ptr [_count]
	mov	byte ptr  [_flag] , 0
	mov	dword ptr [_count], 128
	mov	eax, ecx
	mov	edi, offset _temp_bufor

	test	eax, eax
	jz	@@only_null
	
@@:
	mov	bl, byte ptr [esi+ecx-1]
	mov	byte ptr [edi+ecx-1], bl
	dec	ecx
	jnz	@B

	add	edi, eax

@@only_null:
	mov	byte ptr [edi], 80h
	mov	ecx, eax
	inc	edi

	sub	ecx, 117
	neg	ecx
	jz	@@save_size_in_pad
	jns	@F

	add	dword ptr [_count], 128
	add	ecx, 128

@@:
	xor	al, al
	cld
	rep	stosb

@@save_size_in_pad:

	MAKE_HAVAL_MAGIC

	add	edi, 2

	xor	edx, edx
	mov	eax, dword ptr [_size]

	mov	ebx, 8
	mul	ebx

	mov	dword ptr [edi], eax
	mov	dword ptr [edi+4], edx
	mov	esi, offset _temp_bufor
	mov	edi, offset _temp_hash_0
	jmp	@@HAVAL_Loop

@@Finishing:

IFE	(FPTLEN - 128)

	mov	esi, ptrOut
	mov	cx, word ptr [edi + 27]
	mov	dl, byte ptr [edi + 29]
	shl	ecx, 16
	shl	edx, 16
	mov	ch, byte ptr [edi + 22]
	mov	dx, word ptr [edi + 23]
	mov	cl, byte ptr [edi + 17]
	shl	edx, 8
	add	ecx, dword ptr [edi]
	mov	dl, byte ptr [edi + 18]
	mov	dword ptr [esi + 0], ecx
	mov	al, byte ptr [edi + 25]
	mov	bl, byte ptr [edi + 26]
	add	edx, dword ptr [edi + 4]
	mov	bh, byte ptr [edi + 31]
	mov	ah, byte ptr [edi + 30]
	mov	dword ptr [esi + 4], edx
	shl	ebx, 16	
	shl	eax, 16
	mov	bl, byte ptr [edi + 16]
	mov	ax, word ptr [edi + 19]
	mov	bh, byte ptr [edi + 21]
	add	eax, dword ptr [edi + 8]
	add	ebx, dword ptr [edi + 12]
	mov	dword ptr [esi + 8], eax
	mov	dword ptr [esi +12], ebx

ENDIF

IFE	(FPTLEN - 160)

	mov	eax, dword ptr [edi + 7*4]
	mov	ebx, dword ptr [edi + 6*4]
	and	eax, 0FE000000h
	and	ebx, 001F80000h
	mov	ecx, dword ptr [edi + 5*4]
	or	eax, ebx
	and	ecx, 00007F000h
	mov	edx, dword ptr [edi + 7*4]	;[7]
	or	eax, ecx
	mov	ebx, dword ptr [edi + 6*4]	;[6]
	shr	eax, 12
	mov	ecx, dword ptr [edi + 5*4]	;[5]
	add	dword ptr [edi + 4*4], eax
	and	edx, 001F80000h
	mov	eax, ecx			;[5]
	and	ebx, 00007F000h
	and	ecx, 000000FC0h
	or	edx, ebx
	and	eax, 00000003Fh
	or	edx, ecx
	mov	ebx, dword ptr [edi + 6*4]	;[6]
	shr	edx, 6
	mov	ecx, dword ptr [edi + 7*4]	;[7]
	and	ebx, 000000FC0h
	add	dword ptr [edi + 3*4], edx
	and	ecx, 00007F000h
	or	eax, ebx
	mov	edx, dword ptr [edi + 7*4]	;[7]
	or	eax, ecx
	mov	ebx, dword ptr [edi + 6*4]	;[6]
	add	dword ptr [edi + 2*4], eax
	mov	ecx, dword ptr [edi + 5*4]	;[5]
	mov	eax, ebx			;[6]
	and	edx, 000000FC0h
	and	ebx, 00000003Fh
	and	ecx, 0FE000000h
	or	edx, ebx
	and	eax, 0FE000000h
	or	edx, ecx
	mov	ebx, dword ptr [edi + 5*4]	;[5]
	mov	ecx, dword ptr [edi + 7*4]	;[7]
	and	ebx, 001F80000h
	and	ecx, 00000003Fh
	or	eax, ebx
	ror	edx, 25
	or	eax, ecx
	add	dword ptr [edi + 1*4], edx
	ror	eax, 19
	add	dword ptr [edi], eax

	mov	esi, ptrOut
	mov	ecx, 5
	xchg	esi, edi
	cld
	rep	movsd
ENDIF

IFE	(FPTLEN - 192)
	mov	eax, dword ptr [edi + 28]
	mov	ebx, dword ptr [edi + 24]
	mov	ecx, eax
	mov	edx, ebx
	and	eax, 0FC000000h
	and	ebx, 03E00000h
	and	ecx, 03E00000h
	or	eax, ebx
	and	edx, 001F0000h
	mov	ebx, dword ptr [edi + 24]	;[6]
	shr	eax, 21
	or	ecx, edx
	add	dword ptr [edi + 20], eax
	mov	edx, dword ptr [edi + 28]	;[7]
	shr	ecx, 16
	and	ebx, 0000FC00h
	mov	eax, edx			;[7]
	add	dword ptr [edi + 16], ecx
	and	edx, 001F0000h
	mov	ecx, dword ptr [edi + 24]	;[6]
	or	ebx, edx
	and	ecx, 000003E0h
	mov	edx, eax			;[7]
	shr	ebx, 10
	and	eax, 0000FC00h
	add	dword ptr [edi + 12], ebx
	or	eax, ecx
	mov	ebx, dword ptr [edi + 24]	;[6]
	shr	eax, 5
	and	edx, 000003E0h
	mov	ecx, ebx			;[6]
	add	dword ptr [edi + 8], eax
	and	ebx, 0000001Fh
	mov	eax, dword ptr [edi + 28]
	and	ecx, 0FC000000h
	and	eax, 0000001Fh
	or	edx, ebx
	or	eax, ecx
	add	dword ptr [edi + 4], edx
	ror	eax, 26
	add	dword ptr [edi], eax

	mov	esi, ptrOut
	mov	ecx, 6
	xchg	esi, edi
	cld
	rep	movsd
ENDIF

IFE	(FPTLEN - 224)

	mov	eax, dword ptr [edi + 28]
	mov	ebx, eax
	mov	ecx, eax
	and	ebx, 0Fh
	mov	edx, eax
	add	dword ptr [edi + 24], ebx

	shr	ecx, 4
	mov	ebx, eax
	shr	edx, 9
	and	ecx, 1Fh
	shr	ebx, 13
	add	dword ptr [edi + 20], ecx
	and	edx, 0Fh
	and	ebx, 1Fh
	mov	ecx, eax
	add	dword ptr [edi + 16], edx
	shr	ecx, 18
	add	dword ptr [edi + 12], ebx
	mov	edx, eax
	and	ecx, 0Fh
	shr	edx, 22
	add	dword ptr [edi + 8], ecx
	shr	eax, 27
	and	edx, 1Fh
	and	eax, 1Fh
	add	dword ptr [edi + 4], edx
	add	dword ptr [edi], eax

	mov	esi, ptrOut
	mov	ecx, 7
	xchg	esi, edi
	cld
	rep	movsd
ENDIF

IFE	(FPTLEN - 256)

	mov	esi, ptrOut
	mov	ecx, 8
	xchg	esi, edi
	cld
	rep	movsd

ENDIF

	mov	edi, offset _hash_0
	mov	ecx, 83
	xor	eax, eax
	cld
	rep	stosd				;clear mem

	popad
	ret

d2k2_crackme08_hash		endp
end