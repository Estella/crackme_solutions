.686p
.mmx                        ; enable MMX instructions
.xmm                        ; enable SSE instructions
.model flat, stdcall
option casemap:none

EXTERN d2k2_magic1:DWORD

.data 

haval_flag1 db 0
haval_inputbuflen dd 0
haval_dw2 dd 0
haval_buf db 70h dup(0)
haval_buf2 db 70h dup(0)
haval_buf3 db 70h dup(0)


vaclav  dd 0
.data?

.code

option prologue:none
option epilogue:none




; Source: d2k2_crackme_06.exe (base 0x00400000 - 4194304)


; Source: d2k2_crackme_06.exe (base 0x00400000 - 4194304)


; Start of selected range: 0x0040425E
d2k2_crackme06_unknown64bhash PROC x:DWORD,y:DWORD,z:DWORD
pushad 
mov ecx,dword ptr [esp+28h]
mov esi,dword ptr [esp+2Ch]
mov dword ptr [40668Ch],ecx
mov byte ptr [4066B0h],1h
mov dword ptr [406690h],ecx
mov dword ptr [406694h],esp
mov dword ptr [4066ACh],esi
xor edx,edx
xor ebp,ebp

LABEL_0x0040428A:
mov esi,dword ptr [4066ACh]
cmp dword ptr [406690h],8h
jb LABEL_0x00404348 ; => 0x00404348
mov eax,dword ptr [esi]
mov ebx,dword ptr [esi+4h]
mov dword ptr [406698h],40h

LABEL_0x004042AC:
mov ecx,ebp
mov edi,eax
rol edi,cl
mov esp,ebx
mov ecx,edx
shr ecx,1Bh
rol esp,cl
add edi,esp
mov esp,ebp
mov ecx,eax
shr ecx,1Bh
rol esp,cl
mov ecx,ebx
mov esi,edx
rol esi,cl
add esi,esp
xor edi,esi
mov eax,edi
add eax,3F3C6092h
xchg ebx,eax
xchg edx,ebx
xchg ebp,edx
mov ecx,edx
mov edi,eax
rol edi,cl
mov esp,ebx
mov ecx,ebp
shr ecx,1Bh
rol esp,cl
xor edi,esp
mov ecx,eax
mov esp,edx
rol esp,cl
add edi,esp
mov esp,ebp
mov ecx,ebx
shr ecx,1Bh
rol esp,cl
add edi,esp
mov eax,edi
DB 69h, 0C0h, 0C3h, 0C0h, 71h, 0AAh
xchg ebx,eax
xchg edx,ebx
xchg ebp,edx
dec dword ptr [406698h]
jne LABEL_0x004042AC ; => 0x004042AC
mov ecx,ebp
mov esp,eax
rol esp,cl
mov ecx,edx
shr ecx,1Bh
mov esi,ebx
rol esi,cl
add esp,esi
mov ecx,eax
shr ecx,1Bh
rol edx,cl
mov ecx,ebx
rol ebp,cl
xor ebp,edx
mov edx,esp
sub dword ptr [406690h],8h
add dword ptr [4066ACh],8h
jmp LABEL_0x0040428A ; => 0x0040428A

LABEL_0x00404348:
cmp byte ptr [4066B0h],0h
je LABEL_0x004043B6 ; => 0x004043B6
mov ecx,dword ptr [406690h]
and byte ptr [4066B0h],0h
mov dword ptr [406690h],8h
mov eax,ecx
mov edi,40669Ch
test eax,eax
je LABEL_0x00404380 ; => 0x00404380

LABEL_0x00404373:
mov bl,byte ptr [ecx+esi-1h]
mov byte ptr [ecx+edi-1h],bl
dec ecx
jne LABEL_0x00404373 ; => 0x00404373
add edi,eax

LABEL_0x00404380:
mov ecx,dword ptr [40668Ch]
mov dword ptr [edi],ecx
mov ecx,eax
add edi,4h
sub ecx,4h
neg ecx
je LABEL_0x004043A7 ; => 0x004043A7
jns LABEL_0x004043A0 ; => 0x004043A0
add dword ptr [406690h],8h
add ecx,8h

LABEL_0x004043A0:
dec ecx
mov byte ptr [ecx+edi],0FFh
jne LABEL_0x004043A0 ; => 0x004043A0

LABEL_0x004043A7:
mov dword ptr [4066ACh],40669Ch
jmp LABEL_0x0040428A ; => 0x0040428A

LABEL_0x004043B6:
mov esp,dword ptr [406694h]
mov eax,dword ptr [esp+24h]
mov dword ptr [eax],edx
mov dword ptr [eax+4h],ebp
mov edi,40668Ch
xor eax,eax
mov ecx,0Ah
cld 
rep stosd 
popad 
ret 0Ch
; Finish of selected range: 0x004043D7

d2k2_crackme06_unknown64bhash endp



; Start of selected range: 0x00401000
d2k2_crackme06_unknown128bhash PROC x:DWORD,y:DWORD,z:DWORD
unknown128bhash:
push ebp
mov ebp,esp
add esp,0FFFFFFF0h
push eax
push ebx
push ecx
push edx
push edi
push esi
mov edi,dword ptr [ebp+08h]
mov eax,dword ptr [ebp+0Ch]
inc eax
add edi,eax
mov byte ptr [edi-1],80h
xor edx,edx
mov ebx,40h
div ebx
neg edx
add edx,40h
cmp edx,8h
jae LABEL_0x0040102F ; => 0x0040102F
add edx,40h

LABEL_0x0040102F:
mov ecx,edx
xor al,al
rep stosb 
mov eax,dword ptr [ebp+0Ch]
inc edx
add dword ptr [ebp+0Ch],edx
xor edx,edx
mov ebx,8h
mul ebx
mov dword ptr [edi-8h],eax
mov dword ptr [edi-4h],edx
mov edx,dword ptr [ebp+0Ch]
mov edi,dword ptr [ebp+8h]
mov esi,dword ptr [ebp+10h]
push eax
mov eax,dword ptr [d2k2_magic1]
mov dword ptr [esi],eax
xor eax,1020405h
mov dword ptr [esi+4h],eax
sub eax,2004h
mov dword ptr [esi+8h],eax
bswap eax
mov dword ptr [esi+0Ch],eax
pop eax

