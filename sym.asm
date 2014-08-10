;;
;; This file exists to define the locations of everything we know about the
;; vanilla exe.
;;
;; The idea is by separating knowledge about the vanilla exe from changes to it,
;; we make the code more clean. Also it means we don't need to hard-code the
;; symbols separately for C, C++, asm, etc.
;;
;; Symbols are defined with `setcglob` for C (remove leading underscore)
;;                     and  `setxglob` for C++ and C
;;

%include "macros/setsym.inc"

setcglob 0x004B2810, start

;; Variables

setcglob 0x004EB048, MousePositionX
setcglob 0x004EB04C, MousePositionY

;; Functions

setcglob 0x0042DC00, TextOnScreen


;setcglob <mystery-addr>, WinMain@16
