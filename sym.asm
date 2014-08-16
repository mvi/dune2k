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

;Multiplayer settings
setcglob 0x004E3B00, NetUnitCount
setcglob 0x004E3B04, NetTechLevel
setcglob 0x004E3B08, NetStartingCredits
setcglob 0x004E3B0C, NetAIPlayers
setcglob 0x006B9834, NetCrates
setcglob 0x006B9838, NetWorms
setcglob 0x006B93F8, NetPlayerName
setcglob 0x006B9840, NetPlayerSide
setcglob 0x006B9844, NetPlayerColor
setcglob 0x006B9848, NetPlayerHandicap
setcglob 0x007975D0, NetIPAddress
setcglob 0x00797960, NetModemPhone
setcglob 0x004E8BF4, NetSerialComPort

;Game settings
setcglob 0x004E7ACC, FirstTimePlay
setcglob 0x004EB030, ScrollRate
setcglob 0x004E3B18, GameSpeed
setcglob 0x004EB01C, GameBitsPerPixel
setcglob 0x004E5FC4, SFXVolume
setcglob 0x004E5FC8, MusicVolume
setcglob 0x005178C4, DebugMode
setcglob 0x004eb008, FullScreen
setcglob 0x00797e30, ForceNoCD
setcglob 0x004EB004, MoviesEnabled ; -M = false
setcglob 0x004EB00C, SoundsEnabled ; -S = false
setcglob 0x005178A4, SkipIntro ; -N = true
setcglob 0x007984B4, Force8Bit ; -8 = true
setcglob 0x007984B8, Force16Bit ; -6 = true
setcglob 0x004EB010, VideoBackBuffer ; -F = false
setcglob 0x007984E4, Force480Height ; -G = true

;WOL
setcglob 0x004DB9D4, AllowFindUser
setcglob 0x004DB9D8, AllowPageUser
setcglob 0x004F3D00, LanguageFilter
setcglob 0x004F3D04, ShowAllGames
setcglob 0x004F3CF0, Microphone


;Screen display stuff
setcglob 0x004eb020, ScreenWidth
setcglob 0x004eb024, ScreenHeight
setcglob 0x004EB028, GameWidth
setcglob 0x004EB02C, GameHeight
setcglob 0x004E4214, ScreenUnk1
setcglob 0x004E420C, ScreenUnk2
setcglob 0x004E4204, ScreenUnk3
setcglob 0x004E41FC, ScreenUnk4
setcglob 0x004E41EC, SideBarIconCount
setcglob 0x004E41E4, ScreenUnk6

;others
setcglob 0x004EB048, MousePositionX
setcglob 0x004EB04C, MousePositionY

setcglob 0x00798544, MySideID
setcglob 0x006B8274, Win
setcglob 0x006B8278, Lose
setcglob 0x004E8BF0, DifficultyLevel
setcglob 0x00797E34, GameType

setcglob 0x007984C4, NetworkGame

setcglob 0x004E8BEC, MaxPlayers
setcglob 0x004F3D3C, TournamentGame
setcglob 0x004F3D40, PrivateGame

setcglob 0x007BCACC, AtreidesMoney

setcglob 0x004E8BEC, WOLGameRoomPlayerLimit

;; ### Functions ###

setcglob 0x005A3BB0, WinMain

setcglob 0x0042DC00, TextOnScreen

setcglob 0x00459450, GenerateUnitMoveOrder
setcglob 0x004596F0, GenerateUnitAttackUnitOrder
setcglob 0x00455FC0, ModelBuildBuildingPick
setcglob 0x00455510, HandleGameLoopEvents

setcglob 0x00478C20, LoadDune2000Cfg
setcglob 0x00478FA0, SaveDune2000Cfg

setcglob 0x00482690, Get_CD ;       Get_CD::Get_CD(void)
setcglob 0x004A39E0, Parse_Command_Line


; winapi
setcglob 0x008CF5EC, _imp__LoadLibraryA
setcglob 0x008CF584, _imp__GetProcAddress
setcglob 0x008CF598, _imp__GetStdHandle
setcglob 0x008CF4E4, _imp__WriteFile
setcglob 0x008CF4F8, _imp__OutputDebugStringA


; stdio
setcglob 0x004B15B0, vsprintf
setcglob 0x004B0670, sprintf
setcglob 0x004B2B60, strlen


setcglob 0x004b1700, tolower
setcglob 0x004b2ad0, strcmp
setcglob 0x004b0e30, malloc
setcglob 0x004b29e0, strcpy
setcglob 0x004b0ee0, free
setcglob 0x004b07a0, atoi
setcglob 0x004b08b0, strtok

setcglob 0x004B1890, cinit

;setcglob <mystery-addr>, WinMain@16



;; ### From Hyper, uncategorized ###

%assign SECT_TEXT  0x401000
%assign SECT_RDATA 0x4BE000
%assign SECT_DATA  0x4D9000
%assign SECT_IDATA 0x8CF000