LABEL_0x00401072:
mov eax,dword ptr [esi]
mov dword ptr [ebp-4h],eax
mov eax,dword ptr [esi+4h]
mov dword ptr [ebp-8h],eax
mov eax,dword ptr [esi+8h]
mov dword ptr [ebp-0Ch],eax
mov eax,dword ptr [esi+0Ch]
mov dword ptr [ebp-10h],eax
mov eax,dword ptr [ebp-8h]
mov ebx,dword ptr [ebp-0Ch]
mov ecx,dword ptr [ebp-10h]
and ebx,eax
not eax
and eax,ecx
or eax,ebx
add eax,dword ptr [ebp-4h]
add eax,dword ptr [edi]
add eax,176AC478h
mov cl,7h
rol eax,cl
add eax,dword ptr [ebp-8h]
mov dword ptr [ebp-4h],eax
mov eax,dword ptr [ebp-4h]
mov ebx,dword ptr [ebp-8h]
mov ecx,dword ptr [ebp-0Ch]
and ebx,eax
not eax
and eax,ecx
or eax,ebx
add eax,dword ptr [ebp-10h]
add eax,dword ptr [edi+4h]
add eax,0E8C7B756h
mov cl,0Ch
rol eax,cl
add eax,dword ptr [ebp-4h]
mov dword ptr [ebp-10h],eax
mov eax,dword ptr [ebp-10h]
mov ebx,dword ptr [ebp-4h]
mov ecx,dword ptr [ebp-8h]
and ebx,eax
not eax
and eax,ecx
or eax,ebx
add eax,dword ptr [ebp-0Ch]
add eax,dword ptr [edi+8h]
add eax,242070DBh
mov cl,11h
rol eax,cl
add eax,dword ptr [ebp-10h]
mov dword ptr [ebp-0Ch],eax
mov eax,dword ptr [ebp-0Ch]
mov ebx,dword ptr [ebp-10h]
mov ecx,dword ptr [ebp-4h]
and ebx,eax
not eax
and eax,ecx
or eax,ebx
add eax,dword ptr [ebp-8h]
add eax,dword ptr [edi+0Ch]
add eax,0C1BDCEEEh
mov cl,16h
rol eax,cl
add eax,dword ptr [ebp-0Ch]
mov dword ptr [ebp-8h],eax
mov eax,dword ptr [ebp-8h]
mov ebx,dword ptr [ebp-0Ch]
mov ecx,dword ptr [ebp-10h]
and ebx,eax
not eax
and eax,ecx
or eax,ebx
add eax,dword ptr [ebp-4h]
add eax,dword ptr [edi+10h]
add eax,0F57C0FAFh
mov cl,7h
rol eax,cl
add eax,dword ptr [ebp-8h]
mov dword ptr [ebp-4h],eax
mov eax,dword ptr [ebp-4h]
mov ebx,dword ptr [ebp-8h]
mov ecx,dword ptr [ebp-0Ch]
and ebx,eax
not eax
and eax,ecx
or eax,ebx
add eax,dword ptr [ebp-10h]
add eax,dword ptr [edi+14h]
add eax,4787C62Ah
mov cl,0Ch
rol eax,cl
add eax,dword ptr [ebp-4h]
mov dword ptr [ebp-10h],eax
mov eax,dword ptr [ebp-10h]
mov ebx,dword ptr [ebp-4h]
mov ecx,dword ptr [ebp-8h]
and ebx,eax
not eax
and eax,ecx
or eax,ebx
add eax,dword ptr [ebp-0Ch]
add eax,dword ptr [edi+18h]
add eax,0A8306613h
mov cl,11h
rol eax,cl
add eax,dword ptr [ebp-10h]
mov dword ptr [ebp-0Ch],eax
mov eax,dword ptr [ebp-0Ch]
mov ebx,dword ptr [ebp-10h]
mov ecx,dword ptr [ebp-4h]
and ebx,eax
not eax
and eax,ecx
or eax,ebx
add eax,dword ptr [ebp-8h]
add eax,dword ptr [edi+1Ch]
add eax,0FD469571h
mov cl,16h
rol eax,cl
add eax,dword ptr [ebp-0Ch]
mov dword ptr [ebp-8h],eax
mov eax,dword ptr [ebp-8h]
mov ebx,dword ptr [ebp-0Ch]
mov ecx,dword ptr [ebp-10h]
and ebx,eax
not eax
and eax,ecx
or eax,ebx
add eax,dword ptr [ebp-4h]
add eax,dword ptr [edi+20h]
add eax,698C98D8h
mov cl,7h
rol eax,cl
add eax,dword ptr [ebp-8h]
mov dword ptr [ebp-4h],eax
mov eax,dword ptr [ebp-4h]
mov ebx,dword ptr [ebp-8h]
mov ecx,dword ptr [ebp-0Ch]
and ebx,eax
not eax
and eax,ecx
or eax,ebx
add eax,dword ptr [ebp-10h]
add eax,dword ptr [edi+24h]
add eax,8B44F7AFh
mov cl,0Ch
rol eax,cl
add eax,dword ptr [ebp-4h]
mov dword ptr [ebp-10h],eax
mov eax,dword ptr [ebp-10h]
mov ebx,dword ptr [ebp-4h]
mov ecx,dword ptr [ebp-8h]
and ebx,eax
not eax
and eax,ecx
or eax,ebx
add eax,dword ptr [ebp-0Ch]
add eax,dword ptr [edi+28h]
add eax,0FFFF5BB1h
mov cl,11h
rol eax,cl
add eax,dword ptr [ebp-10h]
mov dword ptr [ebp-0Ch],eax
mov eax,dword ptr [ebp-0Ch]
mov ebx,dword ptr [ebp-10h]
mov ecx,dword ptr [ebp-4h]
and ebx,eax
not eax
and eax,ecx
or eax,ebx
add eax,dword ptr [ebp-8h]
add eax,dword ptr [edi+2Ch]
add eax,895CD7BEh
mov cl,16h
rol eax,cl
add eax,dword ptr [ebp-0Ch]
mov dword ptr [ebp-8h],eax
mov eax,dword ptr [ebp-8h]
mov ebx,dword ptr [ebp-0Ch]
mov ecx,dword ptr [ebp-10h]
and ebx,eax
not eax
and eax,ecx
or eax,ebx
add eax,dword ptr [ebp-4h]
add eax,dword ptr [edi+30h]
add eax,6B901122h
mov cl,7h
rol eax,cl
add eax,dword ptr [ebp-8h]
mov dword ptr [ebp-4h],eax
mov eax,dword ptr [ebp-4h]
mov ebx,dword ptr [ebp-8h]
mov ecx,dword ptr [ebp-0Ch]
and ebx,eax
not eax
and eax,ecx
or eax,ebx
add eax,dword ptr [ebp-10h]
add eax,dword ptr [edi+34h]
add eax,0FD987393h
mov cl,0Ch
rol eax,cl
add eax,dword ptr [ebp-4h]
mov dword ptr [ebp-10h],eax
mov eax,dword ptr [ebp-10h]
mov ebx,dword ptr [ebp-4h]
mov ecx,dword ptr [ebp-8h]
and ebx,eax
not eax
and eax,ecx
or eax,ebx
add eax,dword ptr [ebp-0Ch]
add eax,dword ptr [edi+38h]
add eax,0A679438Eh
mov cl,11h
rol eax,cl
add eax,dword ptr [ebp-10h]
mov dword ptr [ebp-0Ch],eax
mov eax,dword ptr [ebp-0Ch]
mov ebx,dword ptr [ebp-10h]
mov ecx,dword ptr [ebp-4h]
and ebx,eax
not eax
and eax,ecx
or eax,ebx
add eax,dword ptr [ebp-8h]
add eax,dword ptr [edi+3Ch]
add eax,49B40821h
mov cl,16h
rol eax,cl
add eax,dword ptr [ebp-0Ch]
mov dword ptr [ebp-8h],eax
mov eax,dword ptr [ebp-8h]
mov ebx,dword ptr [ebp-0Ch]
mov ecx,dword ptr [ebp-10h]
and eax,ecx
not ecx
and ecx,ebx
or eax,ecx
add eax,dword ptr [ebp-4h]
add eax,dword ptr [edi+4h]
add eax,0F61E2562h
mov cl,5h
rol eax,cl
add eax,dword ptr [ebp-8h]
mov dword ptr [ebp-4h],eax
mov eax,dword ptr [ebp-4h]
mov ebx,dword ptr [ebp-8h]
mov ecx,dword ptr [ebp-0Ch]
and eax,ecx
not ecx
and ecx,ebx
or eax,ecx
add eax,dword ptr [ebp-10h]
add eax,dword ptr [edi+18h]
add eax,0C040B340h
mov cl,9h
rol eax,cl
add eax,dword ptr [ebp-4h]
mov dword ptr [ebp-10h],eax
mov eax,dword ptr [ebp-10h]
mov ebx,dword ptr [ebp-4h]
mov ecx,dword ptr [ebp-8h]
and eax,ecx
not ecx
and ecx,ebx
or eax,ecx
add eax,dword ptr [ebp-0Ch]
add eax,dword ptr [edi+2Ch]
add eax,265E5A51h
mov cl,0Eh
rol eax,cl
add eax,dword ptr [ebp-10h]
mov dword ptr [ebp-0Ch],eax
mov eax,dword ptr [ebp-0Ch]
mov ebx,dword ptr [ebp-10h]
mov ecx,dword ptr [ebp-4h]
and eax,ecx
not ecx
and ecx,ebx
or eax,ecx
add eax,dword ptr [ebp-8h]
add eax,dword ptr [edi]
add eax,0E9B6C7AAh
mov cl,14h
rol eax,cl
add eax,dword ptr [ebp-0Ch]
mov dword ptr [ebp-8h],eax
mov eax,dword ptr [ebp-8h]
mov ebx,dword ptr [ebp-0Ch]
mov ecx,dword ptr [ebp-10h]
and eax,ecx
not ecx
and ecx,ebx
or eax,ecx
add eax,dword ptr [ebp-4h]
add eax,dword ptr [edi+14h]
add eax,0D62F105Dh
mov cl,5h
rol eax,cl
add eax,dword ptr [ebp-8h]
mov dword ptr [ebp-4h],eax
mov eax,dword ptr [ebp-4h]
mov ebx,dword ptr [ebp-8h]
mov ecx,dword ptr [ebp-0Ch]
and eax,ecx
not ecx
and ecx,ebx
or eax,ecx
add eax,dword ptr [ebp-10h]
add eax,dword ptr [edi+28h]
add eax,24C1453h
mov cl,9h
rol eax,cl
add eax,dword ptr [ebp-4h]
mov dword ptr [ebp-10h],eax
mov eax,dword ptr [ebp-10h]
mov ebx,dword ptr [ebp-4h]
mov ecx,dword ptr [ebp-8h]
and eax,ecx
not ecx
and ecx,ebx
or eax,ecx
add eax,dword ptr [ebp-0Ch]
add eax,dword ptr [edi+3Ch]
add eax,0D8A13681h
mov cl,0Eh
rol eax,cl
add eax,dword ptr [ebp-10h]
mov dword ptr [ebp-0Ch],eax
mov eax,dword ptr [ebp-0Ch]
mov ebx,dword ptr [ebp-10h]
mov ecx,dword ptr [ebp-4h]
and eax,ecx
not ecx
and ecx,ebx
or eax,ecx
add eax,dword ptr [ebp-8h]
add eax,dword ptr [edi+10h]
add eax,0E7D3FBC8h
mov cl,14h
rol eax,cl
add eax,dword ptr [ebp-0Ch]
mov dword ptr [ebp-8h],eax
mov eax,dword ptr [ebp-8h]
mov ebx,dword ptr [ebp-0Ch]
mov ecx,dword ptr [ebp-10h]
and eax,ecx
not ecx
and ecx,ebx
or eax,ecx
add eax,dword ptr [ebp-4h]
add eax,dword ptr [edi+24h]
add eax,21E1CDE6h
mov cl,5h
rol eax,cl
add eax,dword ptr [ebp-8h]
mov dword ptr [ebp-4h],eax
mov eax,dword ptr [ebp-4h]
mov ebx,dword ptr [ebp-8h]
mov ecx,dword ptr [ebp-0Ch]
and eax,ecx
not ecx
and ecx,ebx
or eax,ecx
add eax,dword ptr [ebp-10h]
add eax,dword ptr [edi+38h]
add eax,0C33707D6h
mov cl,9h
rol eax,cl
add eax,dword ptr [ebp-4h]
mov dword ptr [ebp-10h],eax
mov eax,dword ptr [ebp-10h]
mov ebx,dword ptr [ebp-4h]
mov ecx,dword ptr [ebp-8h]
and eax,ecx
not ecx
and ecx,ebx
or eax,ecx
add eax,dword ptr [ebp-0Ch]
add eax,dword ptr [edi+0Ch]
add eax,0F4D50D87h
mov cl,0Eh
rol eax,cl
add eax,dword ptr [ebp-10h]
mov dword ptr [ebp-0Ch],eax
mov eax,dword ptr [ebp-0Ch]
mov ebx,dword ptr [ebp-10h]
mov ecx,dword ptr [ebp-4h]
and eax,ecx
not ecx
and ecx,ebx
or eax,ecx
add eax,dword ptr [ebp-8h]
add eax,dword ptr [edi+20h]
add eax,455A34EDh
mov cl,14h
rol eax,cl
add eax,dword ptr [ebp-0Ch]
mov dword ptr [ebp-8h],eax
mov eax,dword ptr [ebp-8h]
mov ebx,dword ptr [ebp-0Ch]
mov ecx,dword ptr [ebp-10h]
and eax,ecx
not ecx
and ecx,ebx
or eax,ecx
add eax,dword ptr [ebp-4h]
add eax,dword ptr [edi+34h]
add eax,0A9E3E905h
mov cl,5h
rol eax,cl
add eax,dword ptr [ebp-8h]
mov dword ptr [ebp-4h],eax
mov eax,dword ptr [ebp-4h]
mov ebx,dword ptr [ebp-8h]
mov ecx,dword ptr [ebp-0Ch]
and eax,ecx
not ecx
and ecx,ebx
or eax,ecx
add eax,dword ptr [ebp-10h]
add eax,dword ptr [edi+8h]
add eax,0FCE4A3F8h
mov cl,9h
rol eax,cl
add eax,dword ptr [ebp-4h]
mov dword ptr [ebp-10h],eax
mov eax,dword ptr [ebp-10h]
mov ebx,dword ptr [ebp-4h]
mov ecx,dword ptr [ebp-8h]
and eax,ecx
not ecx
and ecx,ebx
or eax,ecx
add eax,dword ptr [ebp-0Ch]
add eax,dword ptr [edi+1Ch]
add eax,676E02D9h
mov cl,0Eh
rol eax,cl
add eax,dword ptr [ebp-10h]
mov dword ptr [ebp-0Ch],eax
mov eax,dword ptr [ebp-0Ch]
mov ebx,dword ptr [ebp-10h]
mov ecx,dword ptr [ebp-4h]
and eax,ecx
not ecx
and ecx,ebx
or eax,ecx
add eax,dword ptr [ebp-8h]
add eax,dword ptr [edi+30h]
add eax,8D2A4C8Ah
mov cl,14h
rol eax,cl
add eax,dword ptr [ebp-0Ch]
mov dword ptr [ebp-8h],eax
mov eax,dword ptr [ebp-8h]
mov ebx,dword ptr [ebp-0Ch]
mov ecx,dword ptr [ebp-10h]
xor eax,ebx
xor eax,ecx
add eax,dword ptr [ebp-4h]
add eax,dword ptr [edi+14h]
add eax,0FFFA3942h
mov cl,4h
rol eax,cl
add eax,dword ptr [ebp-8h]
mov dword ptr [ebp-4h],eax
mov eax,dword ptr [ebp-4h]
mov ebx,dword ptr [ebp-8h]
mov ecx,dword ptr [ebp-0Ch]
xor eax,ebx
xor eax,ecx
add eax,dword ptr [ebp-10h]
add eax,dword ptr [edi+20h]
add eax,8771F681h
mov cl,0Bh
rol eax,cl
add eax,dword ptr [ebp-4h]
mov dword ptr [ebp-10h],eax
mov eax,dword ptr [ebp-10h]
mov ebx,dword ptr [ebp-4h]
mov ecx,dword ptr [ebp-8h]
xor eax,ebx
xor eax,ecx
add eax,dword ptr [ebp-0Ch]
add eax,dword ptr [edi+2Ch]
add eax,6D9D6122h
mov cl,10h
rol eax,cl
add eax,dword ptr [ebp-10h]
mov dword ptr [ebp-0Ch],eax
mov eax,dword ptr [ebp-0Ch]
mov ebx,dword ptr [ebp-10h]
mov ecx,dword ptr [ebp-4h]
xor eax,ebx
xor eax,ecx
add eax,dword ptr [ebp-8h]
add eax,dword ptr [edi+38h]
add eax,0FDE5380Ch
mov cl,17h
rol eax,cl
add eax,dword ptr [ebp-0Ch]
mov dword ptr [ebp-8h],eax
mov eax,dword ptr [ebp-8h]
mov ebx,dword ptr [ebp-0Ch]
mov ecx,dword ptr [ebp-10h]
xor eax,ebx
xor eax,ecx
add eax,dword ptr [ebp-4h]
add eax,dword ptr [edi+4h]
add eax,0A4BCEA44h
mov cl,4h
rol eax,cl
add eax,dword ptr [ebp-8h]
mov dword ptr [ebp-4h],eax
mov eax,dword ptr [ebp-4h]
mov ebx,dword ptr [ebp-8h]
mov ecx,dword ptr [ebp-0Ch]
xor eax,ebx
xor eax,ecx
add eax,dword ptr [ebp-10h]
add eax,dword ptr [edi+10h]
add eax,4BDECFA9h
mov cl,0Bh
rol eax,cl
add eax,dword ptr [ebp-4h]
mov dword ptr [ebp-10h],eax
mov eax,dword ptr [ebp-10h]
mov ebx,dword ptr [ebp-4h]
mov ecx,dword ptr [ebp-8h]
xor eax,ebx
xor eax,ecx
add eax,dword ptr [ebp-0Ch]
add eax,dword ptr [edi+1Ch]
add eax,0F6BB4B60h
mov cl,10h
rol eax,cl
add eax,dword ptr [ebp-10h]
mov dword ptr [ebp-0Ch],eax
mov eax,dword ptr [ebp-0Ch]
mov ebx,dword ptr [ebp-10h]
mov ecx,dword ptr [ebp-4h]
xor eax,ebx
xor eax,ecx
add eax,dword ptr [ebp-8h]
add eax,dword ptr [edi+28h]
add eax,0BEBFBC70h
mov cl,17h
rol eax,cl
add eax,dword ptr [ebp-0Ch]
mov dword ptr [ebp-8h],eax
mov eax,dword ptr [ebp-8h]
mov ebx,dword ptr [ebp-0Ch]
mov ecx,dword ptr [ebp-10h]
xor eax,ebx
xor eax,ecx
add eax,dword ptr [ebp-4h]
add eax,dword ptr [edi+34h]
add eax,279B7EC6h
mov cl,4h
rol eax,cl
add eax,dword ptr [ebp-8h]
mov dword ptr [ebp-4h],eax
mov eax,dword ptr [ebp-4h]
mov ebx,dword ptr [ebp-8h]
mov ecx,dword ptr [ebp-0Ch]
xor eax,ebx
xor eax,ecx
add eax,dword ptr [ebp-10h]
add eax,dword ptr [edi]
add eax,0EAA127FAh
mov cl,0Bh
rol eax,cl
add eax,dword ptr [ebp-4h]
mov dword ptr [ebp-10h],eax
mov eax,dword ptr [ebp-10h]
mov ebx,dword ptr [ebp-4h]
mov ecx,dword ptr [ebp-8h]
xor eax,ebx
xor eax,ecx
add eax,dword ptr [ebp-0Ch]
add eax,dword ptr [edi+0Ch]
add eax,0D4EF3085h
mov cl,10h
rol eax,cl
add eax,dword ptr [ebp-10h]
mov dword ptr [ebp-0Ch],eax
mov eax,dword ptr [ebp-0Ch]
mov ebx,dword ptr [ebp-10h]
mov ecx,dword ptr [ebp-4h]
xor eax,ebx
xor eax,ecx
add eax,dword ptr [ebp-8h]
add eax,dword ptr [edi+18h]
add eax,4881D05h
mov cl,17h
rol eax,cl
add eax,dword ptr [ebp-0Ch]
mov dword ptr [ebp-8h],eax
mov eax,dword ptr [ebp-8h]
mov ebx,dword ptr [ebp-0Ch]
mov ecx,dword ptr [ebp-10h]
xor eax,ebx
xor eax,ecx
add eax,dword ptr [ebp-4h]
add eax,dword ptr [edi+24h]
add eax,0D9D4D039h
mov cl,4h
rol eax,cl
add eax,dword ptr [ebp-8h]
mov dword ptr [ebp-4h],eax
mov eax,dword ptr [ebp-4h]
mov ebx,dword ptr [ebp-8h]
mov ecx,dword ptr [ebp-0Ch]
xor eax,ebx
xor eax,ecx
add eax,dword ptr [ebp-10h]
add eax,dword ptr [edi+30h]
add eax,0E6DB99E5h
mov cl,0Bh
rol eax,cl
add eax,dword ptr [ebp-4h]
mov dword ptr [ebp-10h],eax
mov eax,dword ptr [ebp-10h]
mov ebx,dword ptr [ebp-4h]
mov ecx,dword ptr [ebp-8h]
xor eax,ebx
xor eax,ecx
add eax,dword ptr [ebp-0Ch]
add eax,dword ptr [edi+3Ch]
add eax,1FA27CF8h
mov cl,10h
rol eax,cl
add eax,dword ptr [ebp-10h]
mov dword ptr [ebp-0Ch],eax
mov eax,dword ptr [ebp-0Ch]
mov ebx,dword ptr [ebp-10h]
mov ecx,dword ptr [ebp-4h]
xor eax,ebx
xor eax,ecx
add eax,dword ptr [ebp-8h]
add eax,dword ptr [edi+8h]
add eax,0C4AC5665h
mov cl,17h
rol eax,cl
add eax,dword ptr [ebp-0Ch]
mov dword ptr [ebp-8h],eax
mov eax,dword ptr [ebp-8h]
mov ebx,dword ptr [ebp-0Ch]
mov ecx,dword ptr [ebp-10h]
not ecx
or eax,ecx
xor eax,ebx
add eax,dword ptr [ebp-4h]
add eax,dword ptr [edi]
add eax,0F4292244h
mov cl,6h
rol eax,cl
add eax,dword ptr [ebp-8h]
mov dword ptr [ebp-4h],eax
mov eax,dword ptr [ebp-4h]
mov ebx,dword ptr [ebp-8h]
mov ecx,dword ptr [ebp-0Ch]
not ecx
or eax,ecx
xor eax,ebx
add eax,dword ptr [ebp-10h]
add eax,dword ptr [edi+1Ch]
add eax,432AFF97h
mov cl,0Ah
rol eax,cl
add eax,dword ptr [ebp-4h]
mov dword ptr [ebp-10h],eax
mov eax,dword ptr [ebp-10h]
mov ebx,dword ptr [ebp-4h]
mov ecx,dword ptr [ebp-8h]
not ecx
or eax,ecx
xor eax,ebx
add eax,dword ptr [ebp-0Ch]
add eax,dword ptr [edi+38h]
add eax,0AB9423A7h
mov cl,0Fh
rol eax,cl
add eax,dword ptr [ebp-10h]
mov dword ptr [ebp-0Ch],eax
mov eax,dword ptr [ebp-0Ch]
mov ebx,dword ptr [ebp-10h]
mov ecx,dword ptr [ebp-4h]
not ecx
or eax,ecx
xor eax,ebx
add eax,dword ptr [ebp-8h]
add eax,dword ptr [edi+14h]
add eax,0FC93A039h
mov cl,15h
rol eax,cl
add eax,dword ptr [ebp-0Ch]
mov dword ptr [ebp-8h],eax
mov eax,dword ptr [ebp-8h]
mov ebx,dword ptr [ebp-0Ch]
mov ecx,dword ptr [ebp-10h]
not ecx
or eax,ecx
xor eax,ebx
add eax,dword ptr [ebp-4h]
add eax,dword ptr [edi+30h]
add eax,65CB59C3h
mov cl,6h
rol eax,cl
add eax,dword ptr [ebp-8h]
mov dword ptr [ebp-4h],eax
mov eax,dword ptr [ebp-4h]
mov ebx,dword ptr [ebp-8h]
mov ecx,dword ptr [ebp-0Ch]
not ecx
or eax,ecx
xor eax,ebx
add eax,dword ptr [ebp-10h]
add eax,dword ptr [edi+0Ch]
add eax,8F0CCC92h
mov cl,0Ah
rol eax,cl
add eax,dword ptr [ebp-4h]
mov dword ptr [ebp-10h],eax
mov eax,dword ptr [ebp-10h]
mov ebx,dword ptr [ebp-4h]
mov ecx,dword ptr [ebp-8h]
not ecx
or eax,ecx
xor eax,ebx
add eax,dword ptr [ebp-0Ch]
add eax,dword ptr [edi+28h]
add eax,0FFEFF47Dh
mov cl,0Fh
rol eax,cl
add eax,dword ptr [ebp-10h]
mov dword ptr [ebp-0Ch],eax
mov eax,dword ptr [ebp-0Ch]
mov ebx,dword ptr [ebp-10h]
mov ecx,dword ptr [ebp-4h]
not ecx
or eax,ecx
xor eax,ebx
add eax,dword ptr [ebp-8h]
add eax,dword ptr [edi+4h]
add eax,85845DD1h
mov cl,15h
rol eax,cl
add eax,dword ptr [ebp-0Ch]
mov dword ptr [ebp-8h],eax
mov eax,dword ptr [ebp-8h]
mov ebx,dword ptr [ebp-0Ch]
mov ecx,dword ptr [ebp-10h]
not ecx
or eax,ecx
xor eax,ebx
add eax,dword ptr [ebp-4h]
add eax,dword ptr [edi+20h]
add eax,6FA87E4Fh
mov cl,6h
rol eax,cl
add eax,dword ptr [ebp-8h]
mov dword ptr [ebp-4h],eax
mov eax,dword ptr [ebp-4h]
mov ebx,dword ptr [ebp-8h]
mov ecx,dword ptr [ebp-0Ch]
not ecx
or eax,ecx
xor eax,ebx
add eax,dword ptr [ebp-10h]
add eax,dword ptr [edi+3Ch]
add eax,0FE2CE6E0h
mov cl,0Ah
rol eax,cl
add eax,dword ptr [ebp-4h]
mov dword ptr [ebp-10h],eax
mov eax,dword ptr [ebp-10h]
mov ebx,dword ptr [ebp-4h]
mov ecx,dword ptr [ebp-8h]
not ecx
or eax,ecx
xor eax,ebx
add eax,dword ptr [ebp-0Ch]
add eax,dword ptr [edi+18h]
add eax,0A3014314h
mov cl,0Fh
rol eax,cl
add eax,dword ptr [ebp-10h]
mov dword ptr [ebp-0Ch],eax
mov eax,dword ptr [ebp-0Ch]
mov ebx,dword ptr [ebp-10h]
mov ecx,dword ptr [ebp-4h]
not ecx
or eax,ecx
xor eax,ebx
add eax,dword ptr [ebp-8h]
add eax,dword ptr [edi+34h]
add eax,4E08C1A1h
mov cl,15h
rol eax,cl
add eax,dword ptr [ebp-0Ch]
mov dword ptr [ebp-8h],eax
mov eax,dword ptr [ebp-8h]
mov ebx,dword ptr [ebp-0Ch]
mov ecx,dword ptr [ebp-10h]
not ecx
or eax,ecx
xor eax,ebx
add eax,dword ptr [ebp-4h]
add eax,dword ptr [edi+10h]
add eax,0F7537EC2h
mov cl,6h
rol eax,cl
add eax,dword ptr [ebp-8h]
mov dword ptr [ebp-4h],eax
mov eax,dword ptr [ebp-4h]
mov ebx,dword ptr [ebp-8h]
mov ecx,dword ptr [ebp-0Ch]
not ecx
or eax,ecx
xor eax,ebx
add eax,dword ptr [ebp-10h]
add eax,dword ptr [edi+2Ch]
add eax,0BD3AF2C5h
mov cl,0Ah
rol eax,cl
add eax,dword ptr [ebp-4h]
mov dword ptr [ebp-10h],eax
mov eax,dword ptr [ebp-10h]
mov ebx,dword ptr [ebp-4h]
mov ecx,dword ptr [ebp-8h]
not ecx
or eax,ecx
xor eax,ebx
add eax,dword ptr [ebp-0Ch]
add eax,dword ptr [edi+8h]
add eax,2AC7D2BBh
mov cl,0Fh
rol eax,cl
add eax,dword ptr [ebp-10h]
mov dword ptr [ebp-0Ch],eax
mov eax,dword ptr [ebp-0Ch]
mov ebx,dword ptr [ebp-10h]
mov ecx,dword ptr [ebp-4h]
not ecx
or eax,ecx
xor eax,ebx
add eax,dword ptr [ebp-8h]
add eax,dword ptr [edi+24h]
add eax,1B87D391h
mov cl,15h
rol eax,cl
add eax,dword ptr [ebp-0Ch]
mov dword ptr [ebp-8h],eax
mov eax,dword ptr [ebp-4h]
add dword ptr [esi],eax
mov eax,dword ptr [ebp-8h]
add dword ptr [esi+4h],eax
mov eax,dword ptr [ebp-0Ch]
add dword ptr [esi+8h],eax
mov eax,dword ptr [ebp-10h]
add dword ptr [esi+0Ch],eax
add edi,40h
sub edx,40h
jne LABEL_0x00401072 ; => 0x00401072
mov ecx,4h

