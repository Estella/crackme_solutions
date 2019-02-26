.686p
.mmx                        ; enable MMX instructions
.xmm                        ; enable SSE instructions
.model flat, stdcall
option casemap:none

EXTERN d2k2_magic1:DWORD

.data 

haval_flag db 0
haval_val1 dd 0
haval_val2 dd 0
haval_buf db 20h dup(0)

vaclav  dd 0
.data?

.code

END