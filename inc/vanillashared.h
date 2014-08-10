// This header works with asym.sym which defines the Vanilla symbols
// This header will be split up as it becomes larger

// Variables
extern int MousePositionX;
extern int MousePositionY;

extern int MySideID;
extern bool Win;
extern bool Lose;
extern int DifficultyLevel;
extern int GameType;

extern char NetworkGame;
extern int NetUnitCount;
extern int NetTechLevel;
extern int NetAIPlayers;
extern int MaxPlayers;
extern bool TournamentGame;
extern bool PrivateGame;
extern bool NetCrates;
extern int NetWorms;
extern int NetPlayerHandicap;


// Functions
unsigned char __fastcall _Text_On_Screen(int a1, int a2, int a3, int a4, int a5, int a6, unsigned char a7, int a8, int a9);