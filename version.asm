%include "macros/patch.inc"
%include "macros/hack.inc"
%include "macros/string.inc"

StringZ GameVersion, "V 1.06p rev.1 - FunkyFr3sh"

@HACK 0x0048BE05, ChangeGameVersion
	sub ecx, 120
	mov ebx, GameVersion
	push ecx
	push ebx
	jmp 0x0048BE0A
@ENDHACK
