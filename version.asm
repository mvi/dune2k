%include "macros/patch.inc"
%include "macros/hack.inc"

GameVersion db "1.06.1", 0

@HACK 0x0048BE05, ChangeGameVersion
	sub ecx, 5
	cmp ecx, 0x255
	jnz .out
	mov ebx, GameVersion
.out:
	push ecx
	push ebx
	jmp 0x0048BE0A
@ENDHACK
