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

setcglob 0x00798544, MySideID
setcglob 0x006B8274, Win
setcglob 0x006B8278, Lose
setcglob 0x004E8BF0, DifficultyLevel
setcglob 0x00797E34, GameType

setcglob 0x007984C4, NetworkGame
setcglob 0x004E3B00, NetUnitCount
setcglob 0x004E3B04, NetTechLevel
setcglob 0x004E3B0C, NetAIPlayers
setcglob 0x004E8BEC, MaxPlayers
setcglob 0x004F3D3C, TournamentGame
setcglob 0x004F3D40, PrivateGame
setcglob 0x006B9834, NetCrates
setcglob 0x006B9838, NetWorms
setcglob 0x006B9848, NetPlayerHandicap

setcglob 0x007BCACC, AtreidesMoney

setcglob 0x005178C4, DebugMode



;; Functions

setcglob 0x0042DC00, TextOnScreen

setcglob 0x00459450, GenerateUnitMoveOrder
setcglob 0x004596F0, GenerateUnitAttackUnitOrder
setcglob 0x00455FC0, ModelBuildBuildingPick
setcglob 0x00455510, HandleGameLoopEvents


;setcglob <mystery-addr>, WinMain@16