;setcglob {SECT_TEXT  + 00000740}, ;       fptc
;setcglob {SECT_TEXT  + 00000A20}, ;       __assert
;setcglob {SECT_TEXT  + 00000AB0}, ;       Audio_Init(int)
;setcglob {SECT_TEXT  + 00000C40}, ;       __Init_Movie_Surface2
;setcglob {SECT_TEXT  + 000013D0}, ;       Set_Video_Mode(int,int,int)
;setcglob {SECT_TEXT  + 00002AA0}, ;       Anim_Init(void)
;setcglob {SECT_TEXT  + 00002AE0}, ;       VQA_403AE0
;setcglob {SECT_TEXT  + 00002B00}, ;       VQA_403B00
;setcglob {SECT_TEXT  + 00002CC0}, ;       __Init_Movie_Surface
;setcglob {SECT_TEXT  + 000055E0}, ;       __VQAClass_CTOR
;setcglob {SECT_TEXT  + 00006D90}, ;       strstreambuf::strstreambuf(int)
;setcglob {SECT_TEXT  + 0000B2A0}, ;       Set_Chat_Event(char)
;setcglob {SECT_TEXT  + 0000B2D0}, ;       Setup_Chat(int)
;setcglob {SECT_TEXT  + 0000B380}, ;       Shut_Down_Chat(void)
;setcglob {SECT_TEXT  + 0000B460}, ;       Connect_To_Westwood_Chat(int,int)
;setcglob {SECT_TEXT  + 0000BFC0}, ;       Process_WOLAPI_Messages(void)
;setcglob {SECT_TEXT  + 0000C290}, ;       Disconnect_From_Ladder_Server(void)
;setcglob {SECT_TEXT  + 0000C2D0}, ;       Send_Game_Results_To_Server(void)
;setcglob {SECT_TEXT  + 00016E50}, ;       Start_Host_INet_Game(void)
;setcglob {SECT_TEXT  + 00017010}, ;       Toggle_FindUser_State(int)
;setcglob {SECT_TEXT  + 00017140}, ;       Toggle_PageUser_State(int)
;setcglob {SECT_TEXT  + 00017270}, ;       Toggle_Microphone_State(int)
;setcglob {SECT_TEXT  + 00017F00}, ;       SetLangFilter_418F00
;setcglob {SECT_TEXT  + 00018040}, ;       ShowAllGames_419040
;setcglob {SECT_TEXT  + 00019F50}, ;       Init_AI(int)
;setcglob {SECT_TEXT  + 0001A250}, ;       Activate_AI(int)
;setcglob {SECT_TEXT  + 0001A610}, ;       Do_AI(void)
;setcglob {SECT_TEXT  + 0001A850}, ;       AI::Can_Build_Unit(int)
;setcglob {SECT_TEXT  + 0001A910}, ;       AI::Find_Best_Unit_To_Build(int)
;setcglob {SECT_TEXT  + 0001ABB0}, ;       AI::Get_Best_Building(int,int,int,float)
;setcglob {SECT_TEXT  + 0001B3E0}, ;       AI::Group_New_Units(int,int)
;setcglob {SECT_TEXT  + 0001B920}, ;       AI::Do_Attack_Buildings(void)
;setcglob {SECT_TEXT  + 0001BDB0}, ;       AI::Clear_Units(void)
;setcglob {SECT_TEXT  + 0001BDF0}, ;       AI::Best_Side_To_Attack(void)
;setcglob {SECT_TEXT  + 0001BE50}, ;       AI::Recalculate_Side_To_Attack(void)
;setcglob {SECT_TEXT  + 0001C070}, ;       AI::Monitor_Groups(int)
;setcglob {SECT_TEXT  + 0001D180}, ;       AI::Get_Best_Base_Position(int,int)
;setcglob {SECT_TEXT  + 0001D220}, ;       AI::Group_Stable(int)
;setcglob {SECT_TEXT  + 0001D270}, ;       AI::Recently_In_Action(int)
;setcglob {SECT_TEXT  + 0001D2C0}, ;       AI::Unit_Recently_In_Action(int)
;setcglob {SECT_TEXT  + 0001D310}, ;       AI::Unit_Recently_Hit(int)
;setcglob {SECT_TEXT  + 0001D650}, ;       AI::Do_Repair_Units(int,int)
;setcglob {SECT_TEXT  + 0001D860}, ;       AI::Group_At_Full_Health(int)
;setcglob {SECT_TEXT  + 0001D8C0}, ;       AI::Can_Spend_Cash(int,int)
;setcglob {SECT_TEXT  + 0001D920}, ;       AI::Get_Initial_Building_Positions(void)
;setcglob {SECT_TEXT  + 0001DAB0}, ;       AI::Monitor_Buildings(void)
;setcglob {SECT_TEXT  + 0001DBC0}, ;       AI::Rebuild_Buildings(void)
;setcglob {SECT_TEXT  + 0001E670}, ;       AI::Do_Stop_Start_Stuff(int,int,int)
;setcglob {SECT_TEXT  + 0001EC30}, ;       AI::Group_Exists(int)
;setcglob {SECT_TEXT  + 0001EC80}, ;       AI::Commence_Operation(int)
;setcglob {SECT_TEXT  + 0001EEA0}, ;       AI::Set_Unit_To_Guard(int)
;setcglob {SECT_TEXT  + 0001EEE0}, ;       AI::Attack_Best_Building(int,int,int)
;setcglob {SECT_TEXT  + 0001F010}, ;       AI::Attack_Object(int,int,int)
;setcglob {SECT_TEXT  + 0001F140}, ;       AI::Find_Most_Appropriate_Target(int,int,int)
;setcglob {SECT_TEXT  + 0001F300}, ;       AI::Should_I_Build_Harvester(void)
;setcglob {SECT_TEXT  + 0001F320}, ;       AI::Should_I_Build_Carryall(void)
;setcglob {SECT_TEXT  + 0001F350}, ;       AI::Should_I_Build_Unit(int)
;setcglob {SECT_TEXT  + 0001F3D0}, ;       AI::Do_Build_Carryalls(void)
;setcglob {SECT_TEXT  + 0001F480}, ;       AI::Find_Group_For_Delivery(char)
;setcglob {SECT_TEXT  + 0001F500}, ;       AI::Do_Attack_Approachers(void)
;setcglob {SECT_TEXT  + 0001F5F0}, ;       AI::BuyGet_Unit_In_Base(int,int)
;setcglob {SECT_TEXT  + 0001F6C0}, ;       AI::Number_Of_Groups_Doing_Task(char)
;setcglob {SECT_TEXT  + 0001F700}, ;       AI::Get_Nearest_Hostile_Thing(int,int,int,int,int)
;setcglob {SECT_TEXT  + 0001F970}, ;       AI::Attack_Best_Unit(int,int,int,int)
;setcglob {SECT_TEXT  + 0001FA70}, ;       AI::Get_Average_Position_Of_Group(int,int,int)
;setcglob {SECT_TEXT  + 0001FB20}, ;       AI::Get_Enemy_Base_Waypoint(int,int,int,int,int)
;setcglob {SECT_TEXT  + 0001FC60}, ;       AI::No_Hostile_Units_within_Range(int,int,int)
;setcglob {SECT_TEXT  + 0001FC80}, ;       AI::Do_Unit_Facings(void)
;setcglob {SECT_TEXT  + 0001FD50}, ;       AI::Get_Best_Building_To_Build(void)
;setcglob {SECT_TEXT  + 0001FE90}, ;       AI::Find_Random_Building_Position(int,int,int,int)
;setcglob {SECT_TEXT  + 00020000}, ;       AI::Can_AI_Place_Building(int,int,int)
;setcglob {SECT_TEXT  + 000202A0}, ;       AI::Can_AI_Place_Concrete(int,int,int)
;setcglob {SECT_TEXT  + 000204A0}, ;       AI::Do_Defend_Checks(void)
;setcglob {SECT_TEXT  + 00020710}, ;       AI::Merge_Groups(int,char)
;setcglob {SECT_TEXT  + 000208E0}, ;       AI::Need_Building(int)
;setcglob {SECT_TEXT  + 00020950}, ;       AI::Find_New_Position_For_Building(int,int,int)
;setcglob {SECT_TEXT  + 00020A90}, ;       AI::Concrete_Already(int,int)
;setcglob {SECT_TEXT  + 00020B60}, ;       AI::Find_Alternative_Place(int,int)
;setcglob {SECT_TEXT  + 00020C40}, ;       AI::Upgrade_Buildings(void)
;setcglob {SECT_TEXT  + 00020CF0}, ;       AI::Buy_Units_From_Startport(void)
;setcglob {SECT_TEXT  + 00020E50}, ;       AI::Should_I_Buy_Unit(int)
;setcglob {SECT_TEXT  + 00020FA0}, ;       AI::Monitor_Harvesters(void)
;setcglob {SECT_TEXT  + 00021140}, ;       AI::Do_MCVs(void)
;setcglob {SECT_TEXT  + 00021230}, ;       AI::Get_Defend_Group_ID(int)
;setcglob {SECT_TEXT  + 00021270}, ;       AI::Do_Special_Weapons(void)
;setcglob {SECT_TEXT  + 00021730}, ;       AI::Item_Ready(int,int)
;setcglob {SECT_TEXT  + 00021800}, ;       AI::Get_Best_Target(int,int)
;setcglob {SECT_TEXT  + 00021900}, ;       AI::Do_Saboteur(int)
;setcglob {SECT_TEXT  + 00021A80}, ;       AI::Do_Fremen(int)
;setcglob {SECT_TEXT  + 00021BF0}, ;       AI_422BF0
;setcglob {SECT_TEXT  + 00021C20}, ;       AI::Do_Overrides(void)
;setcglob {SECT_TEXT  + 00021E60}, ;       AI::In_Icon_List(int)
;setcglob {SECT_TEXT  + 00021EC0}, ;       AI::Deal_With_MCV(int)
;setcglob {SECT_TEXT  + 00022020}, ;       AI::Can_I_Deploy_MCV_Here(int,int)
;setcglob {SECT_TEXT  + 00022100}, ;       AI::Kick_Units_Out_Of_Area(char,char,char,char,int)
;setcglob {SECT_TEXT  + 00022220}, ;       AI::Get_Place_To_Move_To(int,int,int,int,int,int,int)
;setcglob {SECT_TEXT  + 00022360}, ;       AI::Send_Nearest_Unit(char,int,int,int)
;setcglob {SECT_TEXT  + 00022440}, ;       AI::Send_Some_Units_To_Attack_Building(char,int,int,int,int,int)
;setcglob {SECT_TEXT  + 00022500}, ;       AI::No_Friendly_Units(int,int,int)
;setcglob {SECT_TEXT  + 000225E0}, ;       AI::Take_Over(void)
;setcglob {SECT_TEXT  + 00022820}, ;       AI_Starting_Credits_423820
;setcglob {SECT_TEXT  + 00022830}, ;       AI::DebugString(char *)
;setcglob {SECT_TEXT  + 00022850}, ;       AI_423850
;setcglob {SECT_TEXT  + 00022FB0}, ;       Blit_423FB0
;setcglob {SECT_TEXT  + 000239B0}, ;       __On_Screen_Debug?
;setcglob {SECT_TEXT  + 00024860}, ;       __Draw_Power_Bar?
;setcglob {SECT_TEXT  + 000249F0}, ;       Colour_Fade_In(int,int,int,int,int)
;setcglob {SECT_TEXT  + 000253B0}, ;       UpdateIconImage_4263B0
;setcglob {SECT_TEXT  + 00025E80}, ;       BlitUIIcons_426E80
;setcglob {SECT_TEXT  + 00026D50}, ;       BlitBuildingFoundation_427D50
;setcglob {SECT_TEXT  + 00027070}, ;       BlitBullets_428070
;setcglob {SECT_TEXT  + 00027220}, ;       Blit_428220
;setcglob {SECT_TEXT  + 000272F0}, ;       BlitExplosions_4282F0
;setcglob {SECT_TEXT  + 00027E30}, ;       BlitVehicles_428E30
;setcglob {SECT_TEXT  + 00029A90}, ;       SortSprites_42AA90
;setcglob {SECT_TEXT  + 00029DA0}, ;       SetLensImage_42ADA0
;setcglob {SECT_TEXT  + 00029F00}, ;       Blit_42AF00
;setcglob {SECT_TEXT  + 0002A590}, ;       __End
;setcglob {SECT_TEXT  + 0002A8D0}, ;       Game_Set_Resource_Paths(char)
;setcglob {SECT_TEXT  + 0002AA50}, ;       fopen_
;setcglob {SECT_TEXT  + 0002AB40}, ;       fclose_
;setcglob {SECT_TEXT  + 0002AB60}, ;       fread_
;setcglob {SECT_TEXT  + 0002AB80}, ;       fwrite_
;setcglob {SECT_TEXT  + 0002ABA0}, ;       fseek_
;setcglob {SECT_TEXT  + 0002ABC0}, ;       fgets_
;setcglob {SECT_TEXT  + 0002ABE0}, ;       Get_Next_Line(File *,char *,int)
;setcglob {SECT_TEXT  + 0002AC60}, ;       Create_Globe(int)
;setcglob {SECT_TEXT  + 0002CC00}, ;       __Text_On_Screen
;setcglob {SECT_TEXT  + 0002D050}, ;       GL_DrawStringCentered_42E050
;setcglob {SECT_TEXT  + 0002D0B0}, ;       GL_DrawStringCentered_42E0B0
;setcglob {SECT_TEXT  + 0002D110}, ;       GL_DrawStringCentered_42E110
;setcglob {SECT_TEXT  + 0002D450}, ;       GL_42E450
;setcglob {SECT_TEXT  + 0002D660}, ;       Load_Targa(char,int,int,int,int,int)
;setcglob {SECT_TEXT  + 0002D810}, ;       Load_Targa(char,int,int)
;setcglob {SECT_TEXT  + 0002D8B0}, ;       Get_Palette_From_Bitmap(lpFilename,int)
;setcglob {SECT_TEXT  + 0002DAA0}, ;       Palette_42EAA0
;setcglob {SECT_TEXT  + 0002DAE0}, ;       Get_Bitmap_Data(char,int,int,int)
;setcglob {SECT_TEXT  + 0002DBE0}, ;       Load_Bitmap(char,int,long,int,int,int,int)
;setcglob {SECT_TEXT  + 0002DF90}, ;       __Create_T_Image
;setcglob {SECT_TEXT  + 0002E1D0}, ;       Create_TImage_With_Targa(char,int,int,int,int,int)
;setcglob {SECT_TEXT  + 0002E430}, ;       Create_Surface_With_Bitmap(char,char,int,long,int,int,int,char,int,int)
;setcglob {SECT_TEXT  + 0002EAC0}, ;       __Blit_T_Image?
;setcglob {SECT_TEXT  + 0002F5F0}, ;       BlitClipTImage_4305F0
;setcglob {SECT_TEXT  + 0002F770}, ;       BlitClipTImage_430770
;setcglob {SECT_TEXT  + 0002F860}, ;       Clear_TImage(int,int,int)
;setcglob {SECT_TEXT  + 0002F8F0}, ;       Draw_Line_Clip_TImage(int,int,int,int,int,int,int)
;setcglob {SECT_TEXT  + 000316B0}, ;       BlitTImage_4326B0
;setcglob {SECT_TEXT  + 00037D10}, ;       CInterface::Add_Movie(char *,int,int,int,int)
;setcglob {SECT_TEXT  + 0003C820}, ;       Create_Score(int)
;setcglob {SECT_TEXT  + 000420D0}, ;       Can_Unit_Be_Built(int,int,char)
;setcglob {SECT_TEXT  + 00047550}, ;       Main_Loop(void)
;setcglob {SECT_TEXT  + 00049AE0}, ;       __Update_Sidebar_Stuff?
;setcglob {SECT_TEXT  + 00049BE0}, ;       __Update_Sidebar_Stuff2?
;setcglob {SECT_TEXT  + 0004A5C0}, ;       __Do_Tooltips
;setcglob {SECT_TEXT  + 0004C0E0}, ;       Check_All_Marked_Tiles_Have_Unit_On_Them(void)
;setcglob {SECT_TEXT  + 0004C1D0}, ;       Check_All_Marked_Tiles_Have_Building_On_Them(void)
;setcglob {SECT_TEXT  + 0004C250}, ;       Check_All_Units_Are_Marking_Tiles(void)
;setcglob {SECT_TEXT  + 00054500}, ;       j_Create_Side(void)
;setcglob {SECT_TEXT  + 00054510}, ;       Handle_Game_Loop_Events(int,int)
;setcglob {SECT_TEXT  + 00054870}, ;       Model_Add_Unit(int,int,int,int,int,int,int,int)
;setcglob {SECT_TEXT  + 00054FC0}, ;       Model_Build_Building_Pick(int,int)
;setcglob {SECT_TEXT  + 000550F0}, ;       Model_Build_Building_Cancel(int,int)
;setcglob {SECT_TEXT  + 00055A30}, ;       Model_Add_Bullet(int,int,int,int,int,int,int,int,int,int)
;setcglob {SECT_TEXT  + 00056810}, ;       Process_Order(int)
;setcglob {SECT_TEXT  + 00057E90}, ;       __Techno_Check?
;setcglob {SECT_TEXT  + 00058450}, ;       Generate_Unit_Move_Order(int,int,int)
;setcglob {SECT_TEXT  + 000586F0}, ;       Generate_Unit_Attack_Unit_Order(int,int,int)
;setcglob {SECT_TEXT  + 00058FD0}, ;       Generate_Build_Place_Building_Order(int,int,int)
;setcglob {SECT_TEXT  + 00059BA0}, ;       Get_Tick_Count(void)
;setcglob {SECT_TEXT  + 0005A570}, ;       __Update_My_Frame?
;setcglob {SECT_TEXT  + 0005A830}, ;       DebugString(char *)
;setcglob {SECT_TEXT  + 0005B0E0}, ;       Get_Network_Orders(void)
;setcglob {SECT_TEXT  + 0005B740}, ;       Process_Pulse_Signal(void)
;setcglob {SECT_TEXT  + 0005C120}, ;       Process_Order_Queue(int)
;setcglob {SECT_TEXT  + 0005C550}, ;       Blit_45D550
;setcglob {SECT_TEXT  + 0005C990}, ;       Can_Unit_Use_Square(int,int,int,int,char)
;setcglob {SECT_TEXT  + 0005CE30}, ;       Get_Next_Square_In_Direction(int,int,char)
;setcglob {SECT_TEXT  + 0005D060}, ;       Get_Next_Square_On_Line_To_Target(int,int,int,int)
;setcglob {SECT_TEXT  + 0005D0E0}, ;       Get_Best_Angle(int,int,int,int)
;setcglob {SECT_TEXT  + 0005DAF0}, ;       Find_Path(int,int,int,int,int,int,int,int,int,char)
;setcglob {SECT_TEXT  + 00060300}, ;       Load_UI_Data(void)
;setcglob {SECT_TEXT  + 00061010}, ;       Set_Pixel_On_Radar_8(int,int,char)
;setcglob {SECT_TEXT  + 000610B0}, ;       Set_Pixel_On_Radar_16(int,int,long)
;setcglob {SECT_TEXT  + 00062130}, ;       __Take_Boolean?
;setcglob {SECT_TEXT  + 00064E60}, ;       Read_Data_Types(void)
;setcglob {SECT_TEXT  + 00065140}, ;       Load_Graphics(void)
;setcglob {SECT_TEXT  + 00069A00}, ;       Do_Palette_Stuff(void)
;setcglob {SECT_TEXT  + 00069D80}, ;       Read_Smoke_Data(void)
;setcglob {SECT_TEXT  + 0006A0F0}, ;       Read_Armour(void)
;setcglob {SECT_TEXT  + 0006A690}, ;       Read_Speed(void)
;setcglob {SECT_TEXT  + 0006A990}, ;       __Side_CTOR
;setcglob {SECT_TEXT  + 0006B7D0}, ;       Update_Cash_Drip(void)
;setcglob {SECT_TEXT  + 0006BA00}, ;       __Get_Side_Stats?
;setcglob {SECT_TEXT  + 0006D9C0}, ;       Let_AI_Take_Over(void)
;setcglob {SECT_TEXT  + 0006DDA0}, ;       ISampleManager_46EDA0
;setcglob {SECT_TEXT  + 0006E700}, ;       __Set_SFX_Priority2?
;setcglob {SECT_TEXT  + 0006E770}, ;       __Set_SFX_Priority?
;setcglob {SECT_TEXT  + 0006E820}, ;       __Do_Money_Sounds?
;setcglob {SECT_TEXT  + 0006EAA0}, ;       __Load_WAV_Files
;setcglob {SECT_TEXT  + 0006F190}, ;       Process_DD_Result(long,int)
;setcglob {SECT_TEXT  + 000702C0}, ;       DoUIManager_4712C0
;setcglob {SECT_TEXT  + 00075AF0}, ;       UIMgr::Load_Colour_Information(void)
;setcglob {SECT_TEXT  + 00075E00}, ;       UIMgr::Load_Text_Information(void)
;setcglob {SECT_TEXT  + 00076190}, ;       UIMgr::Load_Menu_Information(void)
;setcglob {SECT_TEXT  + 00076530}, ;       UIMgr::Load_Sample_Information(void)
;setcglob {SECT_TEXT  + 00076790}, ;       UIMgr::Load_Campaign_Information(void)
;setcglob {SECT_TEXT  + 00077C20}, ;       Game_Config_Read(void)
;setcglob {SECT_TEXT  + 00077FA0}, ;       Game_Config_Write(void)
;setcglob {SECT_TEXT  + 00080700}, ;       Track_For_House(char,char)
;setcglob {SECT_TEXT  + 000815B0}, ;       Read_Binary_String(int,int,char)
;setcglob {SECT_TEXT  + 0008CC10}, ;       __Get_Text?
;setcglob {SECT_TEXT  + 0008CCC0}, ;       Get_Text_String(char,char)
;setcglob {SECT_TEXT  + 0008CD90}, ;       __Get_Sample
;setcglob {SECT_TEXT  + 0008CE10}, ;       Get_Sample_File(char)
;setcglob {SECT_TEXT  + 000904A0}, ;       Get_Player_House(int)
;setcglob {SECT_TEXT  + 00090560}, ;       Get_Player_Colour(int)
;setcglob {SECT_TEXT  + 00090600}, ;       Get_Player_Colour_Number(char)
;setcglob {SECT_TEXT  + 00090990}, ;       Get_Unique_Group_ID(void)
;setcglob {SECT_TEXT  + 00090A10}, ;       Get_Colour_Selected(int,int)
;setcglob {SECT_TEXT  + 00090C60}, ;       Alter_Handicap(int)
;setcglob {SECT_TEXT  + 00091000}, ;       Is_Windows_NT_Machine(void)
;setcglob {SECT_TEXT  + 00091C40}, ;       Check_For_CD(int,char)
;setcglob {SECT_TEXT  + 00091F90}, ;       SetCallerID_492F90
;setcglob {SECT_TEXT  + 000926A0}, ;       Get_Next_Square(int,int,int)
;setcglob {SECT_TEXT  + 00093260}, ;       Move_Unit(int,int,int)
;setcglob {SECT_TEXT  + 0009C2E0}, ;       Damage_Tiles(int,int,int,int,int,long,char)
;setcglob {SECT_TEXT  + 0009D9D0}, ;       New_Best_Bullet(char,char,int,int,int,char)
;setcglob {SECT_TEXT  + 0009DBF0}, ;       Pickup_Crate(int,int)
;setcglob {SECT_TEXT  + 0009E089}, ;       switch_Pickup_Create_Stealth
;setcglob {SECT_TEXT  + 0009E240}, ;       Play_Unit_Response(char)
;setcglob {SECT_TEXT  + 0009E3B0}, ;       Get_Speed(int)
;setcglob {SECT_TEXT  + 0009EBC0}, ;       Wignet::Init(int,int)
;setcglob {SECT_TEXT  + 0009EBE0}, ;       Wignet::Wignet(int,int)
;setcglob {SECT_TEXT  + 0009ECF0}, ;       Wignet::~Wignet(void)
;setcglob {SECT_TEXT  + 0009EDE0}, ;       Wignet::Set_Mode(char,int,char,char)
;setcglob {SECT_TEXT  + 0009EE30}, ;       Set_Session_Name(int,int,int)
;setcglob {SECT_TEXT  + 0009EFA0}, ;       Get_Network_Types(int,int,int)
;setcglob {SECT_TEXT  + 0009F510}, ;       Get_Session_List(int)
;setcglob {SECT_TEXT  + 0009F7A0}, ;       Get_Member_List(int)
;setcglob {SECT_TEXT  + 0009F8E0}, ;       Start_Session(void)
;setcglob {SECT_TEXT  + 0009F990}, ;       Join_Session(void)
;setcglob {SECT_TEXT  + 0009FA30}, ;       Set_Network_Type(int,int)
;setcglob {SECT_TEXT  + 000A03F0}, ;       Select_Network(void)
;setcglob {SECT_TEXT  + 000A1A10}, ;       DialogFunc
;setcglob {SECT_TEXT  + 000A21D0}, ;       Windows_Procedure(void *,uint,uint,long)
;setcglob {SECT_TEXT  + 000A284C}, ;       WP_switch_a
;setcglob {SECT_TEXT  + 000A2860}, ;       WP_switch_b
;setcglob {SECT_TEXT  + 000A2884}, ;       WP_byte_switch
;setcglob {SECT_TEXT  + 000A2A80}, ;       PCL_switch
;setcglob {SECT_TEXT  + 000A2AA0}, ;       PCL_byte_switch
;setcglob {SECT_TEXT  + 000A2AC0}, ;       EnumFunc
;setcglob {SECT_TEXT  + 000A2BB0}, ;       WinMain(hInstance,hPrevInstance,lpCmdLine,nCmdShow)
;setcglob {SECT_TEXT  + 000A35D0}, ;       Create_Side(void)
;setcglob {SECT_TEXT  + 000A3660}, ;       Get_Side(int)
;setcglob {SECT_TEXT  + 000A36B0}, ;       Get_Unit(int,int)
;setcglob {SECT_TEXT  + 000A3740}, ;       Attack_Unit(int,int)
;setcglob {SECT_TEXT  + 000A556C}, ;       DirectPlayCreate(int,int,int)
;setcglob {SECT_TEXT  + 000A5572}, ;       DirectPlayLobbyCreateA(int,int,int,int,int)
;setcglob {SECT_TEXT  + 000A5578}, ;       DirectDrawCreate(int,int,int)
;setcglob {SECT_TEXT  + 000A557E}, ;       DirectSoundCreate(int,int,int)
;setcglob {SECT_TEXT  + 000AACC0}, ;       std::basic_streambuf<char,std::char_traits<char>>::underflow(void)
;setcglob {SECT_TEXT  + 000AF670}, ;       _sprintf
;setcglob {SECT_TEXT  + 000AF6E0}, ;       operator new(uint)
;setcglob {SECT_TEXT  + 000AF6F0}, ;       operator delete(void *)
;setcglob {SECT_TEXT  + 000AF700}, ;       _atol
;setcglob {SECT_TEXT  + 000AF7B0}, ;       _strncpy
;setcglob {SECT_TEXT  + 000AF990}, ;       _JumpToContinuation(void *,EHRegistrationNode *)
;setcglob {SECT_TEXT  + 000AF9E0}, ;       _UnwindNestedFrames(EHRegistrationNode *,EHExceptionRecord *)
;setcglob {SECT_TEXT  + 000AFA0C}, ;       $ReturnPoint$16567
;setcglob {SECT_TEXT  + 000AFA40}, ;       ___CxxFrameHandler
;setcglob {SECT_TEXT  + 000AFA80}, ;       _CallCatchBlock2(EHRegistrationNode *,_s_FuncInfo const *,void *,int,ulong)
;setcglob {SECT_TEXT  + 000AFAE0}, ;       CatchGuardHandler(EHExceptionRecord *,CatchGuardRN *,void *,void *)
;setcglob {SECT_TEXT  + 000AFB10}, ;       unknown_libname_4
;setcglob {SECT_TEXT  + 000AFBAA}, ;       unknown_libname_5
;setcglob {SECT_TEXT  + 000AFBE0}, ;       TranslatorGuardHandler(EHExceptionRecord *,TranslatorGuardRN *,void *,void *)
;setcglob {SECT_TEXT  + 000AFC70}, ;       _GetRangeOfTrysToCheck(_s_FuncInfo const *,int,int,uint *,uint *)
;setcglob {SECT_TEXT  + 000AFCF0}, ;       __global_unwind2
;setcglob {SECT_TEXT  + 000AFD10}, ;       __unwind_handler
;setcglob {SECT_TEXT  + 000AFD32}, ;       __local_unwind2
;setcglob {SECT_TEXT  + 000AFD8A}, ;       __NLG_Return2
;setcglob {SECT_TEXT  + 000AFD9A}, ;       __abnormal_termination
;setcglob {SECT_TEXT  + 000AFDBD}, ;       __NLG_Notify1
;setcglob {SECT_TEXT  + 000AFDC6}, ;       __NLG_Notify
;setcglob {SECT_TEXT  + 000AFDD9}, ;       __NLG_Dispatch
;setcglob {SECT_TEXT  + 000AFDE0}, ;       _sscanf
;setcglob {SECT_TEXT  + 000AFE50}, ;       __nh_malloc
;setcglob {SECT_TEXT  + 000AFEA0}, ;       __heap_alloc
;setcglob {SECT_TEXT  + 000AFF30}, ;       __fpmath
;setcglob {SECT_TEXT  + 000AFF60}, ;       __cfltcvt_init
;setcglob {SECT_TEXT  + 000AFFA0}, ;       __fsopen
;setcglob {SECT_TEXT  + 000AFFD0}, ;       _fopen
;setcglob {SECT_TEXT  + 000AFFF0}, ;       _fclose
;setcglob {SECT_TEXT  + 000B0070}, ;       _fread
;setcglob {SECT_TEXT  + 000B01B0}, ;       _fwrite
;setcglob {SECT_TEXT  + 000B0300}, ;       _fseek
;setcglob {SECT_TEXT  + 000B03A0}, ;       _strncmp
;setcglob {SECT_TEXT  + 000B03E0}, ;       __alloca_probe
;setcglob {SECT_TEXT  + 000B0410}, ;       _realloc
;setcglob {SECT_TEXT  + 000B05B0}, ;       _vsprintf
;setcglob {SECT_TEXT  + 000B0640}, ;       __strlwr
;setcglob {SECT_TEXT  + 000B0810}, ;       _rand
;setcglob {SECT_TEXT  + 000B0840}, ;       __ftol
;setcglob {SECT_TEXT  + 000B0870}, ;       _abort
;setcglob {SECT_TEXT  + 000B08C0}, ;       _exit
;setcglob {SECT_TEXT  + 000B08E0}, ;       __exit
;setcglob {SECT_TEXT  + 000B0900}, ;       _doexit
;setcglob {SECT_TEXT  + 000B09B0}, ;       __initterm
;setcglob {SECT_TEXT  + 000B09E0}, ;       _strchr
;setcglob {SECT_TEXT  + 000B09E6}, ;       ___from_strstr_to_strchr
;setcglob {SECT_TEXT  + 000B0AA0}, ;       _fgets
;setcglob {SECT_TEXT  + 000B0B20}, ;       _memcpy
;setcglob {SECT_TEXT  + 000B0E60}, ;       _clock
;setcglob {SECT_TEXT  + 000B0EE0}, ;       _fflush
;setcglob {SECT_TEXT  + 000B0F30}, ;       __flush
;setcglob {SECT_TEXT  + 000B0FA0}, ;       __flushall
;setcglob {SECT_TEXT  + 000B0FB0}, ;       _flsall
;setcglob {SECT_TEXT  + 000B1030}, ;       _fprintf
;setcglob {SECT_TEXT  + 000B1070}, ;       _setvbuf
;setcglob {SECT_TEXT  + 000B1130}, ;       _toupper
;setcglob {SECT_TEXT  + 000B1230}, ;       _strstr
;setcglob {SECT_TEXT  + 000B12B0}, ;       __findfirst
;setcglob {SECT_TEXT  + 000B13E0}, ;       __findnext
;setcglob {SECT_TEXT  + 000B1500}, ;       __findclose
;setcglob {SECT_TEXT  + 000B1520}, ;       ___timet_from_ft
;setcglob {SECT_TEXT  + 000B15B0}, ;       _remove
;setcglob {SECT_TEXT  + 000B15E0}, ;       _rename
;setcglob {SECT_TEXT  + 000B1620}, ;       _strcspn
;setcglob {SECT_TEXT  + 000B1660}, ;       _strncat
;setcglob {SECT_TEXT  + 000B1790}, ;       _fputs
;setcglob {SECT_TEXT  + 000B17E0}, ;       _isspace
;setcglob {SECT_TEXT  + 000B1810}, ;       start
;setcglob {SECT_TEXT  + 000B19B0}, ;       __amsg_exit
;setcglob {SECT_TEXT  + 000B19F0}, ;       _strcat
;setcglob {SECT_TEXT  + 000B1B60}, ;       _strlen
;setcglob {SECT_TEXT  + 000B1BE0}, ;       _memset
;setcglob {SECT_TEXT  + 000B1C40}, ;       __flsbuf
;setcglob {SECT_TEXT  + 000B1D70}, ;       __output
;setcglob {SECT_TEXT  + 000B1F70}, ;       $NORMAL_STATE$684
;setcglob {SECT_TEXT  + 000B2700}, ;       _write_char
;setcglob {SECT_TEXT  + 000B2750}, ;       _write_multi_char
;setcglob {SECT_TEXT  + 000B2790}, ;       _write_string
;setcglob {SECT_TEXT  + 000B27D0}, ;       _get_int_arg
;setcglob {SECT_TEXT  + 000B27F0}, ;       _get_int64_arg
;setcglob {SECT_TEXT  + 000B2810}, ;       _get_short_arg
;setcglob {SECT_TEXT  + 000B2830}, ;       __isctype
;setcglob {SECT_TEXT  + 000B28D0}, ;       __allmul
;setcglob {SECT_TEXT  + 000B2910}, ;       ___InternalCxxFrameHandler
;setcglob {SECT_TEXT  + 000B29E0}, ;       FindHandler(EHExceptionRecord *,EHRegistrationNode *,_CONTEXT *,void *,_s_FuncInfo const *,uchar,int,EHRegistrationNode *)
;setcglob {SECT_TEXT  + 000B2C90}, ;       FindHandlerForForeignException(EHExceptionRecord *,EHRegistrationNode *,_CONTEXT *,void *,_s_FuncInfo const *,int,int,EHRegistrationNode *)
;setcglob {SECT_TEXT  + 000B2D60}, ;       ___FrameUnwindToState
;setcglob {SECT_TEXT  + 000B2E40}, ;       CatchIt(EHExceptionRecord *,EHRegistrationNode *,_CONTEXT *,void *,_s_FuncInfo const *,_s_HandlerType const *,_s_CatchableType const *,_s_TryBlockMapEntry const *,int,EHRegistrationNode *)
;setcglob {SECT_TEXT  + 000B2ED0}, ;       CallCatchBlock(EHExceptionRecord *,EHRegistrationNode *,_CONTEXT *,_s_FuncInfo const *,void *,int,ulong)
;setcglob {SECT_TEXT  + 000B3020}, ;       ExFilterRethrow(_EXCEPTION_POINTERS *)
;setcglob {SECT_TEXT  + 000B3050}, ;       BuildCatchObject(EHExceptionRecord *,EHRegistrationNode *,_s_HandlerType const *,_s_CatchableType const *)
;setcglob {SECT_TEXT  + 000B3260}, ;       _DestructExceptionObject(EHExceptionRecord *,uchar)
;setcglob {SECT_TEXT  + 000B32E0}, ;       AdjustPointer(void *,PMD const &)
;setcglob {SECT_TEXT  + 000B3310}, ;       unknown_libname_6
;setcglob {SECT_TEXT  + 000B3337}, ;       unknown_libname_7
;setcglob {SECT_TEXT  + 000B41C0}, ;       __hextodec
;setcglob {SECT_TEXT  + 000B4200}, ;       _fgetc
;setcglob {SECT_TEXT  + 000B4230}, ;       __un_inc
;setcglob {SECT_TEXT  + 000B4250}, ;       __whiteout
;setcglob {SECT_TEXT  + 000B42A0}, ;       __callnewh
;setcglob {SECT_TEXT  + 000B42C0}, ;       __heap_init
;setcglob {SECT_TEXT  + 000B4300}, ;       ___sbh_new_region
;setcglob {SECT_TEXT  + 000B4470}, ;       ___sbh_release_region
;setcglob {SECT_TEXT  + 000B44D0}, ;       ___sbh_decommit_pages
;setcglob {SECT_TEXT  + 000B45A0}, ;       ___sbh_find_block
;setcglob {SECT_TEXT  + 000B4600}, ;       ___sbh_free_block
;setcglob {SECT_TEXT  + 000B4660}, ;       ___sbh_alloc_block
;setcglob {SECT_TEXT  + 000B48A0}, ;       ___sbh_alloc_block_from_page
;setcglob {SECT_TEXT  + 000B4A20}, ;       ___sbh_resize_block
;setcglob {SECT_TEXT  + 000B4AF0}, ;       __setdefaultprecision
;setcglob {SECT_TEXT  + 000B4B10}, ;       __ms_p5_test_fdiv
;setcglob {SECT_TEXT  + 000B4B60}, ;       __ms_p5_mp_test_fdiv
;setcglob {SECT_TEXT  + 000B4B90}, ;       __forcdecpt
;setcglob {SECT_TEXT  + 000B4BF0}, ;       __cropzeros
;setcglob {SECT_TEXT  + 000B4C60}, ;       __positive
;setcglob {SECT_TEXT  + 000B4C80}, ;       __fassign
;setcglob {SECT_TEXT  + 000B4CE0}, ;       __cftoe
;setcglob {SECT_TEXT  + 000B4E20}, ;       __cftof
;setcglob {SECT_TEXT  + 000B4F20}, ;       __cftog
;setcglob {SECT_TEXT  + 000B4FD0}, ;       __cftoe_g
;setcglob {SECT_TEXT  + 000B5000}, ;       __cftof_g
;setcglob {SECT_TEXT  + 000B5030}, ;       __cfltcvt
;setcglob {SECT_TEXT  + 000B50A0}, ;       __shift
;setcglob {SECT_TEXT  + 000B50D0}, ;       __openfile
;setcglob {SECT_TEXT  + 000B52A0}, ;       __getstream
;setcglob {SECT_TEXT  + 000B5330}, ;       __close
;setcglob {SECT_TEXT  + 000B5410}, ;       __freebuf
;setcglob {SECT_TEXT  + 000B5450}, ;       __filbuf
;setcglob {SECT_TEXT  + 000B5540}, ;       __read
;setcglob {SECT_TEXT  + 000B57A0}, ;       __write
;setcglob {SECT_TEXT  + 000B59C0}, ;       __lseek
;setcglob {SECT_TEXT  + 000B5A80}, ;       _ftell
;setcglob {SECT_TEXT  + 000B5C30}, ;       _asctime
;setcglob {SECT_TEXT  + 000B5D20}, ;       _store_dt
;setcglob {SECT_TEXT  + 000B5D60}, ;       _localtime
;setcglob {SECT_TEXT  + 000B5F50}, ;       ___crtLCMapStringA
;setcglob {SECT_TEXT  + 000B6170}, ;       _raise
;setcglob {SECT_TEXT  + 000B62F0}, ;       _siglookup
;setcglob {SECT_TEXT  + 000B6340}, ;       __FF_MSGBANNER
;setcglob {SECT_TEXT  + 000B6380}, ;       __NMSG_WRITE
;setcglob {SECT_TEXT  + 000B6560}, ;       __ftime
;setcglob {SECT_TEXT  + 000B6620}, ;       __commit
;setcglob {SECT_TEXT  + 000B6680}, ;       ___initstdio
;setcglob {SECT_TEXT  + 000B6740}, ;       ___endstdio
;setcglob {SECT_TEXT  + 000B6760}, ;       __stbuf
;setcglob {SECT_TEXT  + 000B6800}, ;       __ftbuf
;setcglob {SECT_TEXT  + 000B6860}, ;       ___loctotime_t
;setcglob {SECT_TEXT  + 000B6950}, ;       __dosmaperr
;setcglob {SECT_TEXT  + 000B69C0}, ;       __XcptFilter
;setcglob {SECT_TEXT  + 000B6B00}, ;       _xcptlookup
;setcglob {SECT_TEXT  + 000B6B50}, ;       __ismbblead
;setcglob {SECT_TEXT  + 000B6B70}, ;       _x_ismbbtype
;setcglob {SECT_TEXT  + 000B6BB0}, ;       __setenvp
;setcglob {SECT_TEXT  + 000B6CA0}, ;       __setargv
;setcglob {SECT_TEXT  + 000B6D40}, ;       _parse_cmdline
;setcglob {SECT_TEXT  + 000B6F50}, ;       ___crtGetEnvironmentStringsA
;setcglob {SECT_TEXT  + 000B70B0}, ;       __setmbcp
;setcglob {SECT_TEXT  + 000B72A0}, ;       _getSystemCP
;setcglob {SECT_TEXT  + 000B72F0}, ;       _CPtoLCID
;setcglob {SECT_TEXT  + 000B7350}, ;       _setSBCS
;setcglob {SECT_TEXT  + 000B7380}, ;       ___initmbctable
;setcglob {SECT_TEXT  + 000B7390}, ;       __ioinit
;setcglob {SECT_TEXT  + 000B7598}, ;       unknown_libname_8
;setcglob {SECT_TEXT  + 000B7655}, ;       unknown_libname_9
;setcglob {SECT_TEXT  + 000B7670}, ;       __getbuf
;setcglob {SECT_TEXT  + 000B76D0}, ;       __isatty
;setcglob {SECT_TEXT  + 000B7700}, ;       _wctomb
;setcglob {SECT_TEXT  + 000B7780}, ;       __aulldiv
;setcglob {SECT_TEXT  + 000B77F0}, ;       __aullrem
;setcglob {SECT_TEXT  + 000B7870}, ;       ___crtGetStringTypeA
;setcglob {SECT_TEXT  + 000B79A0}, ;       __CxxUnhandledExceptionFilter(_EXCEPTION_POINTERS *)
;setcglob {SECT_TEXT  + 000B7A00}, ;       __CxxSetUnhandledExceptionFilter(void)
;setcglob {SECT_TEXT  + 000B7A20}, ;       __CxxRestoreUnhandledExceptionFilter(void)
;setcglob {SECT_TEXT  + 000B7A30}, ;       _ValidateRead(void const *,uint)
;setcglob {SECT_TEXT  + 000B7A50}, ;       _ValidateWrite(void *,uint)
;setcglob {SECT_TEXT  + 000B7A70}, ;       _ValidateExecute(int (*)(void))
;setcglob {SECT_TEXT  + 000B7A90}, ;       _mbtowc
;setcglob {SECT_TEXT  + 000B7B90}, ;       __allshl
;setcglob {SECT_TEXT  + 000B7BB0}, ;       _ungetc
;setcglob {SECT_TEXT  + 000B7C40}, ;       __control87
;setcglob {SECT_TEXT  + 000B7C80}, ;       __controlfp
;setcglob {SECT_TEXT  + 000B7CA0}, ;       __abstract_cw
;setcglob {SECT_TEXT  + 000B7D40}, ;       __hw_cw
;setcglob {SECT_TEXT  + 000B7DD0}, ;       __ZeroTail
;setcglob {SECT_TEXT  + 000B7E40}, ;       __IncMan
;setcglob {SECT_TEXT  + 000B7EB0}, ;       __RoundMan
;setcglob {SECT_TEXT  + 000B7F50}, ;       __CopyMan
;setcglob {SECT_TEXT  + 000B7F70}, ;       __FillZeroMan
;setcglob {SECT_TEXT  + 000B7F80}, ;       __IsZeroMan
;setcglob {SECT_TEXT  + 000B7FA0}, ;       __ShrMan
;setcglob {SECT_TEXT  + 000B8060}, ;       __ld12cvt
;setcglob {SECT_TEXT  + 000B82F0}, ;       __fptostr
;setcglob {SECT_TEXT  + 000B8390}, ;       __fltout
;setcglob {SECT_TEXT  + 000B8410}, ;       ___dtold
;setcglob {SECT_TEXT  + 000B84D0}, ;       __fptrap
;setcglob {SECT_TEXT  + 000B8500}, ;       __sopen
;setcglob {SECT_TEXT  + 000B88C0}, ;       __alloc_osfhnd
;setcglob {SECT_TEXT  + 000B8980}, ;       __set_osfhnd
;setcglob {SECT_TEXT  + 000B8A30}, ;       __free_osfhnd
;setcglob {SECT_TEXT  + 000B8AD0}, ;       __get_osfhandle
;setcglob {SECT_TEXT  + 000B8B20}, ;       ___tzset
;setcglob {SECT_TEXT  + 000B8B40}, ;       __tzset
;setcglob {SECT_TEXT  + 000B9060}, ;       _cvtdate
;setcglob {SECT_TEXT  + 000B9200}, ;       _gmtime
;setcglob {SECT_TEXT  + 000B9360}, ;       ___crtMessageBoxA
;setcglob {SECT_TEXT  + 000B93F0}, ;       _mktime
;setcglob {SECT_TEXT  + 000B9400}, ;       __make_time_t
;setcglob {SECT_TEXT  + 000B9640}, ;       _calloc
;setcglob {SECT_TEXT  + 000B96E0}, ;       __fcloseall
;setcglob {SECT_TEXT  + 000B9750}, ;       _wcslen
;setcglob {SECT_TEXT  + 000B9770}, ;       ___addl
;setcglob {SECT_TEXT  + 000B97A0}, ;       ___add_12
;setcglob {SECT_TEXT  + 000B9810}, ;       ___shl_12
;setcglob {SECT_TEXT  + 000B9840}, ;       ___shr_12
;setcglob {SECT_TEXT  + 000B9870}, ;       ___mtold12
;setcglob {SECT_TEXT  + 000B9970}, ;       ___strgtold12
;setcglob {SECT_TEXT  + 000BA100}, ;       _$I10_OUTPUT
;setcglob {SECT_TEXT  + 000BA490}, ;       __chsize
;setcglob {SECT_TEXT  + 000BA610}, ;       _wcstombs
;setcglob {SECT_TEXT  + 000BA800}, ;       _wcsncnt
;setcglob {SECT_TEXT  + 000BA840}, ;       _getenv
;setcglob {SECT_TEXT  + 000BA8D0}, ;       ___ld12mul
;setcglob {SECT_TEXT  + 000BAB90}, ;       ___multtenpow12
;setcglob {SECT_TEXT  + 000BAC20}, ;       __setmode
;setcglob {SECT_TEXT  + 000BACA0}, ;       __mbsnbicoll
;setcglob {SECT_TEXT  + 000BACE0}, ;       ___wtomb_environ
;setcglob {SECT_TEXT  + 000BAD60}, ;       ___crtCompareStringA
;setcglob {SECT_TEXT  + 000BB030}, ;       _strncnt
;setcglob {SECT_TEXT  + 000BB060}, ;       ___crtsetenv
;setcglob {SECT_TEXT  + 000BB270}, ;       _findenv
;setcglob {SECT_TEXT  + 000BB2F0}, ;       _copy_environ
;setcglob {SECT_TEXT  + 000BB360}, ;       __mbschr
;setcglob {SECT_TEXT  + 000BB410}, ;       __strdup
;setcglob {SECT_TEXT  + 000BB460}, ;       ___dtoxmode
;setcglob {SECT_TEXT  + 000BB5B0}, ;       __stat
;setcglob {SECT_TEXT  + 000BBA30}, ;       _IsRootUNCName
;setcglob {SECT_TEXT  + 000BBB20}, ;       __strcmpi
;setcglob {SECT_TEXT  + 000BBBB0}, ;       __strnicmp
;setcglob {SECT_TEXT  + 000BBC60}, ;       __itoa
;setcglob {SECT_TEXT  + 000BBCB0}, ;       _xtoa
;setcglob {SECT_TEXT  + 000BBD80}, ;       __filelength
;setcglob {SECT_TEXT  + 000BBE20}, ;       __fileno
;setcglob {SECT_TEXT  + 000BBE30}, ;       __mbsicmp
;setcglob {SECT_TEXT  + 000BC0A0}, ;       __mbsrchr
;setcglob {SECT_TEXT  + 000BC160}, ;       __fullpath
;setcglob {SECT_TEXT  + 000BC240}, ;       __getdrive
;setcglob {SECT_TEXT  + 000BC2A0}, ;       __mbctolower
;setcglob {SECT_TEXT  + 000BC370}, ;       __mbspbrk
;setcglob {SECT_TEXT  + 000BC490}, ;       _strrchr
;setcglob {SECT_TEXT  + 000BC4C0}, ;       __getcwd
;setcglob {SECT_TEXT  + 000BC4E0}, ;       __getdcwd
;setcglob {SECT_TEXT  + 000BC600}, ;       __validdrive
;setcglob {SECT_TEXT  + 000BC650}, ;       _strpbrk
;setcglob {SECT_TEXT  + 000BC6A3}, ;       unknown_libname_10
;setcglob {SECT_TEXT  + 000BC6C3}, ;       unknown_libname_11
;setcglob {SECT_TEXT  + 000BC6FF}, ;       unknown_libname_12
;setcglob {SECT_TEXT  + 000BC710}, ;       unknown_libname_13
;setcglob {SECT_TEXT  + 000BC71B}, ;       SEH_403460
;setcglob {SECT_TEXT  + 000BC7B4}, ;       unknown_libname_14
;setcglob {SECT_TEXT  + 000BC7CB}, ;       unknown_libname_15
;setcglob {SECT_TEXT  + 000BC7EB}, ;       unknown_libname_16
;setcglob {SECT_TEXT  + 000BC80B}, ;       unknown_libname_17
;setcglob {SECT_TEXT  + 000BC836}, ;       unknown_libname_18
;setcglob {SECT_TEXT  + 000BC856}, ;       unknown_libname_19
;setcglob {SECT_TEXT  + 000BC884}, ;       unknown_libname_20
;setcglob {SECT_TEXT  + 000BC8A0}, ;       unknown_libname_21
;setcglob {SECT_TEXT  + 000BC8C0}, ;       unknown_libname_22
;setcglob {SECT_TEXT  + 000BC967}, ;       unknown_libname_23
;setcglob {SECT_TEXT  + 000BC993}, ;       unknown_libname_24
;setcglob {SECT_TEXT  + 000BC9A8}, ;       SEH_41ABD0
;setcglob {SECT_TEXT  + 000BC9D3}, ;       unknown_libname_25
;setcglob {SECT_TEXT  + 000BC9E8}, ;       SEH_41AD20
;setcglob {SECT_TEXT  + 000BCA13}, ;       unknown_libname_26
;setcglob {SECT_TEXT  + 000BCA28}, ;       SEH_41AEC0
;setcglob {SECT_TEXT  + 000BCA40}, ;       unknown_libname_27
;setcglob {SECT_TEXT  + 000BCA4B}, ;       SEH_437CE0
;setcglob {SECT_TEXT  + 000BCA60}, ;       unknown_libname_28
;setcglob {SECT_TEXT  + 000BCA6B}, ;       SEH_437E00
;setcglob {SECT_TEXT  + 000BCA80}, ;       unknown_libname_29
;setcglob {SECT_TEXT  + 000BCA8B}, ;       SEH_437F30
;setcglob {SECT_TEXT  + 000BCAA0}, ;       unknown_libname_30
;setcglob {SECT_TEXT  + 000BCAAB}, ;       SEH_438030
;setcglob {SECT_TEXT  + 000BCAC0}, ;       unknown_libname_31
;setcglob {SECT_TEXT  + 000BCACB}, ;       SEH_438180
;setcglob {SECT_TEXT  + 000BCAE0}, ;       unknown_libname_32
;setcglob {SECT_TEXT  + 000BCAEB}, ;       SEH_438290
;setcglob {SECT_TEXT  + 000BCB00}, ;       unknown_libname_33
;setcglob {SECT_TEXT  + 000BCB0B}, ;       SEH_438390
;setcglob {SECT_TEXT  + 000BCB3C}, ;       unknown_libname_34
;setcglob {SECT_TEXT  + 000BCB50}, ;       unknown_libname_35
;setcglob {SECT_TEXT  + 000BCB5B}, ;       SEH_438AD0
;setcglob {SECT_TEXT  + 000BCB70}, ;       unknown_libname_36
;setcglob {SECT_TEXT  + 000BCB7B}, ;       SEH_438C10
;setcglob {SECT_TEXT  + 000BCB90}, ;       unknown_libname_37
;setcglob {SECT_TEXT  + 000BCB9B}, ;       SEH_438D10
;setcglob {SECT_TEXT  + 000BCBB0}, ;       unknown_libname_38
;setcglob {SECT_TEXT  + 000BCBBB}, ;       SEH_44A870
;setcglob {SECT_TEXT  + 000BCBDB}, ;       unknown_libname_39
;setcglob {SECT_TEXT  + 000BCBF0}, ;       unknown_libname_40
;setcglob {SECT_TEXT  + 000BCBFB}, ;       SEH_480F30
;setcglob {SECT_TEXT  + 000BCC1B}, ;       unknown_libname_41
;setcglob {SECT_TEXT  + 000BCC38}, ;       unknown_libname_42
;setcglob {SECT_TEXT  + 000BCC5B}, ;       unknown_libname_43
;setcglob {SECT_TEXT  + 000BCC78}, ;       unknown_libname_44
;setcglob {SECT_TEXT  + 000BCC9B}, ;       unknown_libname_45
;setcglob {SECT_TEXT  + 000BCCB8}, ;       unknown_libname_46
;setcglob {SECT_TEXT  + 000BCCF7}, ;       unknown_libname_47
;setcglob {SECT_TEXT  + 000BCD18}, ;       unknown_libname_48
;setcglob {SECT_TEXT  + 000BCD3B}, ;       unknown_libname_49
;setcglob {SECT_TEXT  + 000BCD7B}, ;       unknown_libname_51
;setcglob {SECT_TEXT  + 000BCD98}, ;       unknown_libname_52
;setcglob {SECT_TEXT  + 000BCDB8}, ;       unknown_libname_53
;setcglob {SECT_TEXT  + 000BCDD8}, ;       unknown_libname_54
;setcglob {SECT_TEXT  + 000BCDFB}, ;       unknown_libname_55
;setcglob {SECT_TEXT  + 000BCE18}, ;       unknown_libname_56
;setcglob {SECT_TEXT  + 000BCE3B}, ;       unknown_libname_57
;setcglob {SECT_TEXT  + 000BCE58}, ;       unknown_libname_58
;setcglob {SECT_TEXT  + 000BCE98}, ;       unknown_libname_60
;setcglob {SECT_TEXT  + 000BCEB0}, ;       unknown_libname_61
;setcglob {SECT_RDATA + 00000170}, ;       riid
;setcglob {SECT_RDATA + 00000210}, ;       rclsid
;setcglob {SECT_RDATA + 00019450}, ;       ProcName
;setcglob {SECT_RDATA + 0001946C}, ;       ModuleName
;setcglob {SECT_RDATA + 000197B8}, ;       VarName
;setcglob {SECT_RDATA + 000197EC}, ;       LibFileName
;setcglob {SECT_RDATA + 0001983C}, ;       Control
;setcglob {SECT_DATA  + 00000198}, ;       Caption
;setcglob {SECT_DATA  + 000002C0}, ;       hFile
;setcglob {SECT_DATA  + 0000031C}, ;       Text
;setcglob {SECT_DATA  + 000029D4}, ;       bool AllowFindUser
;setcglob {SECT_DATA  + 000029D8}, ;       bool AllowPageUser
;setcglob {SECT_DATA  + 000030D4}, ;       Delim
;setcglob {SECT_DATA  + 00004004}, ;       Str1
;setcglob {SECT_DATA  + 0000412C}, ;       ValueName
;setcglob {SECT_DATA  + 00004138}, ;       SubKey
;setcglob {SECT_DATA  + 00005610}, ;       int MissionNumber
;setcglob {SECT_DATA  + 0000568C}, ;       Source
;setcglob {SECT_DATA  + 00006B08}, ;       int GameState
;setcglob {SECT_DATA  + 0000AB10}, ;       int NetNetworkType
;setcglob {SECT_DATA  + 0000AB14}, ;       int MyCurrentFrameRate
;setcglob {SECT_DATA  + 0000AB18}, ;       int LimitedModelPct
;setcglob {SECT_DATA  + 0000AB68}, ;       OutputString
;setcglob {SECT_DATA  + 0000B1E4}, ;       Offset
;setcglob {SECT_DATA  + 0000BBF8}, ;       SubStr
;setcglob {SECT_DATA  + 0000CFBC}, ;       int CurrentCDTrack
;setcglob {SECT_DATA  + 0000EAD0}, ;       bool UseCampaignSelection
;setcglob {SECT_DATA  + 0000EAD8}, ;       long *MissionNumber
;setcglob {SECT_DATA  + 0000EADC}, ;       int *MissionNumber
;setcglob {SECT_DATA  + 0000EAFC}, ;       FileName
;setcglob {SECT_DATA  + 0000EB0C}, ;       PathName
;setcglob {SECT_DATA  + 0000FBEC}, ;       int MaxPlayers
;setcglob {SECT_DATA  + 0000FBF0}, ;       int DifficultyLevel
;setcglob {SECT_DATA  + 0000FBF4}, ;       int NetSerialComPort
;setcglob {SECT_DATA  + 00010444}, ;       Data
;setcglob {SECT_DATA  + 00012004}, ;       bool MoviesAllowed
;setcglob {SECT_DATA  + 00012018}, ;       int BitsPerPixel
;setcglob {SECT_DATA  + 0001201C}, ;       int GameBitsPerPixel
;setcglob {SECT_DATA  + 00012020}, ;       int ScreenWidth
;setcglob {SECT_DATA  + 00012024}, ;       int ScreenHeight
;setcglob {SECT_DATA  + 00012030}, ;       int ScrollSize
;setcglob {SECT_DATA  + 00012038}, ;       WindowName
;setcglob {SECT_DATA  + 000123FC}, ;       VolumeName
;setcglob {SECT_DATA  + 000148A0}, ;       __wctype
;setcglob {SECT_DATA  + 00014AA4}, ;       SrcSizeInBytes
;setcglob {SECT_DATA  + 00014ADC}, ;       lpMem
;setcglob {SECT_DATA  + 00016B1C}, ;       lpBuffer
;setcglob {SECT_DATA  + 0001760C}, ;       Direct_Sound_Object
;setcglob {SECT_DATA  + 00017EB8}, ;       __VQAClassObject
;setcglob {SECT_DATA  + 00018018}, ;       char LoginName
;setcglob {SECT_DATA  + 00018340}, ;       Dest
;setcglob {SECT_DATA  + 00018440}, ;       char Password
;setcglob {SECT_DATA  + 00018F64}, ;       Addend
;setcglob {SECT_DATA  + 0001A9C0}, ;       Handles
;setcglob {SECT_DATA  + 0001A9C8}, ;       hEvent
;setcglob {SECT_DATA  + 0001AB40}, ;       char GamePassword
;setcglob {SECT_DATA  + 0001ACA0}, ;       bool DontDoReconnect
;setcglob {SECT_DATA  + 0001ACA4}, ;       bool DoDisconnectInMain
;setcglob {SECT_DATA  + 0001ACCC}, ;       bool GotOfficialChatChannels
;setcglob {SECT_DATA  + 0001ACE0}, ;       bool ShowLatency
;setcglob {SECT_DATA  + 0001ACF0}, ;       bool Microphone
;setcglob {SECT_DATA  + 0001AD00}, ;       bool LanguageFilter
;setcglob {SECT_DATA  + 0001AD04}, ;       bool ShowAllGames
;setcglob {SECT_DATA  + 0001AD14}, ;       Args
;setcglob {SECT_DATA  + 0001AD3C}, ;       bool TournamentGame
;setcglob {SECT_DATA  + 0001AD40}, ;       bool PrivateGame
;setcglob {SECT_DATA  + 0001B094}, ;       Value
;setcglob {SECT_DATA  + 0001B0E4}, ;       void *WOLInstance
;setcglob {SECT_DATA  + 0003A488}, ;       char *Resource_Path
;setcglob {SECT_DATA  + 0003A5B8}, ;       char *Music_Resource_Path
;setcglob {SECT_DATA  + 0003A650}, ;       char *Missions_Resource_Path
;setcglob {SECT_DATA  + 0003A6E8}, ;       char *Maps_Resource_Path
;setcglob {SECT_DATA  + 0003A864}, ;       hrgn
;setcglob {SECT_DATA  + 0003CBC0}, ;       int HighScore0
;setcglob {SECT_DATA  + 0003CC9C}, ;       int HighScore1
;setcglob {SECT_DATA  + 0003CD78}, ;       int HighScore2
;setcglob {SECT_DATA  + 0003D288}, ;       String2
;setcglob {SECT_DATA  + 0003D481}, ;       __Radar_Is_Online?
;setcglob {SECT_DATA  + 0003D5C8}, ;       char CurrentTileData
;setcglob {SECT_DATA  + 0003D6A0}, ;       char CurrentTileSet
;setcglob {SECT_DATA  + 0003E3F4}, ;       int Ticks
;setcglob {SECT_DATA  + 0003E8A4}, ;       bool SkipIntro
;setcglob {SECT_DATA  + 0003E8BC}, ;       bool LoadSavedGame
;setcglob {SECT_DATA  + 0003E8C0}, ;       char *LoadFileID
;setcglob {SECT_DATA  + 0003E8C4}, ;       bool DebugMode
;setcglob {SECT_DATA  + 001DD3B0}, ;       hHeap
;setcglob {SECT_DATA  + 001DF274}, ;       bool Win
;setcglob {SECT_DATA  + 001DF278}, ;       bool Lose
;setcglob {SECT_DATA  + 001E03F8}, ;       char NetPlayerName
;setcglob {SECT_DATA  + 001E0468}, ;       char NetSessionName
;setcglob {SECT_DATA  + 001E07A8}, ;       char NetRejectPlayerName
;setcglob {SECT_DATA  + 001E0830}, ;       int PulseCounter
;setcglob {SECT_DATA  + 001E0834}, ;       bool NetCrates
;setcglob {SECT_DATA  + 001E0838}, ;       int NetWorms
;setcglob {SECT_DATA  + 001E0840}, ;       int NetPlayerSide
;setcglob {SECT_DATA  + 001E0844}, ;       int NetPlayerColour
;setcglob {SECT_DATA  + 001E0848}, ;       int NetPlayerHandicap
;setcglob {SECT_DATA  + 001E0864}, ;       int LimitedModelRate
;setcglob {SECT_DATA  + 001E0900}, ;       File
;setcglob {SECT_DATA  + 00203470}, ;       char MissionMapData
;setcglob {SECT_DATA  + 00220840}, ;       char MissionMap
;setcglob {SECT_DATA  + 002BC55C}, ;       DstBuf
;setcglob {SECT_DATA  + 002BC564}, ;       Count
;setcglob {SECT_DATA  + 002BC604}, ;       bool RepeatTrack
;setcglob {SECT_DATA  + 002BE5A0}, ;       char *ColourTable
;setcglob {SECT_DATA  + 002BE5A8}, ;       char *TextTable
;setcglob {SECT_DATA  + 002BE5B0}, ;       char *MenuTable
;setcglob {SECT_DATA  + 002BE5B8}, ;       char *SampleTable
;setcglob {SECT_DATA  + 002BE5D0}, ;       char NetIPAddress
;setcglob {SECT_DATA  + 002BE638}, ;       char NetMap
;setcglob {SECT_DATA  + 002BE960}, ;       char NetModemPhone
;setcglob {SECT_DATA  + 002BEAA8}, ;       char NetMapDesc
;setcglob {SECT_DATA  + 002BEDE8}, ;       bool DisconnectingWOL
;setcglob {SECT_DATA  + 002BEDF0}, ;       __bSpawned?
;setcglob {SECT_DATA  + 002BEE0C}, ;       bool StorePassword
;setcglob {SECT_DATA  + 002BEE1C}, ;       bool RestartGame
;setcglob {SECT_DATA  + 002BEE20}, ;       bool CancelConnect
;setcglob {SECT_DATA  + 002BEE34}, ;       int GameType
;setcglob {SECT_DATA  + 002BEE48}, ;       bool CallerIDOn
;setcglob {SECT_DATA  + 002BF4C4}, ;       __bNetworkGame?
;setcglob {SECT_DATA  + 002BF4D4}, ;       bool BitsPerPixelChanged
;setcglob {SECT_DATA  + 002BF4D8}, ;       int MenuDraw::FromTopPixel
;setcglob {SECT_DATA  + 002BF4E4}, ;       int Force480
;setcglob {SECT_DATA  + 002BF4EC}, ;       hWnd
;setcglob {SECT_DATA  + 002BF4F0}, ;       void *ProgramInstance
;setcglob {SECT_DATA  + 002BF4F4}, ;       gDirectDraw
;setcglob {SECT_DATA  + 002BF518}, ;       int FramesPerSecond
;setcglob {SECT_DATA  + 002BF544}, ;       int MySideID
;setcglob {SECT_DATA  + 002E3ACC}, ;       __Player_Credits?
;setcglob {SECT_DATA  + 003F4564}, ;       Memory
;setcglob {SECT_DATA  + 003F4570}, ;       lp
;setcglob {SECT_DATA  + 003F45D0}, ;       Locale
;setcglob {SECT_DATA  + 003F45E0}, ;       CodePage
;setcglob {SECT_DATA  + 003F4610}, ;       Filename
;setcglob {SECT_DATA  + 003F4848}, ;       lpTopLevelExceptionFilter
;setcglob {SECT_DATA  + 003F4890}, ;       TimeZoneInformation
;setcglob {SECT_DATA  + 003F4AA0}, ;       uNumber
;setcglob {SECT_DATA  + 003F5AC0}, ;       NumOfElements