LABEL_0x004019CD:
mov eax,dword ptr [esi]
xchg ah,al
rol eax,10h
xchg ah,al
mov dword ptr [esi],eax
add esi,4h
loop LABEL_0x004019CD ; => 0x004019CD
pop esi
pop edi
pop edx
pop ecx
pop ebx
pop eax
leave 
ret 0Ch
; Finish of selected range: 0x004019E6
d2k2_crackme06_unknown128bhash ENDP





; Source: d2k2_crackme_06.exe (base 0x00400000 - 4194304)


; Start of selected range: 0x004019E7
d2k2_crackme06_haval PROC x:DWORD,y:DWORD,z:DWORD
; Source: d2k2_crackme_06.exe (base 0x00400000 - 4194304)


; Start of selected range: 0x004019E7

Haval_hash:
push ebp
mov ebp,esp
pushad 
mov ecx,dword ptr [ebp+0Ch]
mov esi,dword ptr [ebp+10h]
mov dword ptr [haval_inputbuflen],ecx
mov byte ptr [haval_flag1],1h
mov dword ptr [haval_dw2],ecx
mov edi,offset haval_buf2
mov dword ptr [haval_buf+0h],85A305D3h
mov dword ptr [haval_buf+4h],85A308D3h
mov dword ptr [haval_buf+8h],13198A2Eh
mov dword ptr [haval_buf+0Ch],3707344h
mov dword ptr [haval_buf+10h],0A4093822h
mov dword ptr [haval_buf+14h],299F31D0h
mov dword ptr [haval_buf+18h],82EFA98h
mov dword ptr [haval_buf+1Ch],0EC4E6C89h
mov dword ptr [edi],243F6A88h
mov dword ptr [edi+4h],85A308D3h
mov dword ptr [edi+8h],13198A2Eh
mov dword ptr [edi+0Ch],3707344h
mov dword ptr [edi+10h],0A4093822h
mov dword ptr [edi+14h],299F31D0h
mov dword ptr [edi+18h],82EFA98h
mov dword ptr [edi+1Ch],0EC4E6C89h

