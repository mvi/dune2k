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

;; ### Variables ###

;Network settings
setcglob 0x4E3AEC, SendRate
setcglob 0x6B9460, ReconnectTimeOutToPlayer
setcglob 0x6B9644, InitialConnectTimeOut

setcglob 0x6B93E8, UnknownNetVar1 
setcglob 0x4E3AE8, UnknownNetVar2
setcglob 0x4E3B1C, UnknownNetVar3
setcglob 0x4E3AF0, UnknownNetVar4
setcglob 0x4E3AF4, UnknownNetVar5

;Others
setcglob 0x004EB048, MousePositionX
setcglob 0x004EB04C, MousePositionY

setcglob 0x00798544, MySideID
setcglob 0x006B8274, Win
setcglob 0x006B8278, Lose
setcglob 0x004E8BF0, DifficultyLevel
setcglob 0x00797E34, GameType

setcglob 0x007984C4, NetworkGame

;Multiplayer settings
setcglob 0x004E7ACC, FirstTimePlay
setcglob 0x004E3B00, NetUnitCount
setcglob 0x004E3B04, NetTechLevel
setcglob 0x004E3B08, NetStartingCredits
setcglob 0x004E3B0C, NetAIPlayers
setcglob 0x006B9834, NetCrates
setcglob 0x006B9838, NetWorms
setcglob 0x006B93F8, NetPlayerName
setcglob 0x006B9840, NetPlayerSide
setcglob 0x006B9844, NetPlayerColour
setcglob 0x007975D0, NetIPAddress
setcglob 0x00797960, NetModemPhone
setcglob 0x004E8BF4, NetSerialComPort

;Game settings
setcglob 0x004EB030, ScrollRate
setcglob 0x004E3B18, GameSpeed
setcglob 0x004EB01C, GameBitsPerPixel
setcglob 0x004E5FC4, SFXVolume
setcglob 0x004E5FC8, MusicVolume

;WOL
setcglob 0x004DB9D4, AllowFindUser
setcglob 0x004DB9D8, AllowPageUser
setcglob 0x004F3D00, LanguageFilter
setcglob 0x004F3D04, ShowAllGames
setcglob 0x004F3CF0, Microphone

;others
setcglob 0x004E8BEC, MaxPlayers
setcglob 0x004F3D3C, TournamentGame
setcglob 0x004F3D40, PrivateGame
setcglob 0x006B9848, NetPlayerHandicap

setcglob 0x007BCACC, AtreidesMoney

setcglob 0x005178C4, DebugMode

setcglob 0x004E8BEC, WOLGameRoomPlayerLimit

;; ### Functions ###

setcglob 0x0042DC00, TextOnScreen

setcglob 0x00459450, GenerateUnitMoveOrder
setcglob 0x004596F0, GenerateUnitAttackUnitOrder
setcglob 0x00455FC0, ModelBuildBuildingPick
setcglob 0x00455510, HandleGameLoopEvents

setcglob 0x00478C20, LoadDune2000Cfg
setcglob 0x00478FA0, SaveDune2000Cfg

; winapi
setcglob 0x008CF5EC, _imp__LoadLibraryA
setcglob 0x008CF584, _imp__GetProcAddress


;setcglob <mystery-addr>, WinMain@16
