
; This header works with sym.asm which defines the Vanilla symbols
; This header will be split up as it becomes larger

; ### Constants ###

%assign Atreides 0
%assign Harkonnen 1
%assign Ordos 2

%assign Blue 0
%assign Red 1
%assign Teal 2
%assign Purple 3
%assign Gray 4
%assign Brown 5
%assign Gold 6
%assign LightBrown 7

; ### Global Variables ###

;Network settings
extern _SendRate
extern _ReconnectTimeOutToPlayer
extern _InitialConnectTimeOut

extern _UnknownNetVar1
extern _UnknownNetVar2
extern _UnknownNetVar3
extern _UnknownNetVar4
extern _UnknownNetVar5

;Others
extern _MousePositionX
extern _MousePositionY

extern _MySideID
extern _Win
extern _Lose
extern _DifficultyLevel
extern _GameType

extern _NetworkGame

;Multiplayer settings
extern _NetUnitCount
extern _NetTechLevel
extern _NetStartingCredits
extern _NetAIPlayers
extern _NetCrates
extern _NetWorms
extern _NetPlayerName
extern _NetPlayerSide
extern _NetPlayerColor
extern _NetPlayerHandicap
extern _NetIPAddress
extern _NetModemPhone
extern _NetSerialComPort

;Game settings
extern _FirstTimePlay
extern _ScrollRate
extern _GameSpeed
extern _GameBitsPerPixel
extern _SFXVolume
extern _MusicVolume

extern _MoviesEnabled
extern _SoundsEnabled
extern _SkipIntro
extern _VideoBackBuffer
extern _DebugMode
extern _ForceNoCD
extern _FullScreen
extern _Force480Height

;WOL
extern _AllowFindUser
extern _AllowPageUser
extern _LanguageFilter
extern _ShowAllGames
extern _Microphone

;Screen display stuff
extern _ScreenWidth
extern _ScreenHeight
extern _GameWidth
extern _GameHeight
extern _ScreenUnk1
extern _ScreenUnk2
extern _ScreenUnk3
extern _ScreenUnk4
extern _SideBarIconCount
extern _ScreenUnk6

extern _HighResAddedWidth
extern _HighResAddedHeight
extern _HighResPatchEnabled

;Others
extern _MaxPlayers
extern _TournamentGame
extern _PrivateGame
extern _NetPlayerHandicap

extern _AtreidesMoney


; ### Functions ###
extern _TextOnScreen

extern _GenerateUnitMoveOrder
extern _GenerateUnitAttackUnitOrder

extern _LoadDune2000Cfg
extern _SaveDune2000Cfg

extern _cinit