LABEL_0x00401A90:
cmp dword ptr [haval_dw2],80h
jb LABEL_0x00403D40 ; => 0x00403D40
mov ecx,dword ptr [edi]
mov eax,dword ptr [edi+18h]
and ecx,dword ptr [edi+0Ch]
mov ebx,dword ptr [edi+14h]
xor ecx,eax
and ebx,dword ptr [edi+10h]
xor eax,dword ptr [edi+4h]
xor ebx,ecx
and eax,dword ptr [edi+8h]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+1Ch],0Bh
add eax,dword ptr [esi]
add dword ptr [edi+1Ch],eax
mov ecx,dword ptr [edi+1Ch]
mov eax,dword ptr [edi+14h]
and ecx,dword ptr [edi+8h]
mov ebx,dword ptr [edi+10h]
xor ecx,eax
and ebx,dword ptr [edi+0Ch]
xor eax,dword ptr [edi]
xor ebx,ecx
and eax,dword ptr [edi+4h]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+18h],0Bh
add eax,dword ptr [esi+4h]
add dword ptr [edi+18h],eax
mov ecx,dword ptr [edi+18h]
mov eax,dword ptr [edi+10h]
and ecx,dword ptr [edi+4h]
mov ebx,dword ptr [edi+0Ch]
xor ecx,eax
and ebx,dword ptr [edi+8h]
xor eax,dword ptr [edi+1Ch]
xor ebx,ecx
and eax,dword ptr [edi]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+14h],0Bh
add eax,dword ptr [esi+8h]
add dword ptr [edi+14h],eax
mov ecx,dword ptr [edi+14h]
mov eax,dword ptr [edi+0Ch]
and ecx,dword ptr [edi]
mov ebx,dword ptr [edi+8h]
xor ecx,eax
and ebx,dword ptr [edi+4h]
xor eax,dword ptr [edi+18h]
xor ebx,ecx
and eax,dword ptr [edi+1Ch]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+10h],0Bh
add eax,dword ptr [esi+0Ch]
add dword ptr [edi+10h],eax
mov ecx,dword ptr [edi+10h]
mov eax,dword ptr [edi+8h]
and ecx,dword ptr [edi+1Ch]
mov ebx,dword ptr [edi+4h]
xor ecx,eax
and ebx,dword ptr [edi]
xor eax,dword ptr [edi+14h]
xor ebx,ecx
and eax,dword ptr [edi+18h]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+0Ch],0Bh
add eax,dword ptr [esi+10h]
add dword ptr [edi+0Ch],eax
mov ecx,dword ptr [edi+0Ch]
mov eax,dword ptr [edi+4h]
and ecx,dword ptr [edi+18h]
mov ebx,dword ptr [edi]
xor ecx,eax
and ebx,dword ptr [edi+1Ch]
xor eax,dword ptr [edi+10h]
xor ebx,ecx
and eax,dword ptr [edi+14h]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+8h],0Bh
add eax,dword ptr [esi+14h]
add dword ptr [edi+8h],eax
mov ecx,dword ptr [edi+8h]
mov eax,dword ptr [edi]
and ecx,dword ptr [edi+14h]
mov ebx,dword ptr [edi+1Ch]
xor ecx,eax
and ebx,dword ptr [edi+18h]
xor eax,dword ptr [edi+0Ch]
xor ebx,ecx
and eax,dword ptr [edi+10h]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+4h],0Bh
add eax,dword ptr [esi+18h]
add dword ptr [edi+4h],eax
mov ecx,dword ptr [edi+4h]
mov eax,dword ptr [edi+1Ch]
and ecx,dword ptr [edi+10h]
mov ebx,dword ptr [edi+18h]
xor ecx,eax
and ebx,dword ptr [edi+14h]
xor eax,dword ptr [edi+8h]
xor ebx,ecx
and eax,dword ptr [edi+0Ch]
xor eax,ebx
ror eax,7h
ror dword ptr [edi],0Bh
add eax,dword ptr [esi+1Ch]
add dword ptr [edi],eax
mov ecx,dword ptr [edi]
mov eax,dword ptr [edi+18h]
and ecx,dword ptr [edi+0Ch]
mov ebx,dword ptr [edi+14h]
xor ecx,eax
and ebx,dword ptr [edi+10h]
xor eax,dword ptr [edi+4h]
xor ebx,ecx
and eax,dword ptr [edi+8h]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+1Ch],0Bh
add eax,dword ptr [esi+20h]
add dword ptr [edi+1Ch],eax
mov ecx,dword ptr [edi+1Ch]
mov eax,dword ptr [edi+14h]
and ecx,dword ptr [edi+8h]
mov ebx,dword ptr [edi+10h]
xor ecx,eax
and ebx,dword ptr [edi+0Ch]
xor eax,dword ptr [edi]
xor ebx,ecx
and eax,dword ptr [edi+4h]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+18h],0Bh
add eax,dword ptr [esi+24h]
add dword ptr [edi+18h],eax
mov ecx,dword ptr [edi+18h]
mov eax,dword ptr [edi+10h]
and ecx,dword ptr [edi+4h]
mov ebx,dword ptr [edi+0Ch]
xor ecx,eax
and ebx,dword ptr [edi+8h]
xor eax,dword ptr [edi+1Ch]
xor ebx,ecx
and eax,dword ptr [edi]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+14h],0Bh
add eax,dword ptr [esi+28h]
add dword ptr [edi+14h],eax
mov ecx,dword ptr [edi+14h]
mov eax,dword ptr [edi+0Ch]
and ecx,dword ptr [edi]
mov ebx,dword ptr [edi+8h]
xor ecx,eax
and ebx,dword ptr [edi+4h]
xor eax,dword ptr [edi+18h]
xor ebx,ecx
and eax,dword ptr [edi+1Ch]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+10h],0Bh
add eax,dword ptr [esi+2Ch]
add dword ptr [edi+10h],eax
mov ecx,dword ptr [edi+10h]
mov eax,dword ptr [edi+8h]
and ecx,dword ptr [edi+1Ch]
mov ebx,dword ptr [edi+4h]
xor ecx,eax
and ebx,dword ptr [edi]
xor eax,dword ptr [edi+14h]
xor ebx,ecx
and eax,dword ptr [edi+18h]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+0Ch],0Bh
add eax,dword ptr [esi+30h]
add dword ptr [edi+0Ch],eax
mov ecx,dword ptr [edi+0Ch]
mov eax,dword ptr [edi+4h]
and ecx,dword ptr [edi+18h]
mov ebx,dword ptr [edi]
xor ecx,eax
and ebx,dword ptr [edi+1Ch]
xor eax,dword ptr [edi+10h]
xor ebx,ecx
and eax,dword ptr [edi+14h]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+8h],0Bh
add eax,dword ptr [esi+34h]
add dword ptr [edi+8h],eax
mov ecx,dword ptr [edi+8h]
mov eax,dword ptr [edi]
and ecx,dword ptr [edi+14h]
mov ebx,dword ptr [edi+1Ch]
xor ecx,eax
and ebx,dword ptr [edi+18h]
xor eax,dword ptr [edi+0Ch]
xor ebx,ecx
and eax,dword ptr [edi+10h]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+4h],0Bh
add eax,dword ptr [esi+38h]
add dword ptr [edi+4h],eax
mov ecx,dword ptr [edi+4h]
mov eax,dword ptr [edi+1Ch]
and ecx,dword ptr [edi+10h]
mov ebx,dword ptr [edi+18h]
xor ecx,eax
and ebx,dword ptr [edi+14h]
xor eax,dword ptr [edi+8h]
xor ebx,ecx
and eax,dword ptr [edi+0Ch]
xor eax,ebx
ror eax,7h
ror dword ptr [edi],0Bh
add eax,dword ptr [esi+3Ch]
add dword ptr [edi],eax
mov ecx,dword ptr [edi]
mov eax,dword ptr [edi+18h]
and ecx,dword ptr [edi+0Ch]
mov ebx,dword ptr [edi+14h]
xor ecx,eax
and ebx,dword ptr [edi+10h]
xor eax,dword ptr [edi+4h]
xor ebx,ecx
and eax,dword ptr [edi+8h]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+1Ch],0Bh
add eax,dword ptr [esi+40h]
add dword ptr [edi+1Ch],eax
mov ecx,dword ptr [edi+1Ch]
mov eax,dword ptr [edi+14h]
and ecx,dword ptr [edi+8h]
mov ebx,dword ptr [edi+10h]
xor ecx,eax
and ebx,dword ptr [edi+0Ch]
xor eax,dword ptr [edi]
xor ebx,ecx
and eax,dword ptr [edi+4h]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+18h],0Bh
add eax,dword ptr [esi+44h]
add dword ptr [edi+18h],eax
mov ecx,dword ptr [edi+18h]
mov eax,dword ptr [edi+10h]
and ecx,dword ptr [edi+4h]
mov ebx,dword ptr [edi+0Ch]
xor ecx,eax
and ebx,dword ptr [edi+8h]
xor eax,dword ptr [edi+1Ch]
xor ebx,ecx
and eax,dword ptr [edi]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+14h],0Bh
add eax,dword ptr [esi+48h]
add dword ptr [edi+14h],eax
mov ecx,dword ptr [edi+14h]
mov eax,dword ptr [edi+0Ch]
and ecx,dword ptr [edi]
mov ebx,dword ptr [edi+8h]
xor ecx,eax
and ebx,dword ptr [edi+4h]
xor eax,dword ptr [edi+18h]
xor ebx,ecx
and eax,dword ptr [edi+1Ch]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+10h],0Bh
add eax,dword ptr [esi+4Ch]
add dword ptr [edi+10h],eax
mov ecx,dword ptr [edi+10h]
mov eax,dword ptr [edi+8h]
and ecx,dword ptr [edi+1Ch]
mov ebx,dword ptr [edi+4h]
xor ecx,eax
and ebx,dword ptr [edi]
xor eax,dword ptr [edi+14h]
xor ebx,ecx
and eax,dword ptr [edi+18h]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+0Ch],0Bh
add eax,dword ptr [esi+50h]
add dword ptr [edi+0Ch],eax
mov ecx,dword ptr [edi+0Ch]
mov eax,dword ptr [edi+4h]
and ecx,dword ptr [edi+18h]
mov ebx,dword ptr [edi]
xor ecx,eax
and ebx,dword ptr [edi+1Ch]
xor eax,dword ptr [edi+10h]
xor ebx,ecx
and eax,dword ptr [edi+14h]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+8h],0Bh
add eax,dword ptr [esi+54h]
add dword ptr [edi+8h],eax
mov ecx,dword ptr [edi+8h]
mov eax,dword ptr [edi]
and ecx,dword ptr [edi+14h]
mov ebx,dword ptr [edi+1Ch]
xor ecx,eax
and ebx,dword ptr [edi+18h]
xor eax,dword ptr [edi+0Ch]
xor ebx,ecx
and eax,dword ptr [edi+10h]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+4h],0Bh
add eax,dword ptr [esi+58h]
add dword ptr [edi+4h],eax
mov ecx,dword ptr [edi+4h]
mov eax,dword ptr [edi+1Ch]
and ecx,dword ptr [edi+10h]
mov ebx,dword ptr [edi+18h]
xor ecx,eax
and ebx,dword ptr [edi+14h]
xor eax,dword ptr [edi+8h]
xor ebx,ecx
and eax,dword ptr [edi+0Ch]
xor eax,ebx
ror eax,7h
ror dword ptr [edi],0Bh
add eax,dword ptr [esi+5Ch]
add dword ptr [edi],eax
mov ecx,dword ptr [edi]
mov eax,dword ptr [edi+18h]
and ecx,dword ptr [edi+0Ch]
mov ebx,dword ptr [edi+14h]
xor ecx,eax
and ebx,dword ptr [edi+10h]
xor eax,dword ptr [edi+4h]
xor ebx,ecx
and eax,dword ptr [edi+8h]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+1Ch],0Bh
add eax,dword ptr [esi+60h]
add dword ptr [edi+1Ch],eax
mov ecx,dword ptr [edi+1Ch]
mov eax,dword ptr [edi+14h]
and ecx,dword ptr [edi+8h]
mov ebx,dword ptr [edi+10h]
xor ecx,eax
and ebx,dword ptr [edi+0Ch]
xor eax,dword ptr [edi]
xor ebx,ecx
and eax,dword ptr [edi+4h]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+18h],0Bh
add eax,dword ptr [esi+64h]
add dword ptr [edi+18h],eax
mov ecx,dword ptr [edi+18h]
mov eax,dword ptr [edi+10h]
and ecx,dword ptr [edi+4h]
mov ebx,dword ptr [edi+0Ch]
xor ecx,eax
and ebx,dword ptr [edi+8h]
xor eax,dword ptr [edi+1Ch]
xor ebx,ecx
and eax,dword ptr [edi]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+14h],0Bh
add eax,dword ptr [esi+68h]
add dword ptr [edi+14h],eax
mov ecx,dword ptr [edi+14h]
mov eax,dword ptr [edi+0Ch]
and ecx,dword ptr [edi]
mov ebx,dword ptr [edi+8h]
xor ecx,eax
and ebx,dword ptr [edi+4h]
xor eax,dword ptr [edi+18h]
xor ebx,ecx
and eax,dword ptr [edi+1Ch]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+10h],0Bh
add eax,dword ptr [esi+6Ch]
add dword ptr [edi+10h],eax
mov ecx,dword ptr [edi+10h]
mov eax,dword ptr [edi+8h]
and ecx,dword ptr [edi+1Ch]
mov ebx,dword ptr [edi+4h]
xor ecx,eax
and ebx,dword ptr [edi]
xor eax,dword ptr [edi+14h]
xor ebx,ecx
and eax,dword ptr [edi+18h]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+0Ch],0Bh
add eax,dword ptr [esi+70h]
add dword ptr [edi+0Ch],eax
mov ecx,dword ptr [edi+0Ch]
mov eax,dword ptr [edi+4h]
and ecx,dword ptr [edi+18h]
mov ebx,dword ptr [edi]
xor ecx,eax
and ebx,dword ptr [edi+1Ch]
xor eax,dword ptr [edi+10h]
xor ebx,ecx
and eax,dword ptr [edi+14h]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+8h],0Bh
add eax,dword ptr [esi+74h]
add dword ptr [edi+8h],eax
mov ecx,dword ptr [edi+8h]
mov eax,dword ptr [edi]
and ecx,dword ptr [edi+14h]
mov ebx,dword ptr [edi+1Ch]
xor ecx,eax
and ebx,dword ptr [edi+18h]
xor eax,dword ptr [edi+0Ch]
xor ebx,ecx
and eax,dword ptr [edi+10h]
xor eax,ebx
ror eax,7h
ror dword ptr [edi+4h],0Bh
add eax,dword ptr [esi+78h]
add dword ptr [edi+4h],eax
mov ecx,dword ptr [edi+4h]
mov eax,dword ptr [edi+1Ch]
and ecx,dword ptr [edi+10h]
mov ebx,dword ptr [edi+18h]
xor ecx,eax
and ebx,dword ptr [edi+14h]
xor eax,dword ptr [edi+8h]
xor ebx,ecx
and eax,dword ptr [edi+0Ch]
xor eax,ebx
ror eax,7h
ror dword ptr [edi],0Bh
add eax,dword ptr [esi+7Ch]
add dword ptr [edi],eax
mov ebx,dword ptr [edi+4h]
mov eax,dword ptr [edi]
mov edx,dword ptr [edi+8h]
not eax
and ebx,edx
and eax,dword ptr [edi+10h]
xor ebx,dword ptr [edi+14h]
xor eax,dword ptr [edi+18h]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+10h]
and eax,dword ptr [edi+0Ch]
and ecx,dword ptr [edi+4h]
and edx,dword ptr [edi]
xor eax,ecx
xor edx,dword ptr [edi+14h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+1Ch],0Bh
add eax,dword ptr [esi+14h]
add eax,452821E6h
add dword ptr [edi+1Ch],eax
mov ebx,dword ptr [edi]
mov eax,dword ptr [edi+1Ch]
mov edx,dword ptr [edi+4h]
not eax
and ebx,edx
and eax,dword ptr [edi+0Ch]
xor ebx,dword ptr [edi+10h]
xor eax,dword ptr [edi+14h]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+0Ch]
and eax,dword ptr [edi+8h]
and ecx,dword ptr [edi]
and edx,dword ptr [edi+1Ch]
xor eax,ecx
xor edx,dword ptr [edi+10h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+18h],0Bh
add eax,dword ptr [esi+38h]
add eax,38D01377h
add dword ptr [edi+18h],eax
mov ebx,dword ptr [edi+1Ch]
mov eax,dword ptr [edi+18h]
mov edx,dword ptr [edi]
not eax
and ebx,edx
and eax,dword ptr [edi+8h]
xor ebx,dword ptr [edi+0Ch]
xor eax,dword ptr [edi+10h]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+8h]
and eax,dword ptr [edi+4h]
and ecx,dword ptr [edi+1Ch]
and edx,dword ptr [edi+18h]
xor eax,ecx
xor edx,dword ptr [edi+0Ch]
xor eax,edx
ror eax,7h
ror dword ptr [edi+14h],0Bh
add eax,dword ptr [esi+68h]
add eax,0BE5466CFh
add dword ptr [edi+14h],eax
mov ebx,dword ptr [edi+18h]
mov eax,dword ptr [edi+14h]
mov edx,dword ptr [edi+1Ch]
not eax
and ebx,edx
and eax,dword ptr [edi+4h]
xor ebx,dword ptr [edi+8h]
xor eax,dword ptr [edi+0Ch]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+4h]
and eax,dword ptr [edi]
and ecx,dword ptr [edi+18h]
and edx,dword ptr [edi+14h]
xor eax,ecx
xor edx,dword ptr [edi+8h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+10h],0Bh
add eax,dword ptr [esi+48h]
add eax,34E90C6Ch
add dword ptr [edi+10h],eax
mov ebx,dword ptr [edi+14h]
mov eax,dword ptr [edi+10h]
mov edx,dword ptr [edi+18h]
not eax
and ebx,edx
and eax,dword ptr [edi]
xor ebx,dword ptr [edi+4h]
xor eax,dword ptr [edi+8h]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi]
and eax,dword ptr [edi+1Ch]
and ecx,dword ptr [edi+14h]
and edx,dword ptr [edi+10h]
xor eax,ecx
xor edx,dword ptr [edi+4h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+0Ch],0Bh
add eax,dword ptr [esi+2Ch]
add eax,0C0AC29B7h
add dword ptr [edi+0Ch],eax
mov ebx,dword ptr [edi+10h]
mov eax,dword ptr [edi+0Ch]
mov edx,dword ptr [edi+14h]
not eax
and ebx,edx
and eax,dword ptr [edi+1Ch]
xor ebx,dword ptr [edi]
xor eax,dword ptr [edi+4h]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+1Ch]
and eax,dword ptr [edi+18h]
and ecx,dword ptr [edi+10h]
and edx,dword ptr [edi+0Ch]
xor eax,ecx
xor edx,dword ptr [edi]
xor eax,edx
ror eax,7h
ror dword ptr [edi+8h],0Bh
add eax,dword ptr [esi+70h]
add eax,0C97C50DDh
add dword ptr [edi+8h],eax
mov ebx,dword ptr [edi+0Ch]
mov eax,dword ptr [edi+8h]
mov edx,dword ptr [edi+10h]
not eax
and ebx,edx
and eax,dword ptr [edi+18h]
xor ebx,dword ptr [edi+1Ch]
xor eax,dword ptr [edi]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+18h]
and eax,dword ptr [edi+14h]
and ecx,dword ptr [edi+0Ch]
and edx,dword ptr [edi+8h]
xor eax,ecx
xor edx,dword ptr [edi+1Ch]
xor eax,edx
ror eax,7h
ror dword ptr [edi+4h],0Bh
add eax,dword ptr [esi+1Ch]
add eax,3F84D5B5h
add dword ptr [edi+4h],eax
mov ebx,dword ptr [edi+8h]
mov eax,dword ptr [edi+4h]
mov edx,dword ptr [edi+0Ch]
not eax
and ebx,edx
and eax,dword ptr [edi+14h]
xor ebx,dword ptr [edi+18h]
xor eax,dword ptr [edi+1Ch]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+14h]
and eax,dword ptr [edi+10h]
and ecx,dword ptr [edi+8h]
and edx,dword ptr [edi+4h]
xor eax,ecx
xor edx,dword ptr [edi+18h]
xor eax,edx
ror eax,7h
ror dword ptr [edi],0Bh
add eax,dword ptr [esi+40h]
add eax,0B5470917h
add dword ptr [edi],eax
mov ebx,dword ptr [edi+4h]
mov eax,dword ptr [edi]
mov edx,dword ptr [edi+8h]
not eax
and ebx,edx
and eax,dword ptr [edi+10h]
xor ebx,dword ptr [edi+14h]
xor eax,dword ptr [edi+18h]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+10h]
and eax,dword ptr [edi+0Ch]
and ecx,dword ptr [edi+4h]
and edx,dword ptr [edi]
xor eax,ecx
xor edx,dword ptr [edi+14h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+1Ch],0Bh
add eax,dword ptr [esi]
add eax,9216D5D9h
add dword ptr [edi+1Ch],eax
mov ebx,dword ptr [edi]
mov eax,dword ptr [edi+1Ch]
mov edx,dword ptr [edi+4h]
not eax
and ebx,edx
and eax,dword ptr [edi+0Ch]
xor ebx,dword ptr [edi+10h]
xor eax,dword ptr [edi+14h]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+0Ch]
and eax,dword ptr [edi+8h]
and ecx,dword ptr [edi]
and edx,dword ptr [edi+1Ch]
xor eax,ecx
xor edx,dword ptr [edi+10h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+18h],0Bh
add eax,dword ptr [esi+5Ch]
add eax,8979FB1Bh
add dword ptr [edi+18h],eax
mov ebx,dword ptr [edi+1Ch]
mov eax,dword ptr [edi+18h]
mov edx,dword ptr [edi]
not eax
and ebx,edx
and eax,dword ptr [edi+8h]
xor ebx,dword ptr [edi+0Ch]
xor eax,dword ptr [edi+10h]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+8h]
and eax,dword ptr [edi+4h]
and ecx,dword ptr [edi+1Ch]
and edx,dword ptr [edi+18h]
xor eax,ecx
xor edx,dword ptr [edi+0Ch]
xor eax,edx
ror eax,7h
ror dword ptr [edi+14h],0Bh
add eax,dword ptr [esi+50h]
add eax,0D1310BA6h
add dword ptr [edi+14h],eax
mov ebx,dword ptr [edi+18h]
mov eax,dword ptr [edi+14h]
mov edx,dword ptr [edi+1Ch]
not eax
and ebx,edx
and eax,dword ptr [edi+4h]
xor ebx,dword ptr [edi+8h]
xor eax,dword ptr [edi+0Ch]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+4h]
and eax,dword ptr [edi]
and ecx,dword ptr [edi+18h]
and edx,dword ptr [edi+14h]
xor eax,ecx
xor edx,dword ptr [edi+8h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+10h],0Bh
add eax,dword ptr [esi+58h]
add eax,98DFB5ACh
add dword ptr [edi+10h],eax
mov ebx,dword ptr [edi+14h]
mov eax,dword ptr [edi+10h]
mov edx,dword ptr [edi+18h]
not eax
and ebx,edx
and eax,dword ptr [edi]
xor ebx,dword ptr [edi+4h]
xor eax,dword ptr [edi+8h]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi]
and eax,dword ptr [edi+1Ch]
and ecx,dword ptr [edi+14h]
and edx,dword ptr [edi+10h]
xor eax,ecx
xor edx,dword ptr [edi+4h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+0Ch],0Bh
add eax,dword ptr [esi+4h]
add eax,2FFD72DBh
add dword ptr [edi+0Ch],eax
mov ebx,dword ptr [edi+10h]
mov eax,dword ptr [edi+0Ch]
mov edx,dword ptr [edi+14h]
not eax
and ebx,edx
and eax,dword ptr [edi+1Ch]
xor ebx,dword ptr [edi]
xor eax,dword ptr [edi+4h]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+1Ch]
and eax,dword ptr [edi+18h]
and ecx,dword ptr [edi+10h]
and edx,dword ptr [edi+0Ch]
xor eax,ecx
xor edx,dword ptr [edi]
xor eax,edx
ror eax,7h
ror dword ptr [edi+8h],0Bh
add eax,dword ptr [esi+28h]
add eax,0D01ADFB7h
add dword ptr [edi+8h],eax
mov ebx,dword ptr [edi+0Ch]
mov eax,dword ptr [edi+8h]
mov edx,dword ptr [edi+10h]
not eax
and ebx,edx
and eax,dword ptr [edi+18h]
xor ebx,dword ptr [edi+1Ch]
xor eax,dword ptr [edi]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+18h]
and eax,dword ptr [edi+14h]
and ecx,dword ptr [edi+0Ch]
and edx,dword ptr [edi+8h]
xor eax,ecx
xor edx,dword ptr [edi+1Ch]
xor eax,edx
ror eax,7h
ror dword ptr [edi+4h],0Bh
add eax,dword ptr [esi+10h]
add eax,0B8E1AFEDh
add dword ptr [edi+4h],eax
mov ebx,dword ptr [edi+8h]
mov eax,dword ptr [edi+4h]
mov edx,dword ptr [edi+0Ch]
not eax
and ebx,edx
and eax,dword ptr [edi+14h]
xor ebx,dword ptr [edi+18h]
xor eax,dword ptr [edi+1Ch]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+14h]
and eax,dword ptr [edi+10h]
and ecx,dword ptr [edi+8h]
and edx,dword ptr [edi+4h]
xor eax,ecx
xor edx,dword ptr [edi+18h]
xor eax,edx
ror eax,7h
ror dword ptr [edi],0Bh
add eax,dword ptr [esi+20h]
add eax,6A267E96h
add dword ptr [edi],eax
mov ebx,dword ptr [edi+4h]
mov eax,dword ptr [edi]
mov edx,dword ptr [edi+8h]
not eax
and ebx,edx
and eax,dword ptr [edi+10h]
xor ebx,dword ptr [edi+14h]
xor eax,dword ptr [edi+18h]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+10h]
and eax,dword ptr [edi+0Ch]
and ecx,dword ptr [edi+4h]
and edx,dword ptr [edi]
xor eax,ecx
xor edx,dword ptr [edi+14h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+1Ch],0Bh
add eax,dword ptr [esi+78h]
add eax,0BA7C9045h
add dword ptr [edi+1Ch],eax
mov ebx,dword ptr [edi]
mov eax,dword ptr [edi+1Ch]
mov edx,dword ptr [edi+4h]
not eax
and ebx,edx
and eax,dword ptr [edi+0Ch]
xor ebx,dword ptr [edi+10h]
xor eax,dword ptr [edi+14h]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+0Ch]
and eax,dword ptr [edi+8h]
and ecx,dword ptr [edi]
and edx,dword ptr [edi+1Ch]
xor eax,ecx
xor edx,dword ptr [edi+10h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+18h],0Bh
add eax,dword ptr [esi+0Ch]
add eax,0F12C7F99h
add dword ptr [edi+18h],eax
mov ebx,dword ptr [edi+1Ch]
mov eax,dword ptr [edi+18h]
mov edx,dword ptr [edi]
not eax
and ebx,edx
and eax,dword ptr [edi+8h]
xor ebx,dword ptr [edi+0Ch]
xor eax,dword ptr [edi+10h]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+8h]
and eax,dword ptr [edi+4h]
and ecx,dword ptr [edi+1Ch]
and edx,dword ptr [edi+18h]
xor eax,ecx
xor edx,dword ptr [edi+0Ch]
xor eax,edx
ror eax,7h
ror dword ptr [edi+14h],0Bh
add eax,dword ptr [esi+54h]
add eax,24A19947h
add dword ptr [edi+14h],eax
mov ebx,dword ptr [edi+18h]
mov eax,dword ptr [edi+14h]
mov edx,dword ptr [edi+1Ch]
not eax
and ebx,edx
and eax,dword ptr [edi+4h]
xor ebx,dword ptr [edi+8h]
xor eax,dword ptr [edi+0Ch]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+4h]
and eax,dword ptr [edi]
and ecx,dword ptr [edi+18h]
and edx,dword ptr [edi+14h]
xor eax,ecx
xor edx,dword ptr [edi+8h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+10h],0Bh
add eax,dword ptr [esi+24h]
add eax,0B3916CF7h
add dword ptr [edi+10h],eax
mov ebx,dword ptr [edi+14h]
mov eax,dword ptr [edi+10h]
mov edx,dword ptr [edi+18h]
not eax
and ebx,edx
and eax,dword ptr [edi]
xor ebx,dword ptr [edi+4h]
xor eax,dword ptr [edi+8h]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi]
and eax,dword ptr [edi+1Ch]
and ecx,dword ptr [edi+14h]
and edx,dword ptr [edi+10h]
xor eax,ecx
xor edx,dword ptr [edi+4h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+0Ch],0Bh
add eax,dword ptr [esi+44h]
add eax,801F2E2h
add dword ptr [edi+0Ch],eax
mov ebx,dword ptr [edi+10h]
mov eax,dword ptr [edi+0Ch]
mov edx,dword ptr [edi+14h]
not eax
and ebx,edx
and eax,dword ptr [edi+1Ch]
xor ebx,dword ptr [edi]
xor eax,dword ptr [edi+4h]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+1Ch]
and eax,dword ptr [edi+18h]
and ecx,dword ptr [edi+10h]
and edx,dword ptr [edi+0Ch]
xor eax,ecx
xor edx,dword ptr [edi]
xor eax,edx
ror eax,7h
ror dword ptr [edi+8h],0Bh
add eax,dword ptr [esi+60h]
add eax,858EFC16h
add dword ptr [edi+8h],eax
mov ebx,dword ptr [edi+0Ch]
mov eax,dword ptr [edi+8h]
mov edx,dword ptr [edi+10h]
not eax
and ebx,edx
and eax,dword ptr [edi+18h]
xor ebx,dword ptr [edi+1Ch]
xor eax,dword ptr [edi]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+18h]
and eax,dword ptr [edi+14h]
and ecx,dword ptr [edi+0Ch]
and edx,dword ptr [edi+8h]
xor eax,ecx
xor edx,dword ptr [edi+1Ch]
xor eax,edx
ror eax,7h
ror dword ptr [edi+4h],0Bh
add eax,dword ptr [esi+74h]
add eax,636920D8h
add dword ptr [edi+4h],eax
mov ebx,dword ptr [edi+8h]
mov eax,dword ptr [edi+4h]
mov edx,dword ptr [edi+0Ch]
not eax
and ebx,edx
and eax,dword ptr [edi+14h]
xor ebx,dword ptr [edi+18h]
xor eax,dword ptr [edi+1Ch]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+14h]
and eax,dword ptr [edi+10h]
and ecx,dword ptr [edi+8h]
and edx,dword ptr [edi+4h]
xor eax,ecx
xor edx,dword ptr [edi+18h]
xor eax,edx
ror eax,7h
ror dword ptr [edi],0Bh
add eax,dword ptr [esi+18h]
add eax,73574E69h
add dword ptr [edi],eax
mov ebx,dword ptr [edi+4h]
mov eax,dword ptr [edi]
mov edx,dword ptr [edi+8h]
not eax
and ebx,edx
and eax,dword ptr [edi+10h]
xor ebx,dword ptr [edi+14h]
xor eax,dword ptr [edi+18h]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+10h]
and eax,dword ptr [edi+0Ch]
and ecx,dword ptr [edi+4h]
and edx,dword ptr [edi]
xor eax,ecx
xor edx,dword ptr [edi+14h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+1Ch],0Bh
add eax,dword ptr [esi+4Ch]
add eax,0A458FEA3h
add dword ptr [edi+1Ch],eax
mov ebx,dword ptr [edi]
mov eax,dword ptr [edi+1Ch]
mov edx,dword ptr [edi+4h]
not eax
and ebx,edx
and eax,dword ptr [edi+0Ch]
xor ebx,dword ptr [edi+10h]
xor eax,dword ptr [edi+14h]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+0Ch]
and eax,dword ptr [edi+8h]
and ecx,dword ptr [edi]
and edx,dword ptr [edi+1Ch]
xor eax,ecx
xor edx,dword ptr [edi+10h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+18h],0Bh
add eax,dword ptr [esi+30h]
add eax,0F4933D7Eh
add dword ptr [edi+18h],eax
mov ebx,dword ptr [edi+1Ch]
mov eax,dword ptr [edi+18h]
mov edx,dword ptr [edi]
not eax
and ebx,edx
and eax,dword ptr [edi+8h]
xor ebx,dword ptr [edi+0Ch]
xor eax,dword ptr [edi+10h]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+8h]
and eax,dword ptr [edi+4h]
and ecx,dword ptr [edi+1Ch]
and edx,dword ptr [edi+18h]
xor eax,ecx
xor edx,dword ptr [edi+0Ch]
xor eax,edx
ror eax,7h
ror dword ptr [edi+14h],0Bh
add eax,dword ptr [esi+3Ch]
add eax,0D95748Fh
add dword ptr [edi+14h],eax
mov ebx,dword ptr [edi+18h]
mov eax,dword ptr [edi+14h]
mov edx,dword ptr [edi+1Ch]
not eax
and ebx,edx
and eax,dword ptr [edi+4h]
xor ebx,dword ptr [edi+8h]
xor eax,dword ptr [edi+0Ch]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+4h]
and eax,dword ptr [edi]
and ecx,dword ptr [edi+18h]
and edx,dword ptr [edi+14h]
xor eax,ecx
xor edx,dword ptr [edi+8h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+10h],0Bh
add eax,dword ptr [esi+34h]
add eax,728EB658h
add dword ptr [edi+10h],eax
mov ebx,dword ptr [edi+14h]
mov eax,dword ptr [edi+10h]
mov edx,dword ptr [edi+18h]
not eax
and ebx,edx
and eax,dword ptr [edi]
xor ebx,dword ptr [edi+4h]
xor eax,dword ptr [edi+8h]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi]
and eax,dword ptr [edi+1Ch]
and ecx,dword ptr [edi+14h]
and edx,dword ptr [edi+10h]
xor eax,ecx
xor edx,dword ptr [edi+4h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+0Ch],0Bh
add eax,dword ptr [esi+8h]
add eax,718BCD58h
add dword ptr [edi+0Ch],eax
mov ebx,dword ptr [edi+10h]
mov eax,dword ptr [edi+0Ch]
mov edx,dword ptr [edi+14h]
not eax
and ebx,edx
and eax,dword ptr [edi+1Ch]
xor ebx,dword ptr [edi]
xor eax,dword ptr [edi+4h]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+1Ch]
and eax,dword ptr [edi+18h]
and ecx,dword ptr [edi+10h]
and edx,dword ptr [edi+0Ch]
xor eax,ecx
xor edx,dword ptr [edi]
xor eax,edx
ror eax,7h
ror dword ptr [edi+8h],0Bh
add eax,dword ptr [esi+64h]
add eax,82154AEEh
add dword ptr [edi+8h],eax
mov ebx,dword ptr [edi+0Ch]
mov eax,dword ptr [edi+8h]
mov edx,dword ptr [edi+10h]
not eax
and ebx,edx
and eax,dword ptr [edi+18h]
xor ebx,dword ptr [edi+1Ch]
xor eax,dword ptr [edi]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+18h]
and eax,dword ptr [edi+14h]
and ecx,dword ptr [edi+0Ch]
and edx,dword ptr [edi+8h]
xor eax,ecx
xor edx,dword ptr [edi+1Ch]
xor eax,edx
ror eax,7h
ror dword ptr [edi+4h],0Bh
add eax,dword ptr [esi+7Ch]
add eax,7B54A41Dh
add dword ptr [edi+4h],eax
mov ebx,dword ptr [edi+8h]
mov eax,dword ptr [edi+4h]
mov edx,dword ptr [edi+0Ch]
not eax
and ebx,edx
and eax,dword ptr [edi+14h]
xor ebx,dword ptr [edi+18h]
xor eax,dword ptr [edi+1Ch]
mov ecx,edx
xor eax,ebx
xor ecx,dword ptr [edi+14h]
and eax,dword ptr [edi+10h]
and ecx,dword ptr [edi+8h]
and edx,dword ptr [edi+4h]
xor eax,ecx
xor edx,dword ptr [edi+18h]
xor eax,edx
ror eax,7h
ror dword ptr [edi],0Bh
add eax,dword ptr [esi+6Ch]
add eax,0C25A59B5h
add dword ptr [edi],eax
mov edx,dword ptr [edi+4h]
mov eax,dword ptr [edi+18h]
and edx,dword ptr [edi+0Ch]
mov ebx,dword ptr [edi+4h]
and eax,dword ptr [edi+0Ch]
xor edx,dword ptr [edi+8h]
xor eax,dword ptr [edi+14h]
and ebx,dword ptr [edi]
xor edx,dword ptr [edi+14h]
xor eax,ebx
and edx,dword ptr [edi+10h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+1Ch],0Bh
add eax,dword ptr [esi+4Ch]
add eax,9C30D539h
add dword ptr [edi+1Ch],eax
mov edx,dword ptr [edi]
mov eax,dword ptr [edi+14h]
and edx,dword ptr [edi+8h]
mov ebx,dword ptr [edi]
and eax,dword ptr [edi+8h]
xor edx,dword ptr [edi+4h]
xor eax,dword ptr [edi+10h]
and ebx,dword ptr [edi+1Ch]
xor edx,dword ptr [edi+10h]
xor eax,ebx
and edx,dword ptr [edi+0Ch]
xor eax,edx
ror eax,7h
ror dword ptr [edi+18h],0Bh
add eax,dword ptr [esi+24h]
add eax,2AF26013h
add dword ptr [edi+18h],eax
mov edx,dword ptr [edi+1Ch]
mov eax,dword ptr [edi+10h]
and edx,dword ptr [edi+4h]
mov ebx,dword ptr [edi+1Ch]
and eax,dword ptr [edi+4h]
xor edx,dword ptr [edi]
xor eax,dword ptr [edi+0Ch]
and ebx,dword ptr [edi+18h]
xor edx,dword ptr [edi+0Ch]
xor eax,ebx
and edx,dword ptr [edi+8h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+14h],0Bh
add eax,dword ptr [esi+10h]
add eax,0C5D1B023h
add dword ptr [edi+14h],eax
mov edx,dword ptr [edi+18h]
mov eax,dword ptr [edi+0Ch]
and edx,dword ptr [edi]
mov ebx,dword ptr [edi+18h]
and eax,dword ptr [edi]
xor edx,dword ptr [edi+1Ch]
xor eax,dword ptr [edi+8h]
and ebx,dword ptr [edi+14h]
xor edx,dword ptr [edi+8h]
xor eax,ebx
and edx,dword ptr [edi+4h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+10h],0Bh
add eax,dword ptr [esi+50h]
add eax,286085F0h
add dword ptr [edi+10h],eax
mov edx,dword ptr [edi+14h]
mov eax,dword ptr [edi+8h]
and edx,dword ptr [edi+1Ch]
mov ebx,dword ptr [edi+14h]
and eax,dword ptr [edi+1Ch]
xor edx,dword ptr [edi+18h]
xor eax,dword ptr [edi+4h]
and ebx,dword ptr [edi+10h]
xor edx,dword ptr [edi+4h]
xor eax,ebx
and edx,dword ptr [edi]
xor eax,edx
ror eax,7h
ror dword ptr [edi+0Ch],0Bh
add eax,dword ptr [esi+70h]
add eax,0CA417918h
add dword ptr [edi+0Ch],eax
mov edx,dword ptr [edi+10h]
mov eax,dword ptr [edi+4h]
and edx,dword ptr [edi+18h]
mov ebx,dword ptr [edi+10h]
and eax,dword ptr [edi+18h]
xor edx,dword ptr [edi+14h]
xor eax,dword ptr [edi]
and ebx,dword ptr [edi+0Ch]
xor edx,dword ptr [edi]
xor eax,ebx
and edx,dword ptr [edi+1Ch]
xor eax,edx
ror eax,7h
ror dword ptr [edi+8h],0Bh
add eax,dword ptr [esi+44h]
add eax,0B8DB38EFh
add dword ptr [edi+8h],eax
mov edx,dword ptr [edi+0Ch]
mov eax,dword ptr [edi]
and edx,dword ptr [edi+14h]
mov ebx,dword ptr [edi+0Ch]
and eax,dword ptr [edi+14h]
xor edx,dword ptr [edi+10h]
xor eax,dword ptr [edi+1Ch]
and ebx,dword ptr [edi+8h]
xor edx,dword ptr [edi+1Ch]
xor eax,ebx
and edx,dword ptr [edi+18h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+4h],0Bh
add eax,dword ptr [esi+20h]
add eax,8E79DCB0h
add dword ptr [edi+4h],eax
mov edx,dword ptr [edi+8h]
mov eax,dword ptr [edi+1Ch]
and edx,dword ptr [edi+10h]
mov ebx,dword ptr [edi+8h]
and eax,dword ptr [edi+10h]
xor edx,dword ptr [edi+0Ch]
xor eax,dword ptr [edi+18h]
and ebx,dword ptr [edi+4h]
xor edx,dword ptr [edi+18h]
xor eax,ebx
and edx,dword ptr [edi+14h]
xor eax,edx
ror eax,7h
ror dword ptr [edi],0Bh
add eax,dword ptr [esi+58h]
add eax,603A180Eh
add dword ptr [edi],eax
mov edx,dword ptr [edi+4h]
mov eax,dword ptr [edi+18h]
and edx,dword ptr [edi+0Ch]
mov ebx,dword ptr [edi+4h]
and eax,dword ptr [edi+0Ch]
xor edx,dword ptr [edi+8h]
xor eax,dword ptr [edi+14h]
and ebx,dword ptr [edi]
xor edx,dword ptr [edi+14h]
xor eax,ebx
and edx,dword ptr [edi+10h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+1Ch],0Bh
add eax,dword ptr [esi+74h]
add eax,6C9E0E8Bh
add dword ptr [edi+1Ch],eax
mov edx,dword ptr [edi]
mov eax,dword ptr [edi+14h]
and edx,dword ptr [edi+8h]
mov ebx,dword ptr [edi]
and eax,dword ptr [edi+8h]
xor edx,dword ptr [edi+4h]
xor eax,dword ptr [edi+10h]
and ebx,dword ptr [edi+1Ch]
xor edx,dword ptr [edi+10h]
xor eax,ebx
and edx,dword ptr [edi+0Ch]
xor eax,edx
ror eax,7h
ror dword ptr [edi+18h],0Bh
add eax,dword ptr [esi+38h]
add eax,0B01E8A3Eh
add dword ptr [edi+18h],eax
mov edx,dword ptr [edi+1Ch]
mov eax,dword ptr [edi+10h]
and edx,dword ptr [edi+4h]
mov ebx,dword ptr [edi+1Ch]
and eax,dword ptr [edi+4h]
xor edx,dword ptr [edi]
xor eax,dword ptr [edi+0Ch]
and ebx,dword ptr [edi+18h]
xor edx,dword ptr [edi+0Ch]
xor eax,ebx
and edx,dword ptr [edi+8h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+14h],0Bh
add eax,dword ptr [esi+64h]
add eax,0D71577C1h
add dword ptr [edi+14h],eax
mov edx,dword ptr [edi+18h]
mov eax,dword ptr [edi+0Ch]
and edx,dword ptr [edi]
mov ebx,dword ptr [edi+18h]
and eax,dword ptr [edi]
xor edx,dword ptr [edi+1Ch]
xor eax,dword ptr [edi+8h]
and ebx,dword ptr [edi+14h]
xor edx,dword ptr [edi+8h]
xor eax,ebx
and edx,dword ptr [edi+4h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+10h],0Bh
add eax,dword ptr [esi+30h]
add eax,0BD314B27h
add dword ptr [edi+10h],eax
mov edx,dword ptr [edi+14h]
mov eax,dword ptr [edi+8h]
and edx,dword ptr [edi+1Ch]
mov ebx,dword ptr [edi+14h]
and eax,dword ptr [edi+1Ch]
xor edx,dword ptr [edi+18h]
xor eax,dword ptr [edi+4h]
and ebx,dword ptr [edi+10h]
xor edx,dword ptr [edi+4h]
xor eax,ebx
and edx,dword ptr [edi]
xor eax,edx
ror eax,7h
ror dword ptr [edi+0Ch],0Bh
add eax,dword ptr [esi+60h]
add eax,78AF2FDAh
add dword ptr [edi+0Ch],eax
mov edx,dword ptr [edi+10h]
mov eax,dword ptr [edi+4h]
and edx,dword ptr [edi+18h]
mov ebx,dword ptr [edi+10h]
and eax,dword ptr [edi+18h]
xor edx,dword ptr [edi+14h]
xor eax,dword ptr [edi]
and ebx,dword ptr [edi+0Ch]
xor edx,dword ptr [edi]
xor eax,ebx
and edx,dword ptr [edi+1Ch]
xor eax,edx
ror eax,7h
ror dword ptr [edi+8h],0Bh
add eax,dword ptr [esi+78h]
add eax,55625C60h
add dword ptr [edi+8h],eax
mov edx,dword ptr [edi+0Ch]
mov eax,dword ptr [edi]
and edx,dword ptr [edi+14h]
mov ebx,dword ptr [edi+0Ch]
and eax,dword ptr [edi+14h]
xor edx,dword ptr [edi+10h]
xor eax,dword ptr [edi+1Ch]
and ebx,dword ptr [edi+8h]
xor edx,dword ptr [edi+1Ch]
xor eax,ebx
and edx,dword ptr [edi+18h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+4h],0Bh
add eax,dword ptr [esi+40h]
add eax,0E65525F3h
add dword ptr [edi+4h],eax
mov edx,dword ptr [edi+8h]
mov eax,dword ptr [edi+1Ch]
and edx,dword ptr [edi+10h]
mov ebx,dword ptr [edi+8h]
and eax,dword ptr [edi+10h]
xor edx,dword ptr [edi+0Ch]
xor eax,dword ptr [edi+18h]
and ebx,dword ptr [edi+4h]
xor edx,dword ptr [edi+18h]
xor eax,ebx
and edx,dword ptr [edi+14h]
xor eax,edx
ror eax,7h
ror dword ptr [edi],0Bh
add eax,dword ptr [esi+68h]
add eax,0AA55AB94h
add dword ptr [edi],eax
mov edx,dword ptr [edi+4h]
mov eax,dword ptr [edi+18h]
and edx,dword ptr [edi+0Ch]
mov ebx,dword ptr [edi+4h]
and eax,dword ptr [edi+0Ch]
xor edx,dword ptr [edi+8h]
xor eax,dword ptr [edi+14h]
and ebx,dword ptr [edi]
xor edx,dword ptr [edi+14h]
xor eax,ebx
and edx,dword ptr [edi+10h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+1Ch],0Bh
add eax,dword ptr [esi+7Ch]
add eax,57489862h
add dword ptr [edi+1Ch],eax
mov edx,dword ptr [edi]
mov eax,dword ptr [edi+14h]
and edx,dword ptr [edi+8h]
mov ebx,dword ptr [edi]
and eax,dword ptr [edi+8h]
xor edx,dword ptr [edi+4h]
xor eax,dword ptr [edi+10h]
and ebx,dword ptr [edi+1Ch]
xor edx,dword ptr [edi+10h]
xor eax,ebx
and edx,dword ptr [edi+0Ch]
xor eax,edx
ror eax,7h
ror dword ptr [edi+18h],0Bh
add eax,dword ptr [esi+3Ch]
add eax,63E81440h
add dword ptr [edi+18h],eax
mov edx,dword ptr [edi+1Ch]
mov eax,dword ptr [edi+10h]
and edx,dword ptr [edi+4h]
mov ebx,dword ptr [edi+1Ch]
and eax,dword ptr [edi+4h]
xor edx,dword ptr [edi]
xor eax,dword ptr [edi+0Ch]
and ebx,dword ptr [edi+18h]
xor edx,dword ptr [edi+0Ch]
xor eax,ebx
and edx,dword ptr [edi+8h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+14h],0Bh
add eax,dword ptr [esi+1Ch]
add eax,55CA396Ah
add dword ptr [edi+14h],eax
mov edx,dword ptr [edi+18h]
mov eax,dword ptr [edi+0Ch]
and edx,dword ptr [edi]
mov ebx,dword ptr [edi+18h]
and eax,dword ptr [edi]
xor edx,dword ptr [edi+1Ch]
xor eax,dword ptr [edi+8h]
and ebx,dword ptr [edi+14h]
xor edx,dword ptr [edi+8h]
xor eax,ebx
and edx,dword ptr [edi+4h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+10h],0Bh
add eax,dword ptr [esi+0Ch]
add eax,2AAB10B6h
add dword ptr [edi+10h],eax
mov edx,dword ptr [edi+14h]
mov eax,dword ptr [edi+8h]
and edx,dword ptr [edi+1Ch]
mov ebx,dword ptr [edi+14h]
and eax,dword ptr [edi+1Ch]
xor edx,dword ptr [edi+18h]
xor eax,dword ptr [edi+4h]
and ebx,dword ptr [edi+10h]
xor edx,dword ptr [edi+4h]
xor eax,ebx
and edx,dword ptr [edi]
xor eax,edx
ror eax,7h
ror dword ptr [edi+0Ch],0Bh
add eax,dword ptr [esi+4h]
add eax,0B4CC5C34h
add dword ptr [edi+0Ch],eax
mov edx,dword ptr [edi+10h]
mov eax,dword ptr [edi+4h]
and edx,dword ptr [edi+18h]
mov ebx,dword ptr [edi+10h]
and eax,dword ptr [edi+18h]
xor edx,dword ptr [edi+14h]
xor eax,dword ptr [edi]
and ebx,dword ptr [edi+0Ch]
xor edx,dword ptr [edi]
xor eax,ebx
and edx,dword ptr [edi+1Ch]
xor eax,edx
ror eax,7h
ror dword ptr [edi+8h],0Bh
add eax,dword ptr [esi]
add eax,1141E8CEh
add dword ptr [edi+8h],eax
mov edx,dword ptr [edi+0Ch]
mov eax,dword ptr [edi]
and edx,dword ptr [edi+14h]
mov ebx,dword ptr [edi+0Ch]
and eax,dword ptr [edi+14h]
xor edx,dword ptr [edi+10h]
xor eax,dword ptr [edi+1Ch]
and ebx,dword ptr [edi+8h]
xor edx,dword ptr [edi+1Ch]
xor eax,ebx
and edx,dword ptr [edi+18h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+4h],0Bh
add eax,dword ptr [esi+48h]
add eax,0A15486AFh
add dword ptr [edi+4h],eax
mov edx,dword ptr [edi+8h]
mov eax,dword ptr [edi+1Ch]
and edx,dword ptr [edi+10h]
mov ebx,dword ptr [edi+8h]
and eax,dword ptr [edi+10h]
xor edx,dword ptr [edi+0Ch]
xor eax,dword ptr [edi+18h]
and ebx,dword ptr [edi+4h]
xor edx,dword ptr [edi+18h]
xor eax,ebx
and edx,dword ptr [edi+14h]
xor eax,edx
ror eax,7h
ror dword ptr [edi],0Bh
add eax,dword ptr [esi+6Ch]
add eax,7C72E993h
add dword ptr [edi],eax
mov edx,dword ptr [edi+4h]
mov eax,dword ptr [edi+18h]
and edx,dword ptr [edi+0Ch]
mov ebx,dword ptr [edi+4h]
and eax,dword ptr [edi+0Ch]
xor edx,dword ptr [edi+8h]
xor eax,dword ptr [edi+14h]
and ebx,dword ptr [edi]
xor edx,dword ptr [edi+14h]
xor eax,ebx
and edx,dword ptr [edi+10h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+1Ch],0Bh
add eax,dword ptr [esi+34h]
add eax,0B3FE1312h
add dword ptr [edi+1Ch],eax
mov edx,dword ptr [edi]
mov eax,dword ptr [edi+14h]
and edx,dword ptr [edi+8h]
mov ebx,dword ptr [edi]
and eax,dword ptr [edi+8h]
xor edx,dword ptr [edi+4h]
xor eax,dword ptr [edi+10h]
and ebx,dword ptr [edi+1Ch]
xor edx,dword ptr [edi+10h]
xor eax,ebx
and edx,dword ptr [edi+0Ch]
xor eax,edx
ror eax,7h
ror dword ptr [edi+18h],0Bh
add eax,dword ptr [esi+18h]
add eax,636FBC2Ah
add dword ptr [edi+18h],eax
mov edx,dword ptr [edi+1Ch]
mov eax,dword ptr [edi+10h]
and edx,dword ptr [edi+4h]
mov ebx,dword ptr [edi+1Ch]
and eax,dword ptr [edi+4h]
xor edx,dword ptr [edi]
xor eax,dword ptr [edi+0Ch]
and ebx,dword ptr [edi+18h]
xor edx,dword ptr [edi+0Ch]
xor eax,ebx
and edx,dword ptr [edi+8h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+14h],0Bh
add eax,dword ptr [esi+54h]
add eax,2BA9C55Dh
add dword ptr [edi+14h],eax
mov edx,dword ptr [edi+18h]
mov eax,dword ptr [edi+0Ch]
and edx,dword ptr [edi]
mov ebx,dword ptr [edi+18h]
and eax,dword ptr [edi]
xor edx,dword ptr [edi+1Ch]
xor eax,dword ptr [edi+8h]
and ebx,dword ptr [edi+14h]
xor edx,dword ptr [edi+8h]
xor eax,ebx
and edx,dword ptr [edi+4h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+10h],0Bh
add eax,dword ptr [esi+28h]
add eax,741831F6h
add dword ptr [edi+10h],eax
mov edx,dword ptr [edi+14h]
mov eax,dword ptr [edi+8h]
and edx,dword ptr [edi+1Ch]
mov ebx,dword ptr [edi+14h]
and eax,dword ptr [edi+1Ch]
xor edx,dword ptr [edi+18h]
xor eax,dword ptr [edi+4h]
and ebx,dword ptr [edi+10h]
xor edx,dword ptr [edi+4h]
xor eax,ebx
and edx,dword ptr [edi]
xor eax,edx
ror eax,7h
ror dword ptr [edi+0Ch],0Bh
add eax,dword ptr [esi+5Ch]
add eax,0CE5C3E16h
add dword ptr [edi+0Ch],eax
mov edx,dword ptr [edi+10h]
mov eax,dword ptr [edi+4h]
and edx,dword ptr [edi+18h]
mov ebx,dword ptr [edi+10h]
and eax,dword ptr [edi+18h]
xor edx,dword ptr [edi+14h]
xor eax,dword ptr [edi]
and ebx,dword ptr [edi+0Ch]
xor edx,dword ptr [edi]
xor eax,ebx
and edx,dword ptr [edi+1Ch]
xor eax,edx
ror eax,7h
ror dword ptr [edi+8h],0Bh
add eax,dword ptr [esi+2Ch]
add eax,9B87931Eh
add dword ptr [edi+8h],eax
mov edx,dword ptr [edi+0Ch]
mov eax,dword ptr [edi]
and edx,dword ptr [edi+14h]
mov ebx,dword ptr [edi+0Ch]
and eax,dword ptr [edi+14h]
xor edx,dword ptr [edi+10h]
xor eax,dword ptr [edi+1Ch]
and ebx,dword ptr [edi+8h]
xor edx,dword ptr [edi+1Ch]
xor eax,ebx
and edx,dword ptr [edi+18h]
xor eax,edx
ror eax,7h
ror dword ptr [edi+4h],0Bh
add eax,dword ptr [esi+14h]
add eax,0AFD6BA33h
add dword ptr [edi+4h],eax
mov edx,dword ptr [edi+8h]
mov eax,dword ptr [edi+1Ch]
and edx,dword ptr [edi+10h]
mov ebx,dword ptr [edi+8h]
and eax,dword ptr [edi+10h]
xor edx,dword ptr [edi+0Ch]
xor eax,dword ptr [edi+18h]
and ebx,dword ptr [edi+4h]
xor edx,dword ptr [edi+18h]
xor eax,ebx
and edx,dword ptr [edi+14h]
xor eax,edx
ror eax,7h
ror dword ptr [edi],0Bh
add eax,dword ptr [esi+8h]
add eax,6C24CF5Ch
add dword ptr [edi],eax
mov edx,dword ptr [edi]
mov ecx,dword ptr [edi+4h]
not edx
mov eax,dword ptr [edi+10h]
or ecx,dword ptr [edi+8h]
and eax,dword ptr [edi]
and edx,dword ptr [edi+14h]
xor eax,dword ptr [edi+4h]
xor edx,dword ptr [edi+10h]
xor eax,dword ptr [edi+14h]
mov ebx,dword ptr [edi]
xor ecx,dword ptr [edi+18h]
and ebx,dword ptr [edi+4h]
xor edx,ecx
and eax,dword ptr [edi+8h]
and edx,dword ptr [edi+0Ch]
xor ebx,dword ptr [edi+18h]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+1Ch],0Bh
add eax,dword ptr [esi+60h]
add eax,7A325381h
add dword ptr [edi+1Ch],eax
mov edx,dword ptr [edi+1Ch]
mov ecx,dword ptr [edi]
not edx
mov eax,dword ptr [edi+0Ch]
or ecx,dword ptr [edi+4h]
and eax,dword ptr [edi+1Ch]
and edx,dword ptr [edi+10h]
xor eax,dword ptr [edi]
xor edx,dword ptr [edi+0Ch]
xor eax,dword ptr [edi+10h]
mov ebx,dword ptr [edi+1Ch]
xor ecx,dword ptr [edi+14h]
and ebx,dword ptr [edi]
xor edx,ecx
and eax,dword ptr [edi+4h]
and edx,dword ptr [edi+8h]
xor ebx,dword ptr [edi+14h]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+18h],0Bh
add eax,dword ptr [esi+10h]
add eax,28958677h
add dword ptr [edi+18h],eax
mov edx,dword ptr [edi+18h]
mov ecx,dword ptr [edi+1Ch]
not edx
mov eax,dword ptr [edi+8h]
or ecx,dword ptr [edi]
and eax,dword ptr [edi+18h]
and edx,dword ptr [edi+0Ch]
xor eax,dword ptr [edi+1Ch]
xor edx,dword ptr [edi+8h]
xor eax,dword ptr [edi+0Ch]
mov ebx,dword ptr [edi+18h]
xor ecx,dword ptr [edi+10h]
and ebx,dword ptr [edi+1Ch]
xor edx,ecx
and eax,dword ptr [edi]
and edx,dword ptr [edi+4h]
xor ebx,dword ptr [edi+10h]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+14h],0Bh
add eax,dword ptr [esi]
add eax,3B8F4898h
add dword ptr [edi+14h],eax
mov edx,dword ptr [edi+14h]
mov ecx,dword ptr [edi+18h]
not edx
mov eax,dword ptr [edi+4h]
or ecx,dword ptr [edi+1Ch]
and eax,dword ptr [edi+14h]
and edx,dword ptr [edi+8h]
xor eax,dword ptr [edi+18h]
xor edx,dword ptr [edi+4h]
xor eax,dword ptr [edi+8h]
mov ebx,dword ptr [edi+14h]
xor ecx,dword ptr [edi+0Ch]
and ebx,dword ptr [edi+18h]
xor edx,ecx
and eax,dword ptr [edi+1Ch]
and edx,dword ptr [edi]
xor ebx,dword ptr [edi+0Ch]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+10h],0Bh
add eax,dword ptr [esi+38h]
add eax,6B4BB9AFh
add dword ptr [edi+10h],eax
mov edx,dword ptr [edi+10h]
mov ecx,dword ptr [edi+14h]
not edx
mov eax,dword ptr [edi]
or ecx,dword ptr [edi+18h]
and eax,dword ptr [edi+10h]
and edx,dword ptr [edi+4h]
xor eax,dword ptr [edi+14h]
xor edx,dword ptr [edi]
xor eax,dword ptr [edi+4h]
mov ebx,dword ptr [edi+10h]
xor ecx,dword ptr [edi+8h]
and ebx,dword ptr [edi+14h]
xor edx,ecx
and eax,dword ptr [edi+18h]
and edx,dword ptr [edi+1Ch]
xor ebx,dword ptr [edi+8h]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+0Ch],0Bh
add eax,dword ptr [esi+8h]
add eax,0C4BFE81Bh
add dword ptr [edi+0Ch],eax
mov edx,dword ptr [edi+0Ch]
mov ecx,dword ptr [edi+10h]
not edx
mov eax,dword ptr [edi+1Ch]
or ecx,dword ptr [edi+14h]
and eax,dword ptr [edi+0Ch]
and edx,dword ptr [edi]
xor eax,dword ptr [edi+10h]
xor edx,dword ptr [edi+1Ch]
xor eax,dword ptr [edi]
mov ebx,dword ptr [edi+0Ch]
xor ecx,dword ptr [edi+4h]
and ebx,dword ptr [edi+10h]
xor edx,ecx
and eax,dword ptr [edi+14h]
and edx,dword ptr [edi+18h]
xor ebx,dword ptr [edi+4h]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+8h],0Bh
add eax,dword ptr [esi+1Ch]
add eax,66282193h
add dword ptr [edi+8h],eax
mov edx,dword ptr [edi+8h]
mov ecx,dword ptr [edi+0Ch]
not edx
mov eax,dword ptr [edi+18h]
or ecx,dword ptr [edi+10h]
and eax,dword ptr [edi+8h]
and edx,dword ptr [edi+1Ch]
xor eax,dword ptr [edi+0Ch]
xor edx,dword ptr [edi+18h]
xor eax,dword ptr [edi+1Ch]
mov ebx,dword ptr [edi+8h]
xor ecx,dword ptr [edi]
and ebx,dword ptr [edi+0Ch]
xor edx,ecx
and eax,dword ptr [edi+10h]
and edx,dword ptr [edi+14h]
xor ebx,dword ptr [edi]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+4h],0Bh
add eax,dword ptr [esi+70h]
add eax,61D809CCh
add dword ptr [edi+4h],eax
mov edx,dword ptr [edi+4h]
mov ecx,dword ptr [edi+8h]
not edx
mov eax,dword ptr [edi+14h]
or ecx,dword ptr [edi+0Ch]
and eax,dword ptr [edi+4h]
and edx,dword ptr [edi+18h]
xor eax,dword ptr [edi+8h]
xor edx,dword ptr [edi+14h]
xor eax,dword ptr [edi+18h]
mov ebx,dword ptr [edi+4h]
xor ecx,dword ptr [edi+1Ch]
and ebx,dword ptr [edi+8h]
xor edx,ecx
and eax,dword ptr [edi+0Ch]
and edx,dword ptr [edi+10h]
xor ebx,dword ptr [edi+1Ch]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi],0Bh
add eax,dword ptr [esi+5Ch]
add eax,0FB21A991h
add dword ptr [edi],eax
mov edx,dword ptr [edi]
mov ecx,dword ptr [edi+4h]
not edx
mov eax,dword ptr [edi+10h]
or ecx,dword ptr [edi+8h]
and eax,dword ptr [edi]
and edx,dword ptr [edi+14h]
xor eax,dword ptr [edi+4h]
xor edx,dword ptr [edi+10h]
xor eax,dword ptr [edi+14h]
mov ebx,dword ptr [edi]
xor ecx,dword ptr [edi+18h]
and ebx,dword ptr [edi+4h]
xor edx,ecx
and eax,dword ptr [edi+8h]
and edx,dword ptr [edi+0Ch]
xor ebx,dword ptr [edi+18h]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+1Ch],0Bh
add eax,dword ptr [esi+68h]
add eax,487CAC60h
add dword ptr [edi+1Ch],eax
mov edx,dword ptr [edi+1Ch]
mov ecx,dword ptr [edi]
not edx
mov eax,dword ptr [edi+0Ch]
or ecx,dword ptr [edi+4h]
and eax,dword ptr [edi+1Ch]
and edx,dword ptr [edi+10h]
xor eax,dword ptr [edi]
xor edx,dword ptr [edi+0Ch]
xor eax,dword ptr [edi+10h]
mov ebx,dword ptr [edi+1Ch]
xor ecx,dword ptr [edi+14h]
and ebx,dword ptr [edi]
xor edx,ecx
and eax,dword ptr [edi+4h]
and edx,dword ptr [edi+8h]
xor ebx,dword ptr [edi+14h]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+18h],0Bh
add eax,dword ptr [esi+18h]
add eax,5DEC8032h
add dword ptr [edi+18h],eax
mov edx,dword ptr [edi+18h]
mov ecx,dword ptr [edi+1Ch]
not edx
mov eax,dword ptr [edi+8h]
or ecx,dword ptr [edi]
and eax,dword ptr [edi+18h]
and edx,dword ptr [edi+0Ch]
xor eax,dword ptr [edi+1Ch]
xor edx,dword ptr [edi+8h]
xor eax,dword ptr [edi+0Ch]
mov ebx,dword ptr [edi+18h]
xor ecx,dword ptr [edi+10h]
and ebx,dword ptr [edi+1Ch]
xor edx,ecx
and eax,dword ptr [edi]
and edx,dword ptr [edi+4h]
xor ebx,dword ptr [edi+10h]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+14h],0Bh
add eax,dword ptr [esi+78h]
add eax,0EF845D5Dh
add dword ptr [edi+14h],eax
mov edx,dword ptr [edi+14h]
mov ecx,dword ptr [edi+18h]
not edx
mov eax,dword ptr [edi+4h]
or ecx,dword ptr [edi+1Ch]
and eax,dword ptr [edi+14h]
and edx,dword ptr [edi+8h]
xor eax,dword ptr [edi+18h]
xor edx,dword ptr [edi+4h]
xor eax,dword ptr [edi+8h]
mov ebx,dword ptr [edi+14h]
xor ecx,dword ptr [edi+0Ch]
and ebx,dword ptr [edi+18h]
xor edx,ecx
and eax,dword ptr [edi+1Ch]
and edx,dword ptr [edi]
xor ebx,dword ptr [edi+0Ch]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+10h],0Bh
add eax,dword ptr [esi+50h]
add eax,0E98575B1h
add dword ptr [edi+10h],eax
mov edx,dword ptr [edi+10h]
mov ecx,dword ptr [edi+14h]
not edx
mov eax,dword ptr [edi]
or ecx,dword ptr [edi+18h]
and eax,dword ptr [edi+10h]
and edx,dword ptr [edi+4h]
xor eax,dword ptr [edi+14h]
xor edx,dword ptr [edi]
xor eax,dword ptr [edi+4h]
mov ebx,dword ptr [edi+10h]
xor ecx,dword ptr [edi+8h]
and ebx,dword ptr [edi+14h]
xor edx,ecx
and eax,dword ptr [edi+18h]
and edx,dword ptr [edi+1Ch]
xor ebx,dword ptr [edi+8h]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+0Ch],0Bh
add eax,dword ptr [esi+48h]
add eax,0DC262302h
add dword ptr [edi+0Ch],eax
mov edx,dword ptr [edi+0Ch]
mov ecx,dword ptr [edi+10h]
not edx
mov eax,dword ptr [edi+1Ch]
or ecx,dword ptr [edi+14h]
and eax,dword ptr [edi+0Ch]
and edx,dword ptr [edi]
xor eax,dword ptr [edi+10h]
xor edx,dword ptr [edi+1Ch]
xor eax,dword ptr [edi]
mov ebx,dword ptr [edi+0Ch]
xor ecx,dword ptr [edi+4h]
and ebx,dword ptr [edi+10h]
xor edx,ecx
and eax,dword ptr [edi+14h]
and edx,dword ptr [edi+18h]
xor ebx,dword ptr [edi+4h]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+8h],0Bh
add eax,dword ptr [esi+64h]
add eax,0EB151B88h
add dword ptr [edi+8h],eax
mov edx,dword ptr [edi+8h]
mov ecx,dword ptr [edi+0Ch]
not edx
mov eax,dword ptr [edi+18h]
or ecx,dword ptr [edi+10h]
and eax,dword ptr [edi+8h]
and edx,dword ptr [edi+1Ch]
xor eax,dword ptr [edi+0Ch]
xor edx,dword ptr [edi+18h]
xor eax,dword ptr [edi+1Ch]
mov ebx,dword ptr [edi+8h]
xor ecx,dword ptr [edi]
and ebx,dword ptr [edi+0Ch]
xor edx,ecx
and eax,dword ptr [edi+10h]
and edx,dword ptr [edi+14h]
xor ebx,dword ptr [edi]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+4h],0Bh
add eax,dword ptr [esi+4Ch]
add eax,23893E81h
add dword ptr [edi+4h],eax
mov edx,dword ptr [edi+4h]
mov ecx,dword ptr [edi+8h]
not edx
mov eax,dword ptr [edi+14h]
or ecx,dword ptr [edi+0Ch]
and eax,dword ptr [edi+4h]
and edx,dword ptr [edi+18h]
xor eax,dword ptr [edi+8h]
xor edx,dword ptr [edi+14h]
xor eax,dword ptr [edi+18h]
mov ebx,dword ptr [edi+4h]
xor ecx,dword ptr [edi+1Ch]
and ebx,dword ptr [edi+8h]
xor edx,ecx
and eax,dword ptr [edi+0Ch]
and edx,dword ptr [edi+10h]
xor ebx,dword ptr [edi+1Ch]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi],0Bh
add eax,dword ptr [esi+0Ch]
add eax,0D396ACC5h
add dword ptr [edi],eax
mov edx,dword ptr [edi]
mov ecx,dword ptr [edi+4h]
not edx
mov eax,dword ptr [edi+10h]
or ecx,dword ptr [edi+8h]
and eax,dword ptr [edi]
and edx,dword ptr [edi+14h]
xor eax,dword ptr [edi+4h]
xor edx,dword ptr [edi+10h]
xor eax,dword ptr [edi+14h]
mov ebx,dword ptr [edi]
xor ecx,dword ptr [edi+18h]
and ebx,dword ptr [edi+4h]
xor edx,ecx
and eax,dword ptr [edi+8h]
and edx,dword ptr [edi+0Ch]
xor ebx,dword ptr [edi+18h]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+1Ch],0Bh
add eax,dword ptr [esi+58h]
add eax,0F6D6FF3h
add dword ptr [edi+1Ch],eax
mov edx,dword ptr [edi+1Ch]
mov ecx,dword ptr [edi]
not edx
mov eax,dword ptr [edi+0Ch]
or ecx,dword ptr [edi+4h]
and eax,dword ptr [edi+1Ch]
and edx,dword ptr [edi+10h]
xor eax,dword ptr [edi]
xor edx,dword ptr [edi+0Ch]
xor eax,dword ptr [edi+10h]
mov ebx,dword ptr [edi+1Ch]
xor ecx,dword ptr [edi+14h]
and ebx,dword ptr [edi]
xor edx,ecx
and eax,dword ptr [edi+4h]
and edx,dword ptr [edi+8h]
xor ebx,dword ptr [edi+14h]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+18h],0Bh
add eax,dword ptr [esi+2Ch]
add eax,83F44239h
add dword ptr [edi+18h],eax
mov edx,dword ptr [edi+18h]
mov ecx,dword ptr [edi+1Ch]
not edx
mov eax,dword ptr [edi+8h]
or ecx,dword ptr [edi]
and eax,dword ptr [edi+18h]
and edx,dword ptr [edi+0Ch]
xor eax,dword ptr [edi+1Ch]
xor edx,dword ptr [edi+8h]
xor eax,dword ptr [edi+0Ch]
mov ebx,dword ptr [edi+18h]
xor ecx,dword ptr [edi+10h]
and ebx,dword ptr [edi+1Ch]
xor edx,ecx
and eax,dword ptr [edi]
and edx,dword ptr [edi+4h]
xor ebx,dword ptr [edi+10h]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+14h],0Bh
add eax,dword ptr [esi+7Ch]
add eax,2E0B4482h
add dword ptr [edi+14h],eax
mov edx,dword ptr [edi+14h]
mov ecx,dword ptr [edi+18h]
not edx
mov eax,dword ptr [edi+4h]
or ecx,dword ptr [edi+1Ch]
and eax,dword ptr [edi+14h]
and edx,dword ptr [edi+8h]
xor eax,dword ptr [edi+18h]
xor edx,dword ptr [edi+4h]
xor eax,dword ptr [edi+8h]
mov ebx,dword ptr [edi+14h]
xor ecx,dword ptr [edi+0Ch]
and ebx,dword ptr [edi+18h]
xor edx,ecx
and eax,dword ptr [edi+1Ch]
and edx,dword ptr [edi]
xor ebx,dword ptr [edi+0Ch]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+10h],0Bh
add eax,dword ptr [esi+54h]
add eax,0A4842004h
add dword ptr [edi+10h],eax
mov edx,dword ptr [edi+10h]
mov ecx,dword ptr [edi+14h]
not edx
mov eax,dword ptr [edi]
or ecx,dword ptr [edi+18h]
and eax,dword ptr [edi+10h]
and edx,dword ptr [edi+4h]
xor eax,dword ptr [edi+14h]
xor edx,dword ptr [edi]
xor eax,dword ptr [edi+4h]
mov ebx,dword ptr [edi+10h]
xor ecx,dword ptr [edi+8h]
and ebx,dword ptr [edi+14h]
xor edx,ecx
and eax,dword ptr [edi+18h]
and edx,dword ptr [edi+1Ch]
xor ebx,dword ptr [edi+8h]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+0Ch],0Bh
add eax,dword ptr [esi+20h]
add eax,69C8F04Ah
add dword ptr [edi+0Ch],eax
mov edx,dword ptr [edi+0Ch]
mov ecx,dword ptr [edi+10h]
not edx
mov eax,dword ptr [edi+1Ch]
or ecx,dword ptr [edi+14h]
and eax,dword ptr [edi+0Ch]
and edx,dword ptr [edi]
xor eax,dword ptr [edi+10h]
xor edx,dword ptr [edi+1Ch]
xor eax,dword ptr [edi]
mov ebx,dword ptr [edi+0Ch]
xor ecx,dword ptr [edi+4h]
and ebx,dword ptr [edi+10h]
xor edx,ecx
and eax,dword ptr [edi+14h]
and edx,dword ptr [edi+18h]
xor ebx,dword ptr [edi+4h]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+8h],0Bh
add eax,dword ptr [esi+6Ch]
add eax,9E1F9B5Eh
add dword ptr [edi+8h],eax
mov edx,dword ptr [edi+8h]
mov ecx,dword ptr [edi+0Ch]
not edx
mov eax,dword ptr [edi+18h]
or ecx,dword ptr [edi+10h]
and eax,dword ptr [edi+8h]
and edx,dword ptr [edi+1Ch]
xor eax,dword ptr [edi+0Ch]
xor edx,dword ptr [edi+18h]
xor eax,dword ptr [edi+1Ch]
mov ebx,dword ptr [edi+8h]
xor ecx,dword ptr [edi]
and ebx,dword ptr [edi+0Ch]
xor edx,ecx
and eax,dword ptr [edi+10h]
and edx,dword ptr [edi+14h]
xor ebx,dword ptr [edi]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+4h],0Bh
add eax,dword ptr [esi+30h]
add eax,21C66842h
add dword ptr [edi+4h],eax
mov edx,dword ptr [edi+4h]
mov ecx,dword ptr [edi+8h]
not edx
mov eax,dword ptr [edi+14h]
or ecx,dword ptr [edi+0Ch]
and eax,dword ptr [edi+4h]
and edx,dword ptr [edi+18h]
xor eax,dword ptr [edi+8h]
xor edx,dword ptr [edi+14h]
xor eax,dword ptr [edi+18h]
mov ebx,dword ptr [edi+4h]
xor ecx,dword ptr [edi+1Ch]
and ebx,dword ptr [edi+8h]
xor edx,ecx
and eax,dword ptr [edi+0Ch]
and edx,dword ptr [edi+10h]
xor ebx,dword ptr [edi+1Ch]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi],0Bh
add eax,dword ptr [esi+24h]
add eax,0F6E96C9Fh
add dword ptr [edi],eax
mov edx,dword ptr [edi]
mov ecx,dword ptr [edi+4h]
not edx
mov eax,dword ptr [edi+10h]
or ecx,dword ptr [edi+8h]
and eax,dword ptr [edi]
and edx,dword ptr [edi+14h]
xor eax,dword ptr [edi+4h]
xor edx,dword ptr [edi+10h]
xor eax,dword ptr [edi+14h]
mov ebx,dword ptr [edi]
xor ecx,dword ptr [edi+18h]
and ebx,dword ptr [edi+4h]
xor edx,ecx
and eax,dword ptr [edi+8h]
and edx,dword ptr [edi+0Ch]
xor ebx,dword ptr [edi+18h]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+1Ch],0Bh
add eax,dword ptr [esi+4h]
add eax,770C1C61h
add dword ptr [edi+1Ch],eax
mov edx,dword ptr [edi+1Ch]
mov ecx,dword ptr [edi]
not edx
mov eax,dword ptr [edi+0Ch]
or ecx,dword ptr [edi+4h]
and eax,dword ptr [edi+1Ch]
and edx,dword ptr [edi+10h]
xor eax,dword ptr [edi]
xor edx,dword ptr [edi+0Ch]
xor eax,dword ptr [edi+10h]
mov ebx,dword ptr [edi+1Ch]
xor ecx,dword ptr [edi+14h]
and ebx,dword ptr [edi]
xor edx,ecx
and eax,dword ptr [edi+4h]
and edx,dword ptr [edi+8h]
xor ebx,dword ptr [edi+14h]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+18h],0Bh
add eax,dword ptr [esi+74h]
add eax,0ABD388F0h
add dword ptr [edi+18h],eax
mov edx,dword ptr [edi+18h]
mov ecx,dword ptr [edi+1Ch]
not edx
mov eax,dword ptr [edi+8h]
or ecx,dword ptr [edi]
and eax,dword ptr [edi+18h]
and edx,dword ptr [edi+0Ch]
xor eax,dword ptr [edi+1Ch]
xor edx,dword ptr [edi+8h]
xor eax,dword ptr [edi+0Ch]
mov ebx,dword ptr [edi+18h]
xor ecx,dword ptr [edi+10h]
and ebx,dword ptr [edi+1Ch]
xor edx,ecx
and eax,dword ptr [edi]
and edx,dword ptr [edi+4h]
xor ebx,dword ptr [edi+10h]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+14h],0Bh
add eax,dword ptr [esi+14h]
add eax,6A51A0D2h
add dword ptr [edi+14h],eax
mov edx,dword ptr [edi+14h]
mov ecx,dword ptr [edi+18h]
not edx
mov eax,dword ptr [edi+4h]
or ecx,dword ptr [edi+1Ch]
and eax,dword ptr [edi+14h]
and edx,dword ptr [edi+8h]
xor eax,dword ptr [edi+18h]
xor edx,dword ptr [edi+4h]
xor eax,dword ptr [edi+8h]
mov ebx,dword ptr [edi+14h]
xor ecx,dword ptr [edi+0Ch]
and ebx,dword ptr [edi+18h]
xor edx,ecx
and eax,dword ptr [edi+1Ch]
and edx,dword ptr [edi]
xor ebx,dword ptr [edi+0Ch]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+10h],0Bh
add eax,dword ptr [esi+3Ch]
add eax,0D8542F68h
add dword ptr [edi+10h],eax
mov edx,dword ptr [edi+10h]
mov ecx,dword ptr [edi+14h]
not edx
mov eax,dword ptr [edi]
or ecx,dword ptr [edi+18h]
and eax,dword ptr [edi+10h]
and edx,dword ptr [edi+4h]
xor eax,dword ptr [edi+14h]
xor edx,dword ptr [edi]
xor eax,dword ptr [edi+4h]
mov ebx,dword ptr [edi+10h]
xor ecx,dword ptr [edi+8h]
and ebx,dword ptr [edi+14h]
xor edx,ecx
and eax,dword ptr [edi+18h]
and edx,dword ptr [edi+1Ch]
xor ebx,dword ptr [edi+8h]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+0Ch],0Bh
add eax,dword ptr [esi+44h]
add eax,960FA728h
add dword ptr [edi+0Ch],eax
mov edx,dword ptr [edi+0Ch]
mov ecx,dword ptr [edi+10h]
not edx
mov eax,dword ptr [edi+1Ch]
or ecx,dword ptr [edi+14h]
and eax,dword ptr [edi+0Ch]
and edx,dword ptr [edi]
xor eax,dword ptr [edi+10h]
xor edx,dword ptr [edi+1Ch]
xor eax,dword ptr [edi]
mov ebx,dword ptr [edi+0Ch]
xor ecx,dword ptr [edi+4h]
and ebx,dword ptr [edi+10h]
xor edx,ecx
and eax,dword ptr [edi+14h]
and edx,dword ptr [edi+18h]
xor ebx,dword ptr [edi+4h]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+8h],0Bh
add eax,dword ptr [esi+28h]
add eax,0AB5133A3h
add dword ptr [edi+8h],eax
mov edx,dword ptr [edi+8h]
mov ecx,dword ptr [edi+0Ch]
not edx
mov eax,dword ptr [edi+18h]
or ecx,dword ptr [edi+10h]
and eax,dword ptr [edi+8h]
and edx,dword ptr [edi+1Ch]
xor eax,dword ptr [edi+0Ch]
xor edx,dword ptr [edi+18h]
xor eax,dword ptr [edi+1Ch]
mov ebx,dword ptr [edi+8h]
xor ecx,dword ptr [edi]
and ebx,dword ptr [edi+0Ch]
xor edx,ecx
and eax,dword ptr [edi+10h]
and edx,dword ptr [edi+14h]
xor ebx,dword ptr [edi]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi+4h],0Bh
add eax,dword ptr [esi+40h]
add eax,6EEF0C6Ch
add dword ptr [edi+4h],eax
mov edx,dword ptr [edi+4h]
mov ecx,dword ptr [edi+8h]
not edx
mov eax,dword ptr [edi+14h]
or ecx,dword ptr [edi+0Ch]
and eax,dword ptr [edi+4h]
and edx,dword ptr [edi+18h]
xor eax,dword ptr [edi+8h]
xor edx,dword ptr [edi+14h]
xor eax,dword ptr [edi+18h]
mov ebx,dword ptr [edi+4h]
xor ecx,dword ptr [edi+1Ch]
and ebx,dword ptr [edi+8h]
xor edx,ecx
and eax,dword ptr [edi+0Ch]
and edx,dword ptr [edi+10h]
xor ebx,dword ptr [edi+1Ch]
xor eax,edx
xor eax,ebx
ror eax,7h
ror dword ptr [edi],0Bh
add eax,dword ptr [esi+34h]
add eax,137A3BE4h
add dword ptr [edi],eax
mov ecx,dword ptr [edi+4h]
mov edx,dword ptr [edi+18h]
and ecx,dword ptr [edi+10h]
mov eax,dword ptr [edi+4h]
and ecx,edx
xor eax,dword ptr [edi+10h]
xor ecx,dword ptr [edi]
and eax,dword ptr [edi+14h]
and ecx,dword ptr [edi+0Ch]
xor eax,dword ptr [edi+4h]
and edx,dword ptr [edi+8h]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+1Ch],0Bh
add eax,dword ptr [esi+6Ch]
add eax,0BA3BF050h
add dword ptr [edi+1Ch],eax
mov ecx,dword ptr [edi]
mov edx,dword ptr [edi+14h]
and ecx,dword ptr [edi+0Ch]
mov eax,dword ptr [edi]
and ecx,edx
xor eax,dword ptr [edi+0Ch]
xor ecx,dword ptr [edi+1Ch]
and eax,dword ptr [edi+10h]
and ecx,dword ptr [edi+8h]
xor eax,dword ptr [edi]
and edx,dword ptr [edi+4h]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+18h],0Bh
add eax,dword ptr [esi+0Ch]
add eax,7EFB2A98h
add dword ptr [edi+18h],eax
mov ecx,dword ptr [edi+1Ch]
mov edx,dword ptr [edi+10h]
and ecx,dword ptr [edi+8h]
mov eax,dword ptr [edi+1Ch]
and ecx,edx
xor eax,dword ptr [edi+8h]
xor ecx,dword ptr [edi+18h]
and eax,dword ptr [edi+0Ch]
and ecx,dword ptr [edi+4h]
xor eax,dword ptr [edi+1Ch]
and edx,dword ptr [edi]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+14h],0Bh
add eax,dword ptr [esi+54h]
add eax,0A1F1651Dh
add dword ptr [edi+14h],eax
mov ecx,dword ptr [edi+18h]
mov edx,dword ptr [edi+0Ch]
and ecx,dword ptr [edi+4h]
mov eax,dword ptr [edi+18h]
and ecx,edx
xor eax,dword ptr [edi+4h]
xor ecx,dword ptr [edi+14h]
and eax,dword ptr [edi+8h]
and ecx,dword ptr [edi]
xor eax,dword ptr [edi+18h]
and edx,dword ptr [edi+1Ch]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+10h],0Bh
add eax,dword ptr [esi+68h]
add eax,39AF0176h
add dword ptr [edi+10h],eax
mov ecx,dword ptr [edi+14h]
mov edx,dword ptr [edi+8h]
and ecx,dword ptr [edi]
mov eax,dword ptr [edi+14h]
and ecx,edx
xor eax,dword ptr [edi]
xor ecx,dword ptr [edi+10h]
and eax,dword ptr [edi+4h]
and ecx,dword ptr [edi+1Ch]
xor eax,dword ptr [edi+14h]
and edx,dword ptr [edi+18h]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+0Ch],0Bh
add eax,dword ptr [esi+44h]
add eax,66CA593Eh
add dword ptr [edi+0Ch],eax
mov ecx,dword ptr [edi+10h]
mov edx,dword ptr [edi+4h]
and ecx,dword ptr [edi+1Ch]
mov eax,dword ptr [edi+10h]
and ecx,edx
xor eax,dword ptr [edi+1Ch]
xor ecx,dword ptr [edi+0Ch]
and eax,dword ptr [edi]
and ecx,dword ptr [edi+18h]
xor eax,dword ptr [edi+10h]
and edx,dword ptr [edi+14h]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+8h],0Bh
add eax,dword ptr [esi+2Ch]
add eax,82430E88h
add dword ptr [edi+8h],eax
mov ecx,dword ptr [edi+0Ch]
mov edx,dword ptr [edi]
and ecx,dword ptr [edi+18h]
mov eax,dword ptr [edi+0Ch]
and ecx,edx
xor eax,dword ptr [edi+18h]
xor ecx,dword ptr [edi+8h]
and eax,dword ptr [edi+1Ch]
and ecx,dword ptr [edi+14h]
xor eax,dword ptr [edi+0Ch]
and edx,dword ptr [edi+10h]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+4h],0Bh
add eax,dword ptr [esi+50h]
add eax,8CEE8619h
add dword ptr [edi+4h],eax
mov ecx,dword ptr [edi+8h]
mov edx,dword ptr [edi+1Ch]
and ecx,dword ptr [edi+14h]
mov eax,dword ptr [edi+8h]
and ecx,edx
xor eax,dword ptr [edi+14h]
xor ecx,dword ptr [edi+4h]
and eax,dword ptr [edi+18h]
and ecx,dword ptr [edi+10h]
xor eax,dword ptr [edi+8h]
and edx,dword ptr [edi+0Ch]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi],0Bh
add eax,dword ptr [esi+74h]
add eax,456F9FB4h
add dword ptr [edi],eax
mov ecx,dword ptr [edi+4h]
mov edx,dword ptr [edi+18h]
and ecx,dword ptr [edi+10h]
mov eax,dword ptr [edi+4h]
and ecx,edx
xor eax,dword ptr [edi+10h]
xor ecx,dword ptr [edi]
and eax,dword ptr [edi+14h]
and ecx,dword ptr [edi+0Ch]
xor eax,dword ptr [edi+4h]
and edx,dword ptr [edi+8h]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+1Ch],0Bh
add eax,dword ptr [esi+4Ch]
add eax,7D84A5C3h
add dword ptr [edi+1Ch],eax
mov ecx,dword ptr [edi]
mov edx,dword ptr [edi+14h]
and ecx,dword ptr [edi+0Ch]
mov eax,dword ptr [edi]
and ecx,edx
xor eax,dword ptr [edi+0Ch]
xor ecx,dword ptr [edi+1Ch]
and eax,dword ptr [edi+10h]
and ecx,dword ptr [edi+8h]
xor eax,dword ptr [edi]
and edx,dword ptr [edi+4h]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+18h],0Bh
add eax,dword ptr [esi]
add eax,3B8B5EBEh
add dword ptr [edi+18h],eax
mov ecx,dword ptr [edi+1Ch]
mov edx,dword ptr [edi+10h]
and ecx,dword ptr [edi+8h]
mov eax,dword ptr [edi+1Ch]
and ecx,edx
xor eax,dword ptr [edi+8h]
xor ecx,dword ptr [edi+18h]
and eax,dword ptr [edi+0Ch]
and ecx,dword ptr [edi+4h]
xor eax,dword ptr [edi+1Ch]
and edx,dword ptr [edi]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+14h],0Bh
add eax,dword ptr [esi+30h]
add eax,0E06F75D8h
add dword ptr [edi+14h],eax
mov ecx,dword ptr [edi+18h]
mov edx,dword ptr [edi+0Ch]
and ecx,dword ptr [edi+4h]
mov eax,dword ptr [edi+18h]
and ecx,edx
xor eax,dword ptr [edi+4h]
xor ecx,dword ptr [edi+14h]
and eax,dword ptr [edi+8h]
and ecx,dword ptr [edi]
xor eax,dword ptr [edi+18h]
and edx,dword ptr [edi+1Ch]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+10h],0Bh
add eax,dword ptr [esi+1Ch]
add eax,85C12073h
add dword ptr [edi+10h],eax
mov ecx,dword ptr [edi+14h]
mov edx,dword ptr [edi+8h]
and ecx,dword ptr [edi]
mov eax,dword ptr [edi+14h]
and ecx,edx
xor eax,dword ptr [edi]
xor ecx,dword ptr [edi+10h]
and eax,dword ptr [edi+4h]
and ecx,dword ptr [edi+1Ch]
xor eax,dword ptr [edi+14h]
and edx,dword ptr [edi+18h]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+0Ch],0Bh
add eax,dword ptr [esi+34h]
add eax,401A449Fh
add dword ptr [edi+0Ch],eax
mov ecx,dword ptr [edi+10h]
mov edx,dword ptr [edi+4h]
and ecx,dword ptr [edi+1Ch]
mov eax,dword ptr [edi+10h]
and ecx,edx
xor eax,dword ptr [edi+1Ch]
xor ecx,dword ptr [edi+0Ch]
and eax,dword ptr [edi]
and ecx,dword ptr [edi+18h]
xor eax,dword ptr [edi+10h]
and edx,dword ptr [edi+14h]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+8h],0Bh
add eax,dword ptr [esi+20h]
add eax,56C16AA6h
add dword ptr [edi+8h],eax
mov ecx,dword ptr [edi+0Ch]
mov edx,dword ptr [edi]
and ecx,dword ptr [edi+18h]
mov eax,dword ptr [edi+0Ch]
and ecx,edx
xor eax,dword ptr [edi+18h]
xor ecx,dword ptr [edi+8h]
and eax,dword ptr [edi+1Ch]
and ecx,dword ptr [edi+14h]
xor eax,dword ptr [edi+0Ch]
and edx,dword ptr [edi+10h]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+4h],0Bh
add eax,dword ptr [esi+7Ch]
add eax,4ED3AA62h
add dword ptr [edi+4h],eax
mov ecx,dword ptr [edi+8h]
mov edx,dword ptr [edi+1Ch]
and ecx,dword ptr [edi+14h]
mov eax,dword ptr [edi+8h]
and ecx,edx
xor eax,dword ptr [edi+14h]
xor ecx,dword ptr [edi+4h]
and eax,dword ptr [edi+18h]
and ecx,dword ptr [edi+10h]
xor eax,dword ptr [edi+8h]
and edx,dword ptr [edi+0Ch]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi],0Bh
add eax,dword ptr [esi+28h]
add eax,363F7706h
add dword ptr [edi],eax
mov ecx,dword ptr [edi+4h]
mov edx,dword ptr [edi+18h]
and ecx,dword ptr [edi+10h]
mov eax,dword ptr [edi+4h]
and ecx,edx
xor eax,dword ptr [edi+10h]
xor ecx,dword ptr [edi]
and eax,dword ptr [edi+14h]
and ecx,dword ptr [edi+0Ch]
xor eax,dword ptr [edi+4h]
and edx,dword ptr [edi+8h]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+1Ch],0Bh
add eax,dword ptr [esi+14h]
add eax,1BFEDF72h
add dword ptr [edi+1Ch],eax
mov ecx,dword ptr [edi]
mov edx,dword ptr [edi+14h]
and ecx,dword ptr [edi+0Ch]
mov eax,dword ptr [edi]
and ecx,edx
xor eax,dword ptr [edi+0Ch]
xor ecx,dword ptr [edi+1Ch]
and eax,dword ptr [edi+10h]
and ecx,dword ptr [edi+8h]
xor eax,dword ptr [edi]
and edx,dword ptr [edi+4h]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+18h],0Bh
add eax,dword ptr [esi+24h]
add eax,429B723Dh
add dword ptr [edi+18h],eax
mov ecx,dword ptr [edi+1Ch]
mov edx,dword ptr [edi+10h]
and ecx,dword ptr [edi+8h]
mov eax,dword ptr [edi+1Ch]
and ecx,edx
xor eax,dword ptr [edi+8h]
xor ecx,dword ptr [edi+18h]
and eax,dword ptr [edi+0Ch]
and ecx,dword ptr [edi+4h]
xor eax,dword ptr [edi+1Ch]
and edx,dword ptr [edi]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+14h],0Bh
add eax,dword ptr [esi+38h]
add eax,37D0D724h
add dword ptr [edi+14h],eax
mov ecx,dword ptr [edi+18h]
mov edx,dword ptr [edi+0Ch]
and ecx,dword ptr [edi+4h]
mov eax,dword ptr [edi+18h]
and ecx,edx
xor eax,dword ptr [edi+4h]
xor ecx,dword ptr [edi+14h]
and eax,dword ptr [edi+8h]
and ecx,dword ptr [edi]
xor eax,dword ptr [edi+18h]
and edx,dword ptr [edi+1Ch]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+10h],0Bh
add eax,dword ptr [esi+78h]
add eax,0D00A1248h
add dword ptr [edi+10h],eax
mov ecx,dword ptr [edi+14h]
mov edx,dword ptr [edi+8h]
and ecx,dword ptr [edi]
mov eax,dword ptr [edi+14h]
and ecx,edx
xor eax,dword ptr [edi]
xor ecx,dword ptr [edi+10h]
and eax,dword ptr [edi+4h]
and ecx,dword ptr [edi+1Ch]
xor eax,dword ptr [edi+14h]
and edx,dword ptr [edi+18h]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+0Ch],0Bh
add eax,dword ptr [esi+48h]
add eax,0DB0FEAD3h
add dword ptr [edi+0Ch],eax
mov ecx,dword ptr [edi+10h]
mov edx,dword ptr [edi+4h]
and ecx,dword ptr [edi+1Ch]
mov eax,dword ptr [edi+10h]
and ecx,edx
xor eax,dword ptr [edi+1Ch]
xor ecx,dword ptr [edi+0Ch]
and eax,dword ptr [edi]
and ecx,dword ptr [edi+18h]
xor eax,dword ptr [edi+10h]
and edx,dword ptr [edi+14h]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+8h],0Bh
add eax,dword ptr [esi+18h]
add eax,49F1C09Bh
add dword ptr [edi+8h],eax
mov ecx,dword ptr [edi+0Ch]
mov edx,dword ptr [edi]
and ecx,dword ptr [edi+18h]
mov eax,dword ptr [edi+0Ch]
and ecx,edx
xor eax,dword ptr [edi+18h]
xor ecx,dword ptr [edi+8h]
and eax,dword ptr [edi+1Ch]
and ecx,dword ptr [edi+14h]
xor eax,dword ptr [edi+0Ch]
and edx,dword ptr [edi+10h]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+4h],0Bh
add eax,dword ptr [esi+70h]
add eax,75372C9h
add dword ptr [edi+4h],eax
mov ecx,dword ptr [edi+8h]
mov edx,dword ptr [edi+1Ch]
and ecx,dword ptr [edi+14h]
mov eax,dword ptr [edi+8h]
and ecx,edx
xor eax,dword ptr [edi+14h]
xor ecx,dword ptr [edi+4h]
and eax,dword ptr [edi+18h]
and ecx,dword ptr [edi+10h]
xor eax,dword ptr [edi+8h]
and edx,dword ptr [edi+0Ch]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi],0Bh
add eax,dword ptr [esi+60h]
add eax,80991B7Bh
add dword ptr [edi],eax
mov ecx,dword ptr [edi+4h]
mov edx,dword ptr [edi+18h]
and ecx,dword ptr [edi+10h]
mov eax,dword ptr [edi+4h]
and ecx,edx
xor eax,dword ptr [edi+10h]
xor ecx,dword ptr [edi]
and eax,dword ptr [edi+14h]
and ecx,dword ptr [edi+0Ch]
xor eax,dword ptr [edi+4h]
and edx,dword ptr [edi+8h]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+1Ch],0Bh
add eax,dword ptr [esi+8h]
add eax,25D479D8h
add dword ptr [edi+1Ch],eax
mov ecx,dword ptr [edi]
mov edx,dword ptr [edi+14h]
and ecx,dword ptr [edi+0Ch]
mov eax,dword ptr [edi]
and ecx,edx
xor eax,dword ptr [edi+0Ch]
xor ecx,dword ptr [edi+1Ch]
and eax,dword ptr [edi+10h]
and ecx,dword ptr [edi+8h]
xor eax,dword ptr [edi]
and edx,dword ptr [edi+4h]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+18h],0Bh
add eax,dword ptr [esi+5Ch]
add eax,0F6E8DEF7h
add dword ptr [edi+18h],eax
mov ecx,dword ptr [edi+1Ch]
mov edx,dword ptr [edi+10h]
and ecx,dword ptr [edi+8h]
mov eax,dword ptr [edi+1Ch]
and ecx,edx
xor eax,dword ptr [edi+8h]
xor ecx,dword ptr [edi+18h]
and eax,dword ptr [edi+0Ch]
and ecx,dword ptr [edi+4h]
xor eax,dword ptr [edi+1Ch]
and edx,dword ptr [edi]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+14h],0Bh
add eax,dword ptr [esi+40h]
add eax,0E3FE501Ah
add dword ptr [edi+14h],eax
mov ecx,dword ptr [edi+18h]
mov edx,dword ptr [edi+0Ch]
and ecx,dword ptr [edi+4h]
mov eax,dword ptr [edi+18h]
and ecx,edx
xor eax,dword ptr [edi+4h]
xor ecx,dword ptr [edi+14h]
and eax,dword ptr [edi+8h]
and ecx,dword ptr [edi]
xor eax,dword ptr [edi+18h]
and edx,dword ptr [edi+1Ch]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+10h],0Bh
add eax,dword ptr [esi+58h]
add eax,0B6794C3Bh
add dword ptr [edi+10h],eax
mov ecx,dword ptr [edi+14h]
mov edx,dword ptr [edi+8h]
and ecx,dword ptr [edi]
mov eax,dword ptr [edi+14h]
and ecx,edx
xor eax,dword ptr [edi]
xor ecx,dword ptr [edi+10h]
and eax,dword ptr [edi+4h]
and ecx,dword ptr [edi+1Ch]
xor eax,dword ptr [edi+14h]
and edx,dword ptr [edi+18h]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+0Ch],0Bh
add eax,dword ptr [esi+10h]
add eax,976CE0BDh
add dword ptr [edi+0Ch],eax
mov ecx,dword ptr [edi+10h]
mov edx,dword ptr [edi+4h]
and ecx,dword ptr [edi+1Ch]
mov eax,dword ptr [edi+10h]
and ecx,edx
xor eax,dword ptr [edi+1Ch]
xor ecx,dword ptr [edi+0Ch]
and eax,dword ptr [edi]
and ecx,dword ptr [edi+18h]
xor eax,dword ptr [edi+10h]
and edx,dword ptr [edi+14h]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+8h],0Bh
add eax,dword ptr [esi+4h]
add eax,84C006BAh
add dword ptr [edi+8h],eax
mov ecx,dword ptr [edi+0Ch]
mov edx,dword ptr [edi]
and ecx,dword ptr [edi+18h]
mov eax,dword ptr [edi+0Ch]
and ecx,edx
xor eax,dword ptr [edi+18h]
xor ecx,dword ptr [edi+8h]
and eax,dword ptr [edi+1Ch]
and ecx,dword ptr [edi+14h]
xor eax,dword ptr [edi+0Ch]
and edx,dword ptr [edi+10h]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi+4h],0Bh
add eax,dword ptr [esi+64h]
add eax,0C1A94FB6h
add dword ptr [edi+4h],eax
mov ecx,dword ptr [edi+8h]
mov edx,dword ptr [edi+1Ch]
and ecx,dword ptr [edi+14h]
mov eax,dword ptr [edi+8h]
and ecx,edx
xor eax,dword ptr [edi+14h]
xor ecx,dword ptr [edi+4h]
and eax,dword ptr [edi+18h]
and ecx,dword ptr [edi+10h]
xor eax,dword ptr [edi+8h]
and edx,dword ptr [edi+0Ch]
xor eax,ecx
xor eax,edx
ror eax,7h
ror dword ptr [edi],0Bh
add eax,dword ptr [esi+3Ch]
add eax,409F63C4h
add dword ptr [edi],eax
mov edx,dword ptr [edi]
mov ecx,dword ptr [edi+4h]
mov ebx,dword ptr [edi+8h]
mov eax,dword ptr [edi+0Ch]
add edx,dword ptr [haval_buf+0h]
add ecx,dword ptr [haval_buf+4h]
add ebx,dword ptr [haval_buf+8h]
add eax,dword ptr [haval_buf+0Ch]
mov dword ptr [haval_buf+0h],edx
mov dword ptr [haval_buf+4h],ecx
mov dword ptr [haval_buf+8h],ebx
mov dword ptr [haval_buf+0Ch],eax
mov dword ptr [edi],edx
mov dword ptr [edi+4h],ecx
mov dword ptr [edi+8h],ebx
mov dword ptr [edi+0Ch],eax
mov edx,dword ptr [edi+10h]
mov ecx,dword ptr [edi+14h]
mov ebx,dword ptr [edi+18h]
mov eax,dword ptr [edi+1Ch]
add edx,dword ptr [haval_buf+10h]
add ecx,dword ptr [haval_buf+14h]
add ebx,dword ptr [haval_buf+18h]
add eax,dword ptr [haval_buf+1Ch]
mov dword ptr [haval_buf+10h],edx
mov dword ptr [haval_buf+14h],ecx
mov dword ptr [haval_buf+18h],ebx
mov dword ptr [haval_buf+1Ch],eax
mov dword ptr [edi+10h],edx
mov dword ptr [edi+14h],ecx
mov dword ptr [edi+18h],ebx
mov dword ptr [edi+1Ch],eax
sub dword ptr [haval_dw2],80h
add esi,80h
jmp LABEL_0x00401A90 ; => 0x00401A90

LABEL_0x00403D40:
cmp byte ptr [haval_flag1],0h
je LABEL_0x00403DC6 ; => 0x00403DC6
mov ecx,dword ptr [haval_dw2]
mov byte ptr [haval_flag1],0h
mov dword ptr [haval_dw2],80h
mov eax,ecx
mov edi,offset haval_buf3
test eax,eax
je LABEL_0x00403D78 ; => 0x00403D78

LABEL_0x00403D6B:
mov bl,byte ptr [ecx+esi-1h]
mov byte ptr [ecx+edi-1h],bl
dec ecx
jne LABEL_0x00403D6B ; => 0x00403D6B
add edi,eax

LABEL_0x00403D78:
mov byte ptr [edi],80h
mov ecx,eax
inc edi
sub ecx,75h
neg ecx
je LABEL_0x00403D9C ; => 0x00403D9C
jns LABEL_0x00403D97 ; => 0x00403D97
add dword ptr [haval_dw2],80h
add ecx,80h

LABEL_0x00403D97:
xor al,al
cld 
rep stosb 

LABEL_0x00403D9C:
mov word ptr [edi],2029h
add edi,2h
xor edx,edx
mov eax,dword ptr [haval_inputbuflen]
mov ebx,8h
mul ebx
mov dword ptr [edi],eax
mov dword ptr [edi+4h],edx
mov esi,offset haval_buf3
mov edi,offset haval_buf2
jmp LABEL_0x00401A90 ; => 0x00401A90

LABEL_0x00403DC6:
mov esi,dword ptr [ebp+8h]
mov cx,word ptr [edi+1Bh]
mov dl,byte ptr [edi+1Dh]
shl ecx,10h
shl edx,10h
mov ch,byte ptr [edi+16h]
mov dx,word ptr [edi+17h]
mov cl,byte ptr [edi+11h]
shl edx,8h
add ecx,dword ptr [edi]
mov dl,byte ptr [edi+12h]
mov dword ptr [esi],ecx
mov al,byte ptr [edi+19h]
mov bl,byte ptr [edi+1Ah]
add edx,dword ptr [edi+4h]
mov bh,byte ptr [edi+1Fh]
mov ah,byte ptr [edi+1Eh]
mov dword ptr [esi+4h],edx
shl ebx,10h
shl eax,10h
mov bl,byte ptr [edi+10h]
mov ax,word ptr [edi+13h]
mov bh,byte ptr [edi+15h]
add eax,dword ptr [edi+8h]
add ebx,dword ptr [edi+0Ch]
mov dword ptr [esi+8h],eax
mov dword ptr [esi+0Ch],ebx
mov edi,offset haval_buf+0h
mov ecx,53h
xor eax,eax
cld 
rep stosd 
popad 
leave 
ret 0Ch
; Finish of selected range: 0x00403E2B

d2k2_crackme06_haval endp

END