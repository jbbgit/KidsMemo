unit MemoUnit;

{-------------------------------------------------------------------------}
{ Change Record:                                                          }
{-------------------------------------------------------------------------}
// 16/04/00 : V1.00 : Original version
//
// 17/04/00 : xxxxx : NewHigh now plays sound (Jingle1)
//                    External NewHigh also plays Async. as built-in
//
// 28/05/00 : xxxxx : ComputerPlays now set AutoClose before starting. This
//                    fixed the problem with bad timing or even hanging when
//                    the computer played.
//
// 01/06/00 : V1.01 : Exit button added to playframe
//
// 18/07/00 : V1.01b: Initialize procedure revised so that the selected number
//                    of pieces are scrambled in the piecearray if there are
//                    more selected pieces than needed. Before the pieces would
//                    be static and not change if more than needed pieces where
//                    selected.
//                    Possibillity to pay in Australian doller w. register.exe
//
// 29/07/00 : xxxxx : Added button to select custum sound for close of the tiles.
//
// 08/08/00 : xxxxx : Delay time for autoclose of the tiles added to the menu.
//
//
// 06/09/00 : xxxxx : The pieces where closed two times in the Initialize procedure.
//                    Support for animated GIF images added.
//                    Now menu functions: all selections, Load/Write Setup, Register
//                    and View HighScore returns to the main menu and a new game is
//                    first startet after the DONE button is clicked in this menu.
//
//26/09/00 : V2.00 :  Change to Animated KidsMemo:
//
//                    The piece images now supports animated GIF images.
//                    GIF transperency can be turned ON/OFF.
//                    Setup registry key changed to AnimatedKidsMemo.
//                    The "F1 for help" label is clickable.
//                    All clickable items on the playframe now acts according to
//                    the double click for menu setting.
//
//                    Now three help menues with next/prev/quit labels and the last
//                    seen help page is remembered until the program is closed.
//
//                    Animated KidsMemo will accept a .kms file as the first command line
//                    parameter and use that for the game.
//
//                    If Animated KidsMemo is started for the first time the AnimGIFs
//                    .kms file will be loaded.
//
//03/10/00 : V2.10 :  Computerplays now keeps previous setting of AutoClose.
//
//                    In the PlayGame procedure a new Wait (WaitP) is now called which
//                    allows Windows to process messages. This has the effect that
//                    matching Animated GIFs will animate before close and the animated
//                    pieces also works fine in Computer Plays mode.
//
//                    New SLock keys in registry
//
//                    If version difference betwen registry and program then the
//                    default settings is used and AnimGIFs.kms is loaded.
//
//                    The version (Ver) is displayed in the main help pages.
//
//18/10/00 : V2.20 :  48 piece mode added
//
//17/12/00 : V2.30 :  Showhigh procedure in ComForms changed to display 48 piece
//                    mode.

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Registry, IniFiles, Jpeg, Mmsystem, ComForms, CoolForm,
  LedDisplay, GifImage, Slock, MPlayer;

const
             Ver: string = '2.30';
           Build: string = '1A';

type

 {Enumeration of the 31 possible sounds}
  TSndName = ( sP1,  sP2,  sP3,  sP4,  sP5,  sP6,  sP7,  sP8,  sP9,
               sP10, sP11, sP12, sP13, sP14, sP15, sP16, sP17, sP18,
               sP19, sP20, sP21, sP22, sP23, sP24, sClose, sSelect,
               sDeSelect, sAutoOn, sAutoOff, sWrong, sMatch, sFinish, sHigh);

  THighRec = record           {HigScore info for one player}
               Name : string;
               Hour : integer;
                Min : integer;
                Sec : integer;
               Draw : integer;
             end;

  TBestArray = array[0..7] of THighRec;

 TForm1 = class(TForm)
    P0: TImage;
    P1: TImage;
    P2: TImage;
    P3: TImage;
    P4: TImage;
    P5: TImage;
    P6: TImage;
    P7: TImage;
    P8: TImage;
    P9: TImage;
    P10: TImage;
    P11: TImage;
    P12: TImage;
    P13: TImage;
    P14: TImage;
    P15: TImage;
    P16: TImage;
    P17: TImage;
    P18: TImage;
    P19: TImage;
    P20: TImage;
    P21: TImage;
    P22: TImage;
    P23: TImage;
    P24: TImage;
    P25: TImage;
    P26: TImage;
    P27: TImage;
    P28: TImage;
    P29: TImage;
    P30: TImage;
    P31: TImage;
    P32: TImage;
    P33: TImage;
    P34: TImage;
    P35: TImage;
    P36: TImage;
    P37: TImage;
    P38: TImage;
    P39: TImage;
    P40: TImage;
    P41: TImage;
    P42: TImage;
    P43: TImage;
    P44: TImage;
    P45: TImage;
    P46: TImage;
    P47: TImage;
    BgImage: TImage;
    PlayForm: TCoolForm;
    GameDisp100: TLedDisplay;
    GameDisp10: TLedDisplay;
    GameDisp1: TLedDisplay;
    HighDisp100: TLedDisplay;
    HighDisp10: TLedDisplay;
    HighDisp1: TLedDisplay;
    TimeLabel: TLabel;
    Timer1: TTimer;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    MenuLab: TLabel;
    Slock1: TSlock;
    TrnspImg2: TImage;
    AnKmImg: TImage;
    HelpLab: TLabel;
    procedure PlayResourceSound(Sound, Rtype : string; SYNC : boolean);
    procedure PlaySound(WavFileName: String; SYNC:boolean);
    procedure Wait(t:integer); {Waits for t milliseconds}
    procedure WaitP(t:integer); {Waits for t milliseconds and lets Windows process messages}
    procedure Snd(Sound: TSndName);
    procedure PictureRefresh(Pos:integer);
    procedure RemovePos(Pos : integer);
    procedure ClosePos(pos : integer);
    procedure OpenPos(pos : integer);
    procedure UpDateHigh(var Best: TBestArray);
    procedure PlayGame(Pos : integer);
    procedure FormActivate(Sender: TObject);
    procedure UpDateReg;
    procedure UpdateGameDisp(NT : integer);
    procedure UpdateBestDisp(BT : integer);
    procedure Initialize(Sender: TObject);
    procedure HelpKey;
    procedure ACloseKey;
    procedure RegisterKey;
    procedure BgSelectKey;
    procedure VersionKey;
    procedure CvSelectKey;
    procedure PsSelectKey;
    procedure WriteSetupKey;
    procedure GetKms(FileName: string);
    procedure LoadSetupKey;
    procedure SndSelectKey;
    procedure DeleteRegistry;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure RegNow;
    Procedure SetDefaults;
    procedure InitVars;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure P0Click(Sender: TObject);
    procedure P1Click(Sender: TObject);
    procedure P2Click(Sender: TObject);
    procedure P3Click(Sender: TObject);
    procedure P4Click(Sender: TObject);
    procedure P5Click(Sender: TObject);
    procedure P6Click(Sender: TObject);
    procedure P7Click(Sender: TObject);
    procedure P8Click(Sender: TObject);
    procedure P9Click(Sender: TObject);
    procedure P10Click(Sender: TObject);
    procedure P11Click(Sender: TObject);
    procedure P12Click(Sender: TObject);
    procedure P13Click(Sender: TObject);
    procedure P14Click(Sender: TObject);
    procedure P15Click(Sender: TObject);
    procedure P16Click(Sender: TObject);
    procedure P17Click(Sender: TObject);
    procedure P18Click(Sender: TObject);
    procedure P19Click(Sender: TObject);
    procedure P20Click(Sender: TObject);
    procedure P21Click(Sender: TObject);
    procedure P22Click(Sender: TObject);
    procedure P23Click(Sender: TObject);
    procedure P24Click(Sender: TObject);
    procedure P25Click(Sender: TObject);
    procedure P26Click(Sender: TObject);
    procedure P27Click(Sender: TObject);
    procedure P28Click(Sender: TObject);
    procedure P29Click(Sender: TObject);
    procedure P30Click(Sender: TObject);
    procedure P31Click(Sender: TObject);
    procedure P32Click(Sender: TObject);
    procedure P33Click(Sender: TObject);
    procedure P34Click(Sender: TObject);
    procedure P35Click(Sender: TObject);
    procedure P36Click(Sender: TObject);
    procedure P37Click(Sender: TObject);
    procedure P38Click(Sender: TObject);
    procedure P39Click(Sender: TObject);
    procedure P40Click(Sender: TObject);
    procedure P41Click(Sender: TObject);
    procedure P42Click(Sender: TObject);
    procedure P43Click(Sender: TObject);
    procedure P44Click(Sender: TObject);
    procedure P45Click(Sender: TObject);
    procedure P46Click(Sender: TObject);
    procedure P47Click(Sender: TObject);
    procedure BgImageClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure RegisterKms;
    procedure ComputerPlay;
    procedure HighDisp100Click(Sender: TObject);
    procedure MenuClick;
    procedure MenuLabClick(Sender: TObject);
    procedure MenuLabDblClick(Sender: TObject);
    procedure Slock1Register(Sender: TObject);
    procedure Slock1WrongUnlockCode(Sender: TObject);
    procedure Slock1InGracePeriod(Sender: TObject);
    procedure Slock1Expired(Sender: TObject);
    procedure TrnspImg2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HelpLabClick(Sender: TObject);
    procedure HelpLabDblClick(Sender: TObject);
    procedure TrnspImg2DblClick(Sender: TObject);
    procedure HighDisp100DblClick(Sender: TObject);

  private


  public

      BgSel: array[0..2] of Boolean; {True if corr. Bg image is selected}
 BgImageNum: integer;                {Image number for the bg image}
      ExtBg: array[0..2] of boolean; {True if the corr. Bg image is custum}
     ExtBgP: array[0..2] of string;  {Path names for custum selected Bg images}

      CvSel: array[0..2] of Boolean; {True if corr. Cv image is selected}
 CvImageNum: integer;                {Image number for the cover image}
      ExtCv: array[0..2] of boolean; {True if the corr. Cv image is custum}
     ExtCvP: array[0..2] of string;  {Path names for custum selected Cv images}


      PsSel: array[0..23] of Boolean; {True if corr. Ps image is selected}
   NumPsSel: Integer;                 {Number of selected Ps image [0->10]}
      ExtPs: array[0..23] of boolean; {True if the corr. Ps image is custum}
     ExtPsP: array[0..23] of string;  {Paths for the custum selected cover images}

     SndSel: array[0..32] of boolean; {True if corresp. sound is external}
     ExtSnd: array[0..32] of string; {Holds the path names of the ext. sounds}

 PieceArray: array[0..23] of integer; {Image numbers for the 2,6, 10 or 24 pieces}
  NumPieces: integer;                {Number of pieces in game}

      Best4: TBestArray;
     Best12: TBestArray;
     Best20: TBestArray;
     Best48: TBestArray;
    NewHigh: boolean;
   ShowHigh: boolean;
  AutoClose: boolean;    {Auto/Manual close of the pieces}
  DobbClick: boolean;    {True if double click on frame for Menu}
    TrspGIF: boolean;    {True if GIF transperancy mode used}
    CloseDly: integer;   {Delay for AutoClos}
    LastHelp: integer;   {Last help page displayed (not saved to registry)}

  KidsMemoPath: string;  {Holds the path of KidsMemo.exe when executed}
          LKmP: string;  {Holds the last path of KidsMemo.exe}
    LastCvPath: string;  {Last place CV images loaded from - or KidsMemoPath}
    LastBgPath: string;  {Last place Bg images loaded from - or KidsMemoPath}
    LastPsPath: string;  {Last place Ps images loaded from - or KidsMemoPath}
   LastSndPath: string;  {Last place sounds loaded from - or KidsMemoPath}


  RegData: TRegistry;
  KeyName: string;
  RegUser: boolean; {Indicates if it is an registered user (init, on start-up)}

     {Enumeration of the 6 ComForm menu's}
     ComMenu : (mHelp, mRegister, mBackground, mCover, mPiece, mSound, mWrite,
                mMenu, mHigh, mNewHigh, MHelp2, mHelp3);

 end;

var
     Form1: TForm1;

implementation

const
          Pos48X: array[0..7] of integer = (88, 165, 242, 319, 396, 473, 550, 627);
          Pos48Y: array[0..5] of integer = (73, 150, 227, 304,381, 458);
          Pos20X: array[0..4] of integer = (102,220,338,456,574);
          Pos20Y: array[0..3] of integer = (68,186,304,422);
          Pos12X: array[0..3] of integer = (89,244,399,554);
          Pos12Y: array[0..2] of integer = (73,228,383);
           Pos4X: array[0..1] of integer = (167,399);
           Pos4Y: array[0..1] of integer = (74,305);

var
                     PosImg: array[0..47] of integer;
          IsOpen, PosIsLeft: array[0..47] of boolean;
       WaitOnClose, DoMatch: boolean;
                   Finished: boolean;
                       Beta: Boolean;
                    PcPlays: boolean;
   FirstOpened, GameStarted: boolean;
      NumOpen, NumPairsLeft: integer;
                     CurPos: integer;
                  PieceSize: Integer;

                   NumTries: integer;
                    NumUsed: integer;
                     RegVer: string;


           PlayFormJpgImage: TJPEGImage;

    PosIMG0, PosIMG1, PosIMG2, PosIMG3  : TJPEGImage;
    PosIMG4, PosIMG5, PosIMG6, PosIMG7  : TJPEGImage;
    PosIMG8, PosIMG9, PosIMG10,PosIMG11 : TJPEGImage;
  PosIMG12, PosIMG13, PosIMG14,PosIMG15 : TJPEGImage;
  PosIMG16, PosIMG17, PosIMG18,PosIMG19 : TJPEGImage;

  PosIMG20, PosIMG21, PosIMG22,PosIMG23 : TJPEGImage;
  PosIMG24, PosIMG25, PosIMG26,PosIMG27 : TJPEGImage;
  PosIMG28, PosIMG29, PosIMG30,PosIMG31 : TJPEGImage;
  PosIMG32, PosIMG33, PosIMG34,PosIMG35 : TJPEGImage;
  PosIMG36, PosIMG37, PosIMG38,PosIMG39 : TJPEGImage;
  PosIMG40, PosIMG41, PosIMG42,PosIMG43 : TJPEGImage;
  PosIMG44, PosIMG45, PosIMG46,PosIMG47 : TJPEGImage;

          BgJpgImage, CloseIMG, TmpIMG  : TJPEGImage;

    PosGif0, PosGif1, PosGif2, PosGif3  : TGIFImage;
    PosGif4, PosGif5, PosGif6, PosGif7  : TGIFImage;
    PosGif8, PosGif9, PosGif10,PosGif11 : TGIFImage;
  PosGif12, PosGif13, PosGif14,PosGif15 : TGIFImage;
  PosGif16, PosGif17, PosGif18,PosGif19 : TGIFImage;

  PosGif20, PosGif21, PosGif22,PosGif23 : TGIFImage;
  PosGif24, PosGif25, PosGif26,PosGif27 : TGIFImage;
  PosGif28, PosGif29, PosGif30,PosGif31 : TGIFImage;
  PosGif32, PosGif33, PosGif34,PosGif35 : TGIFImage;
  PosGif36, PosGif37, PosGif38,PosGif39 : TGIFImage;
  PosGif40, PosGif41, PosGif42,PosGif43 : TGIFImage;
  PosGif44, PosGif45, PosGif46,PosGif47 : TGIFImage;

                                AnKmGif : TGIFImage;
                               TrnsBMP2 : TBitmap;

                               StartTime: TDateTime;
                    Hour, Min, Sec, Msec: Word;

      RStrA1,RStrA2,RStrB1,RStrB2,RStrB3: string;

{$R *.DFM}

function GetFileName(Pos : integer):string;
var Fstr : string;
begin
  Str(PosImg[Pos], Fstr);
  GetFileName:='Image' + Fstr;
end;

procedure TForm1.UpDateReg;
var n: integer;
begin
  {Save BestTries to registry}
  RegData.OpenKey(KeyName,True);

  RegData.WriteString('LKmP', KidsMemoPath);
  RegData.WriteString('RegVer', Ver);
  RegData.WriteString('(Standard)', 'If entries changed, KidsMemo will not operate properly !');
  RegData.WriteBool('AuCl', AutoClose);
  RegData.WriteBool('SHigh', ShowHigh);
  RegData.WriteBool('DblCl', DobbClick);
  RegData.WriteBool('TrspGIF', TrspGIF);
  RegData.WriteInteger('Used', NumUsed);
  RegData.WriteInteger('NumP', NumPieces);
  RegData.WriteInteger('CloseDly',CloseDly);

  for n:=0 to 2 do
  begin
    RegData.WriteBool('ExtBg'+IntToStr(n+1), ExtBg[n]);
    RegData.WriteString('XBg'+IntToStr(n+1), ExtBgP[n]);
    RegData.WriteBool('BgSel'+IntToStr(n+1), BgSel[n]);

    RegData.WriteBool('ExtCv'+IntToStr(n+1), ExtCv[n]);
    RegData.WriteString('XCv'+IntToStr(n+1), ExtCvP[n]);
    RegData.WriteBool('CvSel'+IntToStr(n+1), CvSel[n]);
  end;

  RegData.WriteInteger('NumPsSel', NumPsSel);
  for n:=0 to 23 do
  begin
    RegData.WriteBool('ExtPs'+IntToStr(n+1), ExtPs[n]);
    RegData.WriteBool('PsSel'+IntToStr(n+1), PsSel[n]);
    RegData.WriteString('XPs'+IntToStr(n+1), ExtPsP[n]);
  end;

  for n:=0 to 23 do RegData.WriteInteger('PA'+IntToStr(n), PieceArray[n]);

  for n:=0 to 32 do
  begin
   RegData.WriteString('ExtSnd'+IntToStr(n), ExtSnd[n]);
   RegData.WriteBool('SndSel'+IntToStr(n), SndSel[n]);
  end;

  for n:=0 to 7 do
  begin
    with Best4[n] do
    begin
      RegData.WriteString('B4N'+IntToStr(n), Name);
      RegData.WriteInteger('B4H'+IntToStr(n), Hour);
      RegData.WriteInteger('B4M'+IntToStr(n), Min);
      RegData.WriteInteger('B4S'+IntToStr(n), Sec);
      RegData.WriteInteger('B4D'+IntToStr(n), Draw);
    end;
    with Best12[n] do
    begin
      RegData.WriteString('B12N'+IntToStr(n), Name);
      RegData.WriteInteger('B12H'+IntToStr(n), Hour);
      RegData.WriteInteger('B12M'+IntToStr(n), Min);
      RegData.WriteInteger('B12S'+IntToStr(n), Sec);
      RegData.WriteInteger('B12D'+IntToStr(n), Draw);
    end;
    with Best20[n] do
    begin
      RegData.WriteString('B20N'+IntToStr(n), Name);
      RegData.WriteInteger('B20H'+IntToStr(n), Hour);
      RegData.WriteInteger('B20M'+IntToStr(n), Min);
      RegData.WriteInteger('B20S'+IntToStr(n), Sec);
      RegData.WriteInteger('B20D'+IntToStr(n), Draw);
    end;
    with Best48[n] do
    begin
      RegData.WriteString('B48N'+IntToStr(n), Name);
      RegData.WriteInteger('B48H'+IntToStr(n), Hour);
      RegData.WriteInteger('B48M'+IntToStr(n), Min);
      RegData.WriteInteger('B48S'+IntToStr(n), Sec);
      RegData.WriteInteger('B48D'+IntToStr(n), Draw);
    end;
  end;

  RegData.WriteString('LCvP', LastCvPath);
  RegData.WriteString('LBgP', LastBgPath);
  RegData.WriteString('LPsP', LastPsPath);
  RegData.WriteString('LSndP', LastSndPath);
end;

procedure TForm1.PlayResourceSound(Sound, Rtype : string; SYNC : boolean);
var h1,h2 : THandle;
        p : Pointer;
begin
  h1:=FindResource(Hinstance, PChar(Sound), PChar(Rtype));
  h2:=LoadResource(Hinstance, h1);
   p:=LockResource(h2);
  if SYNC then
   sndPlaySound(p, SND_SYNC or SND_MEMORY)
  else
   sndPlaySound(p, SND_ASYNC or SND_MEMORY);
  if h2<>0 then
  begin
    UnlockResource(h2);
    FreeResource(h2);
  end;
end;

procedure TForm1.PlaySound(WavFileName: String; SYNC:boolean);
var
   s: Array[0..79] of char;
begin
  {Convert filename to a null-terminated string}
  StrPCopy(s, WavFileName);
  {Play the sound}
  if SYNC then
    sndPlaySound(s, 1)
  else
    sndPlaySound(s, 0);
end;

procedure TForm1.Snd(Sound: TSndName);
begin
  if SndSel[Ord(Sound)] then {It is an external sound}
  begin
    if (Sound=sFinish) or (Sound=sHigh) then
      PlaySound(ExtSnd[Ord(Sound)], False)
    else
      PlaySound(ExtSnd[Ord(Sound)], False);
  end else                  {It is an built-in sound sound}
  begin
   if Ord(Sound)<24 then
     PlayResourceSound('Open','wave',True) {Play built-in sound for open pieces}
   else
   begin                 {It is an event sound}
     Case Sound of
        sClose: PlayResourceSound('Close', 'wave', False);
       sSelect: PlayResourceSound('Vineup', 'wave', False);
     sDeselect: PlayResourceSound('Pair', 'wave', False);
       sAutoOn: PlayResourceSound('Sweep', 'wave', False);
      sAutoOff: PlayResourceSound('Vineup', 'wave', False);
        sWrong: PlayResourceSound('Wrong', 'wave', False);
        sMatch: PlayResourceSound('Clap', 'wave', False);
       sFinish: PlayResourceSound('Jingle1', 'wave', True);
         sHigh: PlayResourceSound('Bifald', 'wave', True);
     end;
   end;
  end;
end;

procedure TForm1.Wait(t:integer); {Waits for t milliseconds}

var         t1 : TDateTime;
      H,M,S,MS : word;

begin
  t1:=now;
  repeat
    DecodeTime(now-t1,H,M,S,MS);
  until ((S*1000)+Ms>=t);
end;

procedure TForm1.WaitP(t:integer); {Waits for t milliseconds}

var         t1 : TDateTime;
      H,M,S,MS : word;

begin
  t1:=now;
  repeat
    DecodeTime(now-t1,H,M,S,MS);
    Application.ProcessMessages;
  until ((S*1000)+Ms>=t);
end;

procedure TForm1.PictureRefresh(Pos:integer);
begin
  case Pos of
    0 : P0.Update;
    1 : P1.Update;
    2 : P2.Update;
    3 : P3.Update;
    4 : P4.Update;
    5 : P5.Update;
    6 : P6.Update;
    7 : P7.Update;
    8 : P8.Update;
    9 : P9.Update;
   10 : P10.Update;
   11 : P11.Update;
   12 : P12.Update;
   13 : P13.Update;
   14 : P14.Update;
   15 : P15.Update;
   16 : P16.Update;
   17 : P17.Update;
   18 : P18.Update;
   19 : P19.Update;
   20 : P20.Update;
   21 : P21.Update;
   22 : P22.Update;
   23 : P23.Update;
   24 : P24.Update;
   25 : P25.Update;
   26 : P26.Update;
   27 : P27.Update;
   28 : P28.Update;
   29 : P29.Update;
   30 : P30.Update;
   31 : P31.Update;
   32 : P32.Update;
   33 : P33.Update;
   34 : P34.Update;
   35 : P35.Update;
   36 : P36.Update;
   37 : P37.Update;
   38 : P38.Update;
   39 : P39.Update;
   40 : P40.Update;
   41 : P41.Update;
   42 : P42.Update;
   43 : P43.Update;
   44 : P44.Update;
   45 : P45.Update;
   46 : P46.Update;
   47 : P47.Update;
  end;
end;

procedure TForm1.RemovePos(Pos : integer);
begin
  case Pos of
    0 : P0.Visible:=false;
    1 : P1.Visible:=false;
    2 : P2.Visible:=false;
    3 : P3.Visible:=false;
    4 : P4.Visible:=false;
    5 : P5.Visible:=false;
    6 : P6.Visible:=false;
    7 : P7.Visible:=false;
    8 : P8.Visible:=false;
    9 : P9.Visible:=false;
   10 : P10.Visible:=false;
   11 : P11.Visible:=false;
   12 : P12.Visible:=false;
   13 : P13.Visible:=false;
   14 : P14.Visible:=false;
   15 : P15.Visible:=false;
   16 : P16.Visible:=false;
   17 : P17.Visible:=false;
   18 : P18.Visible:=false;
   19 : P19.Visible:=false;
   20 : P20.Visible:=false;
   21 : P21.Visible:=false;
   22 : P22.Visible:=false;
   23 : P23.Visible:=false;
   24 : P24.Visible:=false;
   25 : P25.Visible:=false;
   26 : P26.Visible:=false;
   27 : P27.Visible:=false;
   28 : P28.Visible:=false;
   29 : P29.Visible:=false;
   30 : P30.Visible:=false;
   31 : P31.Visible:=false;
   32 : P32.Visible:=false;
   33 : P33.Visible:=false;
   34 : P34.Visible:=false;
   35 : P35.Visible:=false;
   36 : P36.Visible:=false;
   37 : P37.Visible:=false;
   38 : P38.Visible:=false;
   39 : P39.Visible:=false;
   40 : P40.Visible:=false;
   41 : P41.Visible:=false;
   42 : P42.Visible:=false;
   43 : P43.Visible:=false;
   44 : P44.Visible:=false;
   45 : P45.Visible:=false;
   46 : P46.Visible:=false;
   47 : P47.Visible:=false;
  end;

  case Pos of
    0 : P0.Picture.Graphic := nil;
    1 : P1.Picture.Graphic := nil;
    2 : P2.Picture.Graphic := nil;
    3 : P3.Picture.Graphic := nil;
    4 : P4.Picture.Graphic := nil;
    5 : P5.Picture.Graphic := nil;
    6 : P6.Picture.Graphic := nil;
    7 : P7.Picture.Graphic := nil;
    8 : P8.Picture.Graphic := nil;
    9 : P9.Picture.Graphic := nil;
   10 : P10.Picture.Graphic := nil;
   11 : P11.Picture.Graphic := nil;
   12 : P12.Picture.Graphic := nil;
   13 : P13.Picture.Graphic := nil;
   14 : P14.Picture.Graphic := nil;
   15 : P15.Picture.Graphic := nil;
   16 : P16.Picture.Graphic := nil;
   17 : P17.Picture.Graphic := nil;
   18 : P18.Picture.Graphic := nil;
   19 : P19.Picture.Graphic := nil;
   20 : P20.Picture.Graphic := nil;
   21 : P21.Picture.Graphic := nil;
   22 : P22.Picture.Graphic := nil;
   23 : P23.Picture.Graphic := nil;
   24 : P24.Picture.Graphic := nil;
   25 : P25.Picture.Graphic := nil;
   26 : P26.Picture.Graphic := nil;
   27 : P27.Picture.Graphic := nil;
   28 : P28.Picture.Graphic := nil;
   29 : P29.Picture.Graphic := nil;
   30 : P30.Picture.Graphic := nil;
   31 : P31.Picture.Graphic := nil;
   32 : P32.Picture.Graphic := nil;
   33 : P33.Picture.Graphic := nil;
   34 : P34.Picture.Graphic := nil;
   35 : P35.Picture.Graphic := nil;
   36 : P36.Picture.Graphic := nil;
   37 : P37.Picture.Graphic := nil;
   38 : P38.Picture.Graphic := nil;
   39 : P39.Picture.Graphic := nil;
   40 : P40.Picture.Graphic := nil;
   41 : P41.Picture.Graphic := nil;
   42 : P42.Picture.Graphic := nil;
   43 : P43.Picture.Graphic := nil;
   44 : P44.Picture.Graphic := nil;
   45 : P45.Picture.Graphic := nil;
   46 : P46.Picture.Graphic := nil;
   47 : P47.Picture.Graphic := nil;
  end;
  PictureRefresh(Pos);
  IsOpen[Pos]:=false;
  PosIsLeft[Pos]:=false;
end;

procedure TForm1.ClosePos(Pos : integer);
begin
  case Pos of
    0 : P0.Picture.Assign(CloseIMG);
    1 : P1.Picture.Assign(CloseIMG);
    2 : P2.Picture.Assign(CloseIMG);
    3 : P3.Picture.Assign(CloseIMG);
    4 : P4.Picture.Assign(CloseIMG);
    5 : P5.Picture.Assign(CloseIMG);
    6 : P6.Picture.Assign(CloseIMG);
    7 : P7.Picture.Assign(CloseIMG);
    8 : P8.Picture.Assign(CloseIMG);
    9 : P9.Picture.Assign(CloseIMG);
   10 : P10.Picture.Assign(CloseIMG);
   11 : P11.Picture.Assign(CloseIMG);
   12 : P12.Picture.Assign(CloseIMG);
   13 : P13.Picture.Assign(CloseIMG);
   14 : P14.Picture.Assign(CloseIMG);
   15 : P15.Picture.Assign(CloseIMG);
   16 : P16.Picture.Assign(CloseIMG);
   17 : P17.Picture.Assign(CloseIMG);
   18 : P18.Picture.Assign(CloseIMG);
   19 : P19.Picture.Assign(CloseIMG);
   20 : P20.Picture.Assign(CloseIMG);
   21 : P21.Picture.Assign(CloseIMG);
   22 : P22.Picture.Assign(CloseIMG);
   23 : P23.Picture.Assign(CloseIMG);
   24 : P24.Picture.Assign(CloseIMG);
   25 : P25.Picture.Assign(CloseIMG);
   26 : P26.Picture.Assign(CloseIMG);
   27 : P27.Picture.Assign(CloseIMG);
   28 : P28.Picture.Assign(CloseIMG);
   29 : P29.Picture.Assign(CloseIMG);
   30 : P30.Picture.Assign(CloseIMG);
   31 : P31.Picture.Assign(CloseIMG);
   32 : P32.Picture.Assign(CloseIMG);
   33 : P33.Picture.Assign(CloseIMG);
   34 : P34.Picture.Assign(CloseIMG);
   35 : P35.Picture.Assign(CloseIMG);
   36 : P36.Picture.Assign(CloseIMG);
   37 : P37.Picture.Assign(CloseIMG);
   38 : P38.Picture.Assign(CloseIMG);
   39 : P39.Picture.Assign(CloseIMG);
   40 : P40.Picture.Assign(CloseIMG);
   41 : P41.Picture.Assign(CloseIMG);
   42 : P42.Picture.Assign(CloseIMG);
   43 : P43.Picture.Assign(CloseIMG);
   44 : P44.Picture.Assign(CloseIMG);
   45 : P45.Picture.Assign(CloseIMG);
   46 : P46.Picture.Assign(CloseIMG);
   47 : P47.Picture.Assign(CloseIMG);
  end;
  PictureRefresh(Pos);
  NumOpen:=NumOpen-1;
  IsOpen[Pos]:=false;
end;

procedure TForm1.OpenPos(Pos : integer);
begin
  if not FirstOpened then
  begin
    FirstOpened:=True;
    GameStarted:=True;
    StartTime:=Now;
  end;

  if (UpperCase(ExtractFileExt(ExtPsP[PosImg[Pos]-1]))='.GIF') then
   begin {show GIF image}
    case Pos of
      0 : P0.Picture.Assign(PosGIF0);
      1 : P1.Picture.Assign(PosGIF1);
      2 : P2.Picture.Assign(PosGIF2);
      3 : P3.Picture.Assign(PosGIF3);
      4 : P4.Picture.Assign(PosGIF4);
      5 : P5.Picture.Assign(PosGIF5);
      6 : P6.Picture.Assign(PosGIF6);
      7 : P7.Picture.Assign(PosGIF7);
      8 : P8.Picture.Assign(PosGIF8);
      9 : P9.Picture.Assign(PosGIF9);
     10 : P10.Picture.Assign(PosGIF10);
     11 : P11.Picture.Assign(PosGIF11);
     12 : P12.Picture.Assign(PosGIF12);
     13 : P13.Picture.Assign(PosGIF13);
     14 : P14.Picture.Assign(PosGIF14);
     15 : P15.Picture.Assign(PosGIF15);
     16 : P16.Picture.Assign(PosGIF16);
     17 : P17.Picture.Assign(PosGIF17);
     18 : P18.Picture.Assign(PosGIF18);
     19 : P19.Picture.Assign(PosGIF19);
     20 : P20.Picture.Assign(PosGIF20);
     21 : P21.Picture.Assign(PosGIF21);
     22 : P22.Picture.Assign(PosGIF22);
     23 : P23.Picture.Assign(PosGIF23);
     24 : P24.Picture.Assign(PosGIF24);
     25 : P25.Picture.Assign(PosGIF25);
     26 : P26.Picture.Assign(PosGIF26);
     27 : P27.Picture.Assign(PosGIF27);
     28 : P28.Picture.Assign(PosGIF28);
     29 : P29.Picture.Assign(PosGIF29);
     30 : P30.Picture.Assign(PosGIF30);
     31 : P31.Picture.Assign(PosGIF31);
     32 : P32.Picture.Assign(PosGIF32);
     33 : P33.Picture.Assign(PosGIF33);
     34 : P34.Picture.Assign(PosGIF34);
     35 : P35.Picture.Assign(PosGIF35);
     36 : P36.Picture.Assign(PosGIF36);
     37 : P37.Picture.Assign(PosGIF37);
     38 : P38.Picture.Assign(PosGIF38);
     39 : P39.Picture.Assign(PosGIF39);
     40 : P40.Picture.Assign(PosGIF40);
     41 : P41.Picture.Assign(PosGIF41);
     42 : P42.Picture.Assign(PosGIF42);
     43 : P43.Picture.Assign(PosGIF43);
     44 : P44.Picture.Assign(PosGIF44);
     45 : P45.Picture.Assign(PosGIF45);
     46 : P46.Picture.Assign(PosGIF46);
     47 : P47.Picture.Assign(PosGIF47);
    end;
  end else
  begin {show JPEG image}
    case Pos of
      0 : P0.Picture.Assign(PosIMG0);
      1 : P1.Picture.Assign(PosIMG1);
      2 : P2.Picture.Assign(PosIMG2);
      3 : P3.Picture.Assign(PosIMG3);
      4 : P4.Picture.Assign(PosIMG4);
      5 : P5.Picture.Assign(PosIMG5);
      6 : P6.Picture.Assign(PosIMG6);
      7 : P7.Picture.Assign(PosIMG7);
      8 : P8.Picture.Assign(PosIMG8);
      9 : P9.Picture.Assign(PosIMG9);
     10 : P10.Picture.Assign(PosIMG10);
     11 : P11.Picture.Assign(PosIMG11);
     12 : P12.Picture.Assign(PosIMG12);
     13 : P13.Picture.Assign(PosIMG13);
     14 : P14.Picture.Assign(PosIMG14);
     15 : P15.Picture.Assign(PosIMG15);
     16 : P16.Picture.Assign(PosIMG16);
     17 : P17.Picture.Assign(PosIMG17);
     18 : P18.Picture.Assign(PosIMG18);
     19 : P19.Picture.Assign(PosIMG19);
     20 : P20.Picture.Assign(PosIMG20);
     21 : P21.Picture.Assign(PosIMG21);
     22 : P22.Picture.Assign(PosIMG22);
     23 : P23.Picture.Assign(PosIMG23);
     24 : P24.Picture.Assign(PosIMG24);
     25 : P25.Picture.Assign(PosIMG25);
     26 : P26.Picture.Assign(PosIMG26);
     27 : P27.Picture.Assign(PosIMG27);
     28 : P28.Picture.Assign(PosIMG28);
     29 : P29.Picture.Assign(PosIMG29);
     30 : P30.Picture.Assign(PosIMG30);
     31 : P31.Picture.Assign(PosIMG31);
     32 : P32.Picture.Assign(PosIMG32);
     33 : P33.Picture.Assign(PosIMG33);
     34 : P34.Picture.Assign(PosIMG34);
     35 : P35.Picture.Assign(PosIMG35);
     36 : P36.Picture.Assign(PosIMG36);
     37 : P37.Picture.Assign(PosIMG37);
     38 : P38.Picture.Assign(PosIMG38);
     39 : P39.Picture.Assign(PosIMG39);
     40 : P40.Picture.Assign(PosIMG40);
     41 : P41.Picture.Assign(PosIMG41);
     42 : P42.Picture.Assign(PosIMG42);
     43 : P43.Picture.Assign(PosIMG43);
     44 : P44.Picture.Assign(PosIMG44);
     45 : P45.Picture.Assign(PosIMG45);
     46 : P46.Picture.Assign(PosIMG46);
     47 : P47.Picture.Assign(PosIMG47);
    end;
  end;

  NumOpen:=NumOpen+1;
  IsOpen[Pos]:=true;
  CurPos:=Pos;
  PictureRefresh(Pos);
  Snd(TSndName(PosImg[Pos]-1));
end;

procedure TForm1.UpdateGameDisp(NT : integer);
begin
 if NT<1000 then
 begin
  GameDisp100.Number:=NT div 100;
  NT:=NT-100*(NT div 100);
  GameDisp10.Number:=NT div 10;
  NT:=NT-10*(NT div 10);
   GameDisp1.Number:=NT;
 end;
end;

procedure TForm1.UpdateBestDisp(BT : integer);
begin
 if BT<1000 then
 begin
  HighDisp100.Number:=BT div 100;
  BT:=BT-100*(BT div 100);
  HighDisp10.Number:=BT div 10;
  BT:=BT-10*(BT div 10);
  HighDisp1.Number:=BT;
 end;
end;

procedure TForm1.Initialize(Sender: TObject);
var  n,m,R1,R2,tmp : integer;
            Unique : boolean;
begin
  Finished:=False;
  FirstOpened:=False;
  GameStarted:=False;

  Include(GIFImageDefaultDrawOptions, goDirectDraw);
  Include(GIFImageDefaultDrawOptions, goAnimate);
  if TrspGIF then
    Include(GIFImageDefaultDrawOptions, goTransparent)
  else
    Exclude(GIFImageDefaultDrawOptions, goTransparent);

  {Start with freeing all JPEG images for the 20 pieces and one cover}
  CloseIMG.Free;
  PosIMG0.Free;
  PosIMG1.Free;
  PosIMG2.Free;
  PosIMG3.Free;
  PosIMG4.Free;
  PosIMG5.Free;
  PosIMG6.Free;
  PosIMG7.Free;
  PosIMG8.Free;
  PosIMG9.Free;
  PosIMG10.Free;
  PosIMG11.Free;
  PosIMG12.Free;
  PosIMG13.Free;
  PosIMG14.Free;
  PosIMG15.Free;
  PosIMG16.Free;
  PosIMG17.Free;
  PosIMG18.Free;
  PosIMG19.Free;
  PosIMG20.Free;
  PosIMG21.Free;
  PosIMG22.Free;
  PosIMG23.Free;
  PosIMG24.Free;
  PosIMG25.Free;
  PosIMG26.Free;
  PosIMG27.Free;
  PosIMG28.Free;
  PosIMG29.Free;
  PosIMG30.Free;
  PosIMG31.Free;
  PosIMG32.Free;
  PosIMG33.Free;
  PosIMG34.Free;
  PosIMG35.Free;
  PosIMG36.Free;
  PosIMG37.Free;
  PosIMG38.Free;
  PosIMG39.Free;
  PosIMG40.Free;
  PosIMG41.Free;
  PosIMG42.Free;
  PosIMG43.Free;
  PosIMG44.Free;
  PosIMG45.Free;
  PosIMG46.Free;
  PosIMG47.Free;
        
  {then Create new "clean" JPEG image variables for 20 open pieces and 1 cover}
  CloseIMG:=TJPEGImage.Create;
  PosIMG0:=TJPEGImage.Create;
  PosIMG1:=TJPEGImage.Create;
  PosIMG2:=TJPEGImage.Create;
  PosIMG3:=TJPEGImage.Create;
  PosIMG4:=TJPEGImage.Create;
  PosIMG5:=TJPEGImage.Create;
  PosIMG6:=TJPEGImage.Create;
  PosIMG7:=TJPEGImage.Create;
  PosIMG8:=TJPEGImage.Create;
  PosIMG9:=TJPEGImage.Create;
  PosIMG10:=TJPEGImage.Create;
  PosIMG11:=TJPEGImage.Create;
  PosIMG12:=TJPEGImage.Create;
  PosIMG13:=TJPEGImage.Create;
  PosIMG14:=TJPEGImage.Create;
  PosIMG15:=TJPEGImage.Create;
  PosIMG16:=TJPEGImage.Create;
  PosIMG17:=TJPEGImage.Create;
  PosIMG18:=TJPEGImage.Create;
  PosIMG19:=TJPEGImage.Create;
  PosIMG20:=TJPEGImage.Create;
  PosIMG21:=TJPEGImage.Create;
  PosIMG22:=TJPEGImage.Create;
  PosIMG23:=TJPEGImage.Create;
  PosIMG24:=TJPEGImage.Create;
  PosIMG25:=TJPEGImage.Create;
  PosIMG26:=TJPEGImage.Create;
  PosIMG27:=TJPEGImage.Create;
  PosIMG28:=TJPEGImage.Create;
  PosIMG29:=TJPEGImage.Create;
  PosIMG30:=TJPEGImage.Create;
  PosIMG31:=TJPEGImage.Create;
  PosIMG32:=TJPEGImage.Create;
  PosIMG33:=TJPEGImage.Create;
  PosIMG34:=TJPEGImage.Create;
  PosIMG35:=TJPEGImage.Create;
  PosIMG36:=TJPEGImage.Create;
  PosIMG37:=TJPEGImage.Create;
  PosIMG38:=TJPEGImage.Create;
  PosIMG39:=TJPEGImage.Create;
  PosIMG40:=TJPEGImage.Create;
  PosIMG41:=TJPEGImage.Create;
  PosIMG42:=TJPEGImage.Create;
  PosIMG43:=TJPEGImage.Create;
  PosIMG44:=TJPEGImage.Create;
  PosIMG45:=TJPEGImage.Create;
  PosIMG46:=TJPEGImage.Create;
  PosIMG47:=TJPEGImage.Create;

  {Stop all GIF animations}

  P0.Picture.Graphic := nil;
  P1.Picture.Graphic := nil;
  P2.Picture.Graphic := nil;
  P3.Picture.Graphic := nil;
  P4.Picture.Graphic := nil;
  P5.Picture.Graphic := nil;
  P6.Picture.Graphic := nil;
  P7.Picture.Graphic := nil;
  P8.Picture.Graphic := nil;
  P9.Picture.Graphic := nil;
  P10.Picture.Graphic := nil;
  P11.Picture.Graphic := nil;
  P12.Picture.Graphic := nil;
  P13.Picture.Graphic := nil;
  P14.Picture.Graphic := nil;
  P15.Picture.Graphic := nil;
  P16.Picture.Graphic := nil;
  P17.Picture.Graphic := nil;
  P18.Picture.Graphic := nil;
  P19.Picture.Graphic := nil;
  P20.Picture.Graphic := nil;
  P21.Picture.Graphic := nil;
  P22.Picture.Graphic := nil;
  P23.Picture.Graphic := nil;
  P24.Picture.Graphic := nil;
  P25.Picture.Graphic := nil;
  P26.Picture.Graphic := nil;
  P27.Picture.Graphic := nil;
  P28.Picture.Graphic := nil;
  P29.Picture.Graphic := nil;
  P30.Picture.Graphic := nil;
  P31.Picture.Graphic := nil;
  P32.Picture.Graphic := nil;
  P33.Picture.Graphic := nil;
  P34.Picture.Graphic := nil;
  P35.Picture.Graphic := nil;
  P36.Picture.Graphic := nil;
  P37.Picture.Graphic := nil;
  P38.Picture.Graphic := nil;
  P39.Picture.Graphic := nil;
  P40.Picture.Graphic := nil;
  P41.Picture.Graphic := nil;
  P42.Picture.Graphic := nil;
  P43.Picture.Graphic := nil;
  P44.Picture.Graphic := nil;
  P45.Picture.Graphic := nil;
  P46.Picture.Graphic := nil;
  P47.Picture.Graphic := nil;

  AnKmImg.Picture.Graphic := nil;

  for n:=0 to 23 do PictureRefresh(n);

  {Free all GIF images}

  PosGIF0.Free;
  PosGIF1.Free;
  PosGIF2.Free;
  PosGIF3.Free;
  PosGIF4.Free;
  PosGIF5.Free;
  PosGIF6.Free;
  PosGIF7.Free;
  PosGIF8.Free;
  PosGIF9.Free;
  PosGIF10.Free;
  PosGIF11.Free;
  PosGIF12.Free;
  PosGIF13.Free;
  PosGIF14.Free;
  PosGIF15.Free;
  PosGIF16.Free;
  PosGIF17.Free;
  PosGIF18.Free;
  PosGIF19.Free;
  PosGIF20.Free;
  PosGIF21.Free;
  PosGIF22.Free;
  PosGIF23.Free;
  PosGIF24.Free;
  PosGIF25.Free;
  PosGIF26.Free;
  PosGIF27.Free;
  PosGIF28.Free;
  PosGIF29.Free;
  PosGIF30.Free;
  PosGIF31.Free;
  PosGIF32.Free;
  PosGIF33.Free;
  PosGIF34.Free;
  PosGIF35.Free;
  PosGIF36.Free;
  PosGIF37.Free;
  PosGIF38.Free;
  PosGIF39.Free;
  PosGIF40.Free;
  PosGIF41.Free;
  PosGIF42.Free;
  PosGIF43.Free;
  PosGIF44.Free;
  PosGIF45.Free;
  PosGIF46.Free;
  PosGIF47.Free;

  AnKmGif.Free;

  {Then create new "clean" GIF images}

  PosGIF0:=TGIFImage.Create;
  PosGIF1:=TGIFImage.Create;
  PosGIF2:=TGIFImage.Create;
  PosGIF3:=TGIFImage.Create;
  PosGIF4:=TGIFImage.Create;
  PosGIF5:=TGIFImage.Create;
  PosGIF6:=TGIFImage.Create;
  PosGIF7:=TGIFImage.Create;
  PosGIF8:=TGIFImage.Create;
  PosGIF9:=TGIFImage.Create;
  PosGIF10:=TGIFImage.Create;
  PosGIF11:=TGIFImage.Create;
  PosGIF12:=TGIFImage.Create;
  PosGIF13:=TGIFImage.Create;
  PosGIF14:=TGIFImage.Create;
  PosGIF15:=TGIFImage.Create;
  PosGIF16:=TGIFImage.Create;
  PosGIF17:=TGIFImage.Create;
  PosGIF18:=TGIFImage.Create;
  PosGIF19:=TGIFImage.Create;
  PosGIF20:=TGIFImage.Create;
  PosGIF21:=TGIFImage.Create;
  PosGIF22:=TGIFImage.Create;
  PosGIF23:=TGIFImage.Create;
  PosGIF24:=TGIFImage.Create;
  PosGIF25:=TGIFImage.Create;
  PosGIF26:=TGIFImage.Create;
  PosGIF27:=TGIFImage.Create;
  PosGIF28:=TGIFImage.Create;
  PosGIF29:=TGIFImage.Create;
  PosGIF30:=TGIFImage.Create;
  PosGIF31:=TGIFImage.Create;
  PosGIF32:=TGIFImage.Create;
  PosGIF33:=TGIFImage.Create;
  PosGIF34:=TGIFImage.Create;
  PosGIF35:=TGIFImage.Create;
  PosGIF36:=TGIFImage.Create;
  PosGIF37:=TGIFImage.Create;
  PosGIF38:=TGIFImage.Create;
  PosGIF39:=TGIFImage.Create;
  PosGIF40:=TGIFImage.Create;
  PosGIF41:=TGIFImage.Create;
  PosGIF42:=TGIFImage.Create;
  PosGIF43:=TGIFImage.Create;
  PosGIF44:=TGIFImage.Create;
  PosGIF45:=TGIFImage.Create;
  PosGIF46:=TGIFImage.Create;
  PosGIF47:=TGIFImage.Create;

  AnKmGif:=TGIFImage.Create;

  {Hide all pieces}
  P0.Visible:=False;P1.Visible:=False;P2.Visible:=False;P3.Visible:=False;
  P4.Visible:=False;P5.Visible:=False;P6.Visible:=False;P7.Visible:=False;
  P8.Visible:=False;P9.Visible:=False;P10.Visible:=False;P11.Visible:=False;
  P12.Visible:=False;P13.Visible:=False;P14.Visible:=False;P15.Visible:=False;
  P16.Visible:=False;P17.Visible:=False;P18.Visible:=False;P19.Visible:=False;

  P20.Visible:=False;P21.Visible:=False;P22.Visible:=False;P23.Visible:=False;
  P24.Visible:=False;P25.Visible:=False;P26.Visible:=False;P27.Visible:=False;
  P28.Visible:=False;P29.Visible:=False;P30.Visible:=False;P31.Visible:=False;
  P32.Visible:=False;P33.Visible:=False;P34.Visible:=False;P35.Visible:=False;
  P36.Visible:=False;P37.Visible:=False;P38.Visible:=False;P39.Visible:=False;
  P40.Visible:=False;P41.Visible:=False;P42.Visible:=False;P43.Visible:=False;
  P44.Visible:=False;P45.Visible:=False;P46.Visible:=False;P47.Visible:=False;

  {Initialy Create all piezes as large to cope with later size change problems}
  P0.Width:=225;P0.Height:=225;
  P1.Width:=225;P1.Height:=225;
  P2.Width:=225;P2.Height:=225;
  P3.Width:=225;P3.Height:=225;
  P4.Width:=225;P4.Height:=225;
  P5.Width:=225;P5.Height:=225;
  P6.Width:=225;P6.Height:=225;
  P7.Width:=225;P7.Height:=225;
  P8.Width:=225;P8.Height:=225;
  P9.Width:=225;P9.Height:=225;
  P10.Width:=225;P10.Height:=225;
  P11.Width:=225;P11.Height:=225;
  P12.Width:=225;P12.Height:=225;
  P13.Width:=225;P13.Height:=225;
  P14.Width:=225;P14.Height:=225;
  P15.Width:=225;P15.Height:=225;
  P16.Width:=225;P16.Height:=225;
  P17.Width:=225;P17.Height:=225;
  P18.Width:=225;P18.Height:=225;
  P19.Width:=225;P19.Height:=225;
  P20.Width:=225;P20.Height:=225;
  P21.Width:=225;P21.Height:=225;
  P22.Width:=225;P22.Height:=225;
  P23.Width:=225;P23.Height:=225;
  P24.Width:=225;P24.Height:=225;
  P25.Width:=225;P25.Height:=225;
  P26.Width:=225;P26.Height:=225;
  P27.Width:=225;P27.Height:=225;
  P28.Width:=225;P28.Height:=225;
  P29.Width:=225;P29.Height:=225;
  P30.Width:=225;P30.Height:=225;
  P31.Width:=225;P31.Height:=225;
  P32.Width:=225;P32.Height:=225;
  P33.Width:=225;P33.Height:=225;
  P34.Width:=225;P34.Height:=225;
  P35.Width:=225;P35.Height:=225;
  P36.Width:=225;P36.Height:=225;
  P37.Width:=225;P37.Height:=225;
  P38.Width:=225;P38.Height:=225;
  P39.Width:=225;P39.Height:=225;
  P40.Width:=225;P40.Height:=225;
  P41.Width:=225;P41.Height:=225;
  P42.Width:=225;P42.Height:=225;
  P43.Width:=225;P43.Height:=225;
  P44.Width:=225;P44.Height:=225;
  P45.Width:=225;P45.Height:=225;
  P46.Width:=225;P46.Height:=225;
  P47.Width:=225;P47.Height:=225;

  {Size and place Images for pieces according to NumPieces in game}
  Case NumPieces of
    48 : begin
           PieceSize:=75;
           P0.Top:=Pos48Y[0];P0.Left:=Pos48X[0];P0.Width:=PieceSize;P0.Height:=PieceSize;
           P1.Top:=Pos48Y[0];P1.Left:=Pos48X[1];P1.Width:=PieceSize;P1.Height:=PieceSize;
           P2.Top:=Pos48Y[0];P2.Left:=Pos48X[2];P2.Width:=PieceSize;P2.Height:=PieceSize;
           P3.Top:=Pos48Y[0];P3.Left:=Pos48X[3];P3.Width:=PieceSize;P3.Height:=PieceSize;
           P4.Top:=Pos48Y[0];P4.Left:=Pos48X[4];P4.Width:=PieceSize;P4.Height:=PieceSize;
           P5.Top:=Pos48Y[0];P5.Left:=Pos48X[5];P5.Width:=PieceSize;P5.Height:=PieceSize;
           P6.Top:=Pos48Y[0];P6.Left:=Pos48X[6];P6.Width:=PieceSize;P6.Height:=PieceSize;
           P7.Top:=Pos48Y[0];P7.Left:=Pos48X[7];P7.Width:=PieceSize;P7.Height:=PieceSize;

           P8.Top:=Pos48Y[1];P8.Left:=Pos48X[0];P8.Width:=PieceSize;P8.Height:=PieceSize;
           P9.Top:=Pos48Y[1];P9.Left:=Pos48X[1];P9.Width:=PieceSize;P9.Height:=PieceSize;
           P10.Top:=Pos48Y[1];P10.Left:=Pos48X[2];P10.Width:=PieceSize;P10.Height:=PieceSize;
           P11.Top:=Pos48Y[1];P11.Left:=Pos48X[3];P11.Width:=PieceSize;P11.Height:=PieceSize;
           P12.Top:=Pos48Y[1];P12.Left:=Pos48X[4];P12.Width:=PieceSize;P12.Height:=PieceSize;
           P13.Top:=Pos48Y[1];P13.Left:=Pos48X[5];P13.Width:=PieceSize;P13.Height:=PieceSize;
           P14.Top:=Pos48Y[1];P14.Left:=Pos48X[6];P14.Width:=PieceSize;P14.Height:=PieceSize;
           P15.Top:=Pos48Y[1];P15.Left:=Pos48X[7];P15.Width:=PieceSize;P15.Height:=PieceSize;

           P16.Top:=Pos48Y[2];P16.Left:=Pos48X[0];P16.Width:=PieceSize;P16.Height:=PieceSize;
           P17.Top:=Pos48Y[2];P17.Left:=Pos48X[1];P17.Width:=PieceSize;P17.Height:=PieceSize;
           P18.Top:=Pos48Y[2];P18.Left:=Pos48X[2];P18.Width:=PieceSize;P18.Height:=PieceSize;
           P19.Top:=Pos48Y[2];P19.Left:=Pos48X[3];P19.Width:=PieceSize;P19.Height:=PieceSize;
           P20.Top:=Pos48Y[2];P20.Left:=Pos48X[4];P20.Width:=PieceSize;P20.Height:=PieceSize;
           P21.Top:=Pos48Y[2];P21.Left:=Pos48X[5];P21.Width:=PieceSize;P21.Height:=PieceSize;
           P22.Top:=Pos48Y[2];P22.Left:=Pos48X[6];P22.Width:=PieceSize;P22.Height:=PieceSize;
           P23.Top:=Pos48Y[2];P23.Left:=Pos48X[7];P23.Width:=PieceSize;P23.Height:=PieceSize;

           P24.Top:=Pos48Y[3];P24.Left:=Pos48X[0];P24.Width:=PieceSize;P24.Height:=PieceSize;
           P25.Top:=Pos48Y[3];P25.Left:=Pos48X[1];P25.Width:=PieceSize;P25.Height:=PieceSize;
           P26.Top:=Pos48Y[3];P26.Left:=Pos48X[2];P26.Width:=PieceSize;P26.Height:=PieceSize;
           P27.Top:=Pos48Y[3];P27.Left:=Pos48X[3];P27.Width:=PieceSize;P27.Height:=PieceSize;
           P28.Top:=Pos48Y[3];P28.Left:=Pos48X[4];P28.Width:=PieceSize;P28.Height:=PieceSize;
           P29.Top:=Pos48Y[3];P29.Left:=Pos48X[5];P29.Width:=PieceSize;P29.Height:=PieceSize;
           P30.Top:=Pos48Y[3];P30.Left:=Pos48X[6];P30.Width:=PieceSize;P30.Height:=PieceSize;
           P31.Top:=Pos48Y[3];P31.Left:=Pos48X[7];P31.Width:=PieceSize;P31.Height:=PieceSize;

           P32.Top:=Pos48Y[4];P32.Left:=Pos48X[0];P32.Width:=PieceSize;P32.Height:=PieceSize;
           P33.Top:=Pos48Y[4];P33.Left:=Pos48X[1];P33.Width:=PieceSize;P33.Height:=PieceSize;
           P34.Top:=Pos48Y[4];P34.Left:=Pos48X[2];P34.Width:=PieceSize;P34.Height:=PieceSize;
           P35.Top:=Pos48Y[4];P35.Left:=Pos48X[3];P35.Width:=PieceSize;P35.Height:=PieceSize;
           P36.Top:=Pos48Y[4];P36.Left:=Pos48X[4];P36.Width:=PieceSize;P36.Height:=PieceSize;
           P37.Top:=Pos48Y[4];P37.Left:=Pos48X[5];P37.Width:=PieceSize;P37.Height:=PieceSize;
           P38.Top:=Pos48Y[4];P38.Left:=Pos48X[6];P38.Width:=PieceSize;P38.Height:=PieceSize;
           P39.Top:=Pos48Y[4];P39.Left:=Pos48X[7];P39.Width:=PieceSize;P39.Height:=PieceSize;

           P40.Top:=Pos48Y[5];P40.Left:=Pos48X[0];P40.Width:=PieceSize;P40.Height:=PieceSize;
           P41.Top:=Pos48Y[5];P41.Left:=Pos48X[1];P41.Width:=PieceSize;P41.Height:=PieceSize;
           P42.Top:=Pos48Y[5];P42.Left:=Pos48X[2];P42.Width:=PieceSize;P42.Height:=PieceSize;
           P43.Top:=Pos48Y[5];P43.Left:=Pos48X[3];P43.Width:=PieceSize;P43.Height:=PieceSize;
           P44.Top:=Pos48Y[5];P44.Left:=Pos48X[4];P44.Width:=PieceSize;P44.Height:=PieceSize;
           P45.Top:=Pos48Y[5];P45.Left:=Pos48X[5];P45.Width:=PieceSize;P45.Height:=PieceSize;
           P46.Top:=Pos48Y[5];P46.Left:=Pos48X[6];P46.Width:=PieceSize;P46.Height:=PieceSize;
           P47.Top:=Pos48Y[5];P47.Left:=Pos48X[7];P47.Width:=PieceSize;P47.Height:=PieceSize;

         end;
    20 : begin
           PieceSize:=115;
           P0.Top:=Pos20Y[0];P0.Left:=Pos20X[0];P0.Width:=PieceSize;P0.Height:=PieceSize;
           P1.Top:=Pos20Y[0];P1.Left:=Pos20X[1];P1.Width:=PieceSize;P1.Height:=PieceSize;
           P2.Top:=Pos20Y[0];P2.Left:=Pos20X[2];P2.Width:=PieceSize;P2.Height:=PieceSize;
           P3.Top:=Pos20Y[0];P3.Left:=Pos20X[3];P3.Width:=PieceSize;P3.Height:=PieceSize;
           P4.Top:=Pos20Y[0];P4.Left:=Pos20X[4];P4.Width:=PieceSize;P4.Height:=PieceSize;

           P5.Top:=Pos20Y[1];P5.Left:=Pos20X[0];P5.Width:=PieceSize;P5.Height:=PieceSize;
           P6.Top:=Pos20Y[1];P6.Left:=Pos20X[1];P6.Width:=PieceSize;P6.Height:=PieceSize;
           P7.Top:=Pos20Y[1];P7.Left:=Pos20X[2];P7.Width:=PieceSize;P7.Height:=PieceSize;
           P8.Top:=Pos20Y[1];P8.Left:=Pos20X[3];P8.Width:=PieceSize;P8.Height:=PieceSize;
           P9.Top:=Pos20Y[1];P9.Left:=Pos20X[4];P9.Width:=PieceSize;P9.Height:=PieceSize;

           P10.Top:=Pos20Y[2];P10.Left:=Pos20X[0];P10.Width:=PieceSize;P10.Height:=PieceSize;
           P11.Top:=Pos20Y[2];P11.Left:=Pos20X[1];P11.Width:=PieceSize;P11.Height:=PieceSize;
           P12.Top:=Pos20Y[2];P12.Left:=Pos20X[2];P12.Width:=PieceSize;P12.Height:=PieceSize;
           P13.Top:=Pos20Y[2];P13.Left:=Pos20X[3];P13.Width:=PieceSize;P13.Height:=PieceSize;
           P14.Top:=Pos20Y[2];P14.Left:=Pos20X[4];P14.Width:=PieceSize;P14.Height:=PieceSize;

           P15.Top:=Pos20Y[3];P15.Left:=Pos20X[0];P15.Width:=PieceSize;P15.Height:=PieceSize;
           P16.Top:=Pos20Y[3];P16.Left:=Pos20X[1];P16.Width:=PieceSize;P16.Height:=PieceSize;
           P17.Top:=Pos20Y[3];P17.Left:=Pos20X[2];P17.Width:=PieceSize;P17.Height:=PieceSize;
           P18.Top:=Pos20Y[3];P18.Left:=Pos20X[3];P18.Width:=PieceSize;P18.Height:=PieceSize;
           P19.Top:=Pos20Y[3];P19.Left:=Pos20X[4];P19.Width:=PieceSize;P19.Height:=PieceSize;
         end;
    12 : begin
           PieceSize:=150;
           P0.Top:=Pos12Y[0];P0.Left:=Pos12X[0];P0.Width:=PieceSize;P0.Height:=PieceSize;
           P1.Top:=Pos12Y[0];P1.Left:=Pos12X[1];P1.Width:=PieceSize;P1.Height:=PieceSize;
           P2.Top:=Pos12Y[0];P2.Left:=Pos12X[2];P2.Width:=PieceSize;P2.Height:=PieceSize;
           P3.Top:=Pos12Y[0];P3.Left:=Pos12X[3];P3.Width:=PieceSize;P3.Height:=PieceSize;
           P4.Top:=Pos12Y[1];P4.Left:=Pos12X[0];P4.Width:=PieceSize;P4.Height:=PieceSize;
           P5.Top:=Pos12Y[1];P5.Left:=Pos12X[1];P5.Width:=PieceSize;P5.Height:=PieceSize;
           P6.Top:=Pos12Y[1];P6.Left:=Pos12X[2];P6.Width:=PieceSize;P6.Height:=PieceSize;
           P7.Top:=Pos12Y[1];P7.Left:=Pos12X[3];P7.Width:=PieceSize;P7.Height:=PieceSize;
           P8.Top:=Pos12Y[2];P8.Left:=Pos12X[0];P8.Width:=PieceSize;P8.Height:=PieceSize;
           P9.Top:=Pos12Y[2];P9.Left:=Pos12X[1];P9.Width:=PieceSize;P9.Height:=PieceSize;
           P10.Top:=Pos12Y[2];P10.Left:=Pos12X[2];P10.Width:=PieceSize;P10.Height:=PieceSize;
           P11.Top:=Pos12Y[2];P11.Left:=Pos12X[3];P11.Width:=PieceSize;P11.Height:=PieceSize;
         end;
     4 : begin
           PieceSize:=225;
           P0.Top:=Pos4Y[0];P0.Left:=Pos4X[0];P0.Width:=PieceSize;P0.Height:=PieceSize;
           P1.Top:=Pos4Y[0];P1.Left:=Pos4X[1];P1.Width:=PieceSize;P1.Height:=PieceSize;
           P2.Top:=Pos4Y[1];P2.Left:=Pos4X[0];P2.Width:=PieceSize;P2.Height:=PieceSize;
           P3.Top:=Pos4Y[1];P3.Left:=Pos4X[1];P3.Width:=PieceSize;P3.Height:=PieceSize;
         end;
  end;

  Randomize;
  NumOpen:=NumPieces;    {NumOpen decrements to 0 as all are closed later}
  WaitOnClose:=false;
  NumPairsLeft:=NumPieces DIV 2;
  NumTries:=0;

  AnKmGif.LoadFromStream(TResourceStream.Create(Hinstance,'AnKm', 'GIF'));
  AnKmImg.Picture.Assign(AnKmGif);

  {Make Bg image}
  BgJpgImage:=TJPEGImage.Create;

  {Find a random Bg image number between the selected image numbers}
  { if no selected images just find a number (1..3)                }
  tmp:=0;
  for n:=0 to 2 do if BgSel[n] then Inc(tmp);
  if tmp>0 then
    Repeat                       {Find a random image from the selected}
      BgImageNum:=Random(3)+1;
    Until (BgSel[BgImageNum-1])
  else BgImageNum:=Random(3)+1;

  if ExtBg[BgImageNum-1] then
    {BgImagenum is a custum image}
    BgJpgImage.LoadFromFile(ExtBgP[BgImageNum-1])
  else
    {BgImageNum is a Built-in image}
    BgJpgImage.LoadFromStream(TResourceStream.Create(Hinstance,
                              'bg'+PChar(IntToStr(BgImageNum)), 'JPEG'));

  BgImage.Canvas.StretchDraw(Rect(0,0,BgImage.Width,BgImage.Height),BgJpgImage);
  BgJpgImage.Free;

  {Make cover image}

  {Find a random Cv image number between the selected image numbers}
  { if no selected images just find a number (1..3)                }
  tmp:=0;
  for n:=0 to 2 do if CvSel[n] then Inc(tmp);
  if tmp>0 then
    Repeat                        {Find a random image from the selected}
      CvImageNum:=Random(3)+1;
    Until (CvSel[CvImageNum-1])
  else CvImageNum:=Random(3)+1;

  if ExtCv[CvImageNum-1] then
    {CvImagenum is a custum image}
    CloseIMG.LoadFromFile(ExtCvP[CvImageNum-1])
  else
    {CvImageNum is a Built-in image}
    CloseIMG.LoadFromStream(TResourceStream.Create(Hinstance,
                            'Cv'+PChar(IntToStr(CvImageNum)), 'JPEG'));

  {Close and Show all pieces}
  For n:=0 to NumPieces-1 do
  begin
    ClosePos(n);
    Snd(sClose);
    case n of
      0 : P0.Visible:=True;
      1 : P1.Visible:=True;
      2 : P2.Visible:=True;
      3 : P3.Visible:=True;
      4 : P4.Visible:=True;
      5 : P5.Visible:=True;
      6 : P6.Visible:=True;
      7 : P7.Visible:=True;
      8 : P8.Visible:=True;
      9 : P9.Visible:=True;
     10 : P10.Visible:=True;
     11 : P11.Visible:=True;
     12 : P12.Visible:=True;
     13 : P13.Visible:=True;
     14 : P14.Visible:=True;
     15 : P15.Visible:=True;
     16 : P16.Visible:=True;
     17 : P17.Visible:=True;
     18 : P18.Visible:=True;
     19 : P19.Visible:=True;
     20 : P20.Visible:=True;
     21 : P21.Visible:=True;
     22 : P22.Visible:=True;
     23 : P23.Visible:=True;
     24 : P24.Visible:=True;
     25 : P25.Visible:=True;
     26 : P26.Visible:=True;
     27 : P27.Visible:=True;
     28 : P28.Visible:=True;
     29 : P29.Visible:=True;
     30 : P30.Visible:=True;
     31 : P31.Visible:=True;
     32 : P32.Visible:=True;
     33 : P33.Visible:=True;
     34 : P34.Visible:=True;
     35 : P35.Visible:=True;
     36 : P36.Visible:=True;
     37 : P37.Visible:=True;
     38 : P38.Visible:=True;
     39 : P39.Visible:=True;
     40 : P40.Visible:=True;
     41 : P41.Visible:=True;
     42 : P42.Visible:=True;
     43 : P43.Visible:=True;
     44 : P44.Visible:=True;
     45 : P45.Visible:=True;
     46 : P46.Visible:=True;
     47 : P47.Visible:=True;
    end;
    Wait(100);
  end;

  {Find 2,6, 10 or 24 unique numbers from 1 to 24}
  if NumPsSel > (Numpieces div 2) then  {More selected pieces than needed}
  begin
    for n:= 1 to 100 do    {Scramble the pieces in piecearray}
    begin
     R1:=Random(NumPsSel);
     R2:=Random(NumPsSel);
     tmp:=PieceArray[R1];
     PieceArray[R1]:=PieceArray[R2];
     PieceArray[R2]:=tmp;
    end;
  end else                              {0 or less than needed selected}
  for n:=0 to (Numpieces div 2)-1 do
  begin
    if n>=NumPsSel then {Only find random for not selected pieces}
    begin
      repeat
        Unique:=true;
        R1:=Random(24)+1; {get random piece number [1-24]}
        for m:=0 to n do  {Check that the piece is not allready used}
          if R1=PieceArray[m] then Unique:=false;
      until Unique;
      PieceArray[n]:=R1;
    end;
  end;

  {Use 2,6,10 or 24 pair of user/random selected pieces}
  for n:=0 to NumPieces-1 do
  begin
    IsOpen[n]:=false;
    PosIsLeft[n]:=true;
    if n<(NumPieces div 2) then
    begin
      PosImg[n]:=PieceArray[n];
      PosImg[n+(NumPieces div 2)]:=PieceArray[n];
    end;
  end;

  {Scramble the 4, 12, 20 or 48 pieces}
  for n:= 1 to 150 do
  begin
   R1:=Random(NumPieces);
   R2:=Random(NumPieces);
   tmp:=PosImg[R1];
   PosImg[R1]:=PosImg[R2];
   PosImg[R2]:=tmp;
  end;

  {Load needed "open" JPEG or GIF images for the pieces}

  for n:=1 to NumPieces do {from PosImg0 to Last PosImg in game}
  begin     {imagenum 1-24}

    if ExtPs[PosImg[n-1]-1] then {Piece is a custum selected piece}
    begin
      if (UpperCase(ExtractFileExt(ExtPsP[PosImg[n-1]-1]))='.GIF') then
      begin         {Load GIF image to PosGIF n-1}
        Case n of
         1:  PosGIF0.LoadFromFile(ExtPsP[PosImg[0]-1]);
         2:  PosGIF1.LoadFromFile(ExtPsP[PosImg[1]-1]);
         3:  PosGIF2.LoadFromFile(ExtPsP[PosImg[2]-1]);
         4:  PosGIF3.LoadFromFile(ExtPsP[PosImg[3]-1]);
         5:  PosGIF4.LoadFromFile(ExtPsP[PosImg[4]-1]);
         6:  PosGIF5.LoadFromFile(ExtPsP[PosImg[5]-1]);
         7:  PosGIF6.LoadFromFile(ExtPsP[PosImg[6]-1]);
         8:  PosGIF7.LoadFromFile(ExtPsP[PosImg[7]-1]);
         9:  PosGIF8.LoadFromFile(ExtPsP[PosImg[8]-1]);
        10:  PosGIF9.LoadFromFile(ExtPsP[PosImg[9]-1]);
        11:  PosGIF10.LoadFromFile(ExtPsP[PosImg[10]-1]);
        12:  PosGIF11.LoadFromFile(ExtPsP[PosImg[11]-1]);
        13:  PosGIF12.LoadFromFile(ExtPsP[PosImg[12]-1]);
        14:  PosGIF13.LoadFromFile(ExtPsP[PosImg[13]-1]);
        15:  PosGIF14.LoadFromFile(ExtPsP[PosImg[14]-1]);
        16:  PosGIF15.LoadFromFile(ExtPsP[PosImg[15]-1]);
        17:  PosGIF16.LoadFromFile(ExtPsP[PosImg[16]-1]);
        18:  PosGIF17.LoadFromFile(ExtPsP[PosImg[17]-1]);
        19:  PosGIF18.LoadFromFile(ExtPsP[PosImg[18]-1]);
        20:  PosGIF19.LoadFromFile(ExtPsP[PosImg[19]-1]);
        21:  PosGIF20.LoadFromFile(ExtPsP[PosImg[20]-1]);
        22:  PosGIF21.LoadFromFile(ExtPsP[PosImg[21]-1]);
        23:  PosGIF22.LoadFromFile(ExtPsP[PosImg[22]-1]);
        24:  PosGIF23.LoadFromFile(ExtPsP[PosImg[23]-1]);
        25:  PosGIF24.LoadFromFile(ExtPsP[PosImg[24]-1]);
        26:  PosGIF25.LoadFromFile(ExtPsP[PosImg[25]-1]);
        27:  PosGIF26.LoadFromFile(ExtPsP[PosImg[26]-1]);
        28:  PosGIF27.LoadFromFile(ExtPsP[PosImg[27]-1]);
        29:  PosGIF28.LoadFromFile(ExtPsP[PosImg[28]-1]);
        30:  PosGIF29.LoadFromFile(ExtPsP[PosImg[29]-1]);
        31:  PosGIF30.LoadFromFile(ExtPsP[PosImg[30]-1]);
        32:  PosGIF31.LoadFromFile(ExtPsP[PosImg[31]-1]);
        33:  PosGIF32.LoadFromFile(ExtPsP[PosImg[32]-1]);
        34:  PosGIF33.LoadFromFile(ExtPsP[PosImg[33]-1]);
        35:  PosGIF34.LoadFromFile(ExtPsP[PosImg[34]-1]);
        36:  PosGIF35.LoadFromFile(ExtPsP[PosImg[35]-1]);
        37:  PosGIF36.LoadFromFile(ExtPsP[PosImg[36]-1]);
        38:  PosGIF37.LoadFromFile(ExtPsP[PosImg[37]-1]);
        39:  PosGIF38.LoadFromFile(ExtPsP[PosImg[38]-1]);
        40:  PosGIF39.LoadFromFile(ExtPsP[PosImg[39]-1]);
        41:  PosGIF40.LoadFromFile(ExtPsP[PosImg[40]-1]);
        42:  PosGIF41.LoadFromFile(ExtPsP[PosImg[41]-1]);
        43:  PosGIF42.LoadFromFile(ExtPsP[PosImg[42]-1]);
        44:  PosGIF43.LoadFromFile(ExtPsP[PosImg[43]-1]);
        45:  PosGIF44.LoadFromFile(ExtPsP[PosImg[44]-1]);
        46:  PosGIF45.LoadFromFile(ExtPsP[PosImg[45]-1]);
        47:  PosGIF46.LoadFromFile(ExtPsP[PosImg[46]-1]);
        48:  PosGIF47.LoadFromFile(ExtPsP[PosImg[47]-1]);
        end;
      end else
      begin
        TmpIMG:=TJpegImage.Create;
        TmpIMG.LoadFromFile(ExtPsP[PosImg[n-1]-1]);{load external image to TmpIMG}
        Case n of
         1:  PosIMG0.Assign(TmpIMG);                {Copy image to PosIMG n-1}
         2:  PosIMG1.Assign(TmpIMG);
         3:  PosIMG2.Assign(TmpIMG);
         4:  PosIMG3.Assign(TmpIMG);
         5:  PosIMG4.Assign(TmpIMG);
         6:  PosIMG5.Assign(TmpIMG);
         7:  PosIMG6.Assign(TmpIMG);
         8:  PosIMG7.Assign(TmpIMG);
         9:  PosIMG8.Assign(TmpIMG);
        10:  PosIMG9.Assign(TmpIMG);
        11:  PosIMG10.Assign(TmpIMG);
        12:  PosIMG11.Assign(TmpIMG);
        13:  PosIMG12.Assign(TmpIMG);
        14:  PosIMG13.Assign(TmpIMG);
        15:  PosIMG14.Assign(TmpIMG);
        16:  PosIMG15.Assign(TmpIMG);
        17:  PosIMG16.Assign(TmpIMG);
        18:  PosIMG17.Assign(TmpIMG);
        19:  PosIMG18.Assign(TmpIMG);
        20:  PosIMG19.Assign(TmpIMG);
        21:  PosIMG20.Assign(TmpIMG);
        22:  PosIMG21.Assign(TmpIMG);
        23:  PosIMG22.Assign(TmpIMG);
        24:  PosIMG23.Assign(TmpIMG);
        25:  PosIMG24.Assign(TmpIMG);
        26:  PosIMG25.Assign(TmpIMG);
        27:  PosIMG26.Assign(TmpIMG);
        28:  PosIMG27.Assign(TmpIMG);
        29:  PosIMG28.Assign(TmpIMG);
        30:  PosIMG29.Assign(TmpIMG);
        31:  PosIMG30.Assign(TmpIMG);
        32:  PosIMG31.Assign(TmpIMG);
        33:  PosIMG32.Assign(TmpIMG);
        34:  PosIMG33.Assign(TmpIMG);
        35:  PosIMG34.Assign(TmpIMG);
        36:  PosIMG35.Assign(TmpIMG);
        37:  PosIMG36.Assign(TmpIMG);
        38:  PosIMG37.Assign(TmpIMG);
        39:  PosIMG38.Assign(TmpIMG);
        40:  PosIMG39.Assign(TmpIMG);
        41:  PosIMG40.Assign(TmpIMG);
        42:  PosIMG41.Assign(TmpIMG);
        43:  PosIMG42.Assign(TmpIMG);
        44:  PosIMG43.Assign(TmpIMG);
        45:  PosIMG44.Assign(TmpIMG);
        46:  PosIMG45.Assign(TmpIMG);
        47:  PosIMG46.Assign(TmpIMG);
        48:  PosIMG47.Assign(TmpIMG);
        end;
        TmpIMG.Free;
      end;
    end else
    begin
      Case n of   {Piece is a built-in piece}
       1:  PosIMG0.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[0])), 'JPEG'));
       2:  PosIMG1.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[1])), 'JPEG'));
       3:  PosIMG2.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[2])), 'JPEG'));
       4:  PosIMG3.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[3])), 'JPEG'));
       5:  PosIMG4.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[4])), 'JPEG'));
       6:  PosIMG5.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[5])), 'JPEG'));
       7:  PosIMG6.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[6])), 'JPEG'));
       8:  PosIMG7.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[7])), 'JPEG'));
       9:  PosIMG8.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[8])), 'JPEG'));
      10:  PosIMG9.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[9])), 'JPEG'));
      11:  PosIMG10.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[10])), 'JPEG'));
      12:  PosIMG11.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[11])), 'JPEG'));
      13:  PosIMG12.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[12])), 'JPEG'));
      14:  PosIMG13.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[13])), 'JPEG'));
      15:  PosIMG14.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[14])), 'JPEG'));
      16:  PosIMG15.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[15])), 'JPEG'));
      17:  PosIMG16.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[16])), 'JPEG'));
      18:  PosIMG17.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[17])), 'JPEG'));
      19:  PosIMG18.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[18])), 'JPEG'));
      20:  PosIMG19.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[19])), 'JPEG'));
      21:  PosIMG20.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[20])), 'JPEG'));
      22:  PosIMG21.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[21])), 'JPEG'));
      23:  PosIMG22.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[22])), 'JPEG'));
      24:  PosIMG23.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[23])), 'JPEG'));
      25:  PosIMG24.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[24])), 'JPEG'));
      26:  PosIMG25.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[25])), 'JPEG'));
      27:  PosIMG26.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[26])), 'JPEG'));
      28:  PosIMG27.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[27])), 'JPEG'));
      29:  PosIMG28.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[28])), 'JPEG'));
      30:  PosIMG29.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[29])), 'JPEG'));
      31:  PosIMG30.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[30])), 'JPEG'));
      32:  PosIMG31.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[31])), 'JPEG'));
      33:  PosIMG32.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[32])), 'JPEG'));
      34:  PosIMG33.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[33])), 'JPEG'));
      35:  PosIMG34.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[34])), 'JPEG'));
      36:  PosIMG35.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[35])), 'JPEG'));
      37:  PosIMG36.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[36])), 'JPEG'));
      38:  PosIMG37.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[37])), 'JPEG'));
      39:  PosIMG38.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[38])), 'JPEG'));
      40:  PosIMG39.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[39])), 'JPEG'));
      41:  PosIMG40.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[40])), 'JPEG'));
      42:  PosIMG41.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[41])), 'JPEG'));
      43:  PosIMG42.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[42])), 'JPEG'));
      44:  PosIMG43.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[43])), 'JPEG'));
      45:  PosIMG44.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[44])), 'JPEG'));
      46:  PosIMG45.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[45])), 'JPEG'));
      47:  PosIMG46.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[46])), 'JPEG'));
      48:  PosIMG47.LoadFromStream(TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(PosImg[47])), 'JPEG'));
      end;
    end;
  end;

  UpDateGameDisp(NumTries);
  Case NumPieces of
    4 : UpDateBestDisp(Best4[0].Draw);
   12 : UpDateBestDisp(Best12[0].Draw);
   20 : UpDateBestDisp(Best20[0].Draw);
   48 : UpDateBestDisp(Best48[0].Draw);
  end;
end;

procedure TForm1.UpDateHigh(var Best: TBestArray);
var n, shift: integer;
begin
  {See if new heigh}
  NewHigh:=False;
  n:=-1;
  repeat
    Inc(n);
    if NumTries<Best[n].Draw then
      NewHigh:=True
    else
      if NumTries=Best[n].Draw then
        NewHigh:=(encodetime(Hour, Min, Sec, 0) <= encodetime(Best[n].Hour,
                                                              Best[n].Min,
                                                              Best[n].Sec, 0));
  until (NewHigh) or (n=7);

  {If new high - insert at index n}
  if NewHigh then
  begin

    Snd(sHigh);

    for shift:=7 downto n+1 do
    begin
      Best[shift]:=Best[Shift-1];
    end;

    if Length(ComForm1.PlayerEdit.Text)=0 then
    begin
      if Length(SLock1.RegName)>0 then
        ComForm1.PlayerEdit.Text:=SLock1.RegName
      else
        ComForm1.PlayerEdit.Text:='Unknown good player ';
    end;

    {Get Players Name}
    if (not PcPlays) and ShowHigh then
    begin
      Best[n].Name:='<    Your Name !    >';
      ComMenu:=mNewHigh;
      ComForm1.ShowModal;
    end;

    if PcPlays then
      Best[n].Name:='The Computer'
    else
      Best[n].Name:=ComForm1.PlayerEdit.Text;

    {Fill Name string with trailing spaces up to 20 characters}
    Insert(StringOfChar(' ',20-Length(Best[n].Name)),
                        Best[n].Name, Length(Best[n].Name)+1);

    Best[n].Hour:=Hour;
    Best[n].Min:=Min;
    Best[n].Sec:=Sec;
    Best[n].Draw:=NumTries;
    Case NumPieces of
      4 : UpDateBestDisp(Best4[0].Draw);
     12 : UpDateBestDisp(Best12[0].Draw);
     20 : UpDateBestDisp(Best20[0].Draw);
     48 : UpDateBestDisp(Best48[0].Draw);
    end;

    if ShowHigh then
    begin
     ComMenu:=mHigh;
     ComForm1.ShowModal;
    end;
  end;
end;

procedure Tform1.PlayGame(Pos : integer);
var LastOpenPos : integer;
begin
  if not(SLock1.Status=stExpired) then
  begin
    if not WaitOnClose then
    begin
      case NumOpen of
       0 : if PosIsLeft[Pos] then OpenPos(Pos);
       1 : begin
             if  (not IsOpen[Pos]) and PosIsLeft[Pos] then
             begin
               if (Pos<>CurPos) and (PosImg[Pos]=PosImg[CurPos]) then
               begin {Match}
                 Inc(NumTries);
                 UpDateGameDisp(NumTries);
                 LastOpenPos:=CurPos;
                 OpenPos(Pos);
                 Snd(sMatch);
                 WaitP(1500);
                 RemovePos(Pos);
                 RemovePos(LastOpenPos);
                 NumOpen:=0;
                 NumPairsLeft:=NumPairsLeft-1;
                 DoMatch:=false;
                 if NumPairsLeft=0 then
                 begin {Finished !}
                   Finished:=True;
                   DecodeTime(Now-StartTime, Hour, Min, Sec, Msec);
                   Snd(sFinish);
                 end;
               end else
               begin {NoMatch}
                 Inc(NumTries);
                 UpDateGameDisp(NumTries);
                 LastOpenPos:=CurPos;
                 OpenPos(Pos);
                 WaitP(500);
                 Snd(sWrong);
                 if AutoClose then
                 begin
                   WaitP(Comform1.CloseDelaySpinEdit.Value);
                   ClosePos(Pos);
                   Snd(sClose);
                   WaitP(400);
                   ClosePos(LastOpenPos);
                   Snd(sClose);
                 end else WaitOnClose:=true;
               end;
             end;
           end;
      end;
    end else
    begin
      if IsOpen[Pos] and PosIsLeft[Pos] then
      begin
       ClosePos(Pos);
       Snd(sClose);
       If NumOpen=0 then WaitOnClose:=False;
      end;
    end;
  end else  {expired message}
  begin
    ShowMessage('Animated KidsMemo has expired and the pieces will not open.'+
                #10+#10+#13+
                '   You can enable the program by registering it from the menu.');
  end;
end;

procedure TForm1.P0Click(Sender: TObject);
begin
 PlayGame(0);
end;

procedure TForm1.P1Click(Sender: TObject);
begin
  PlayGame(1);
end;

procedure TForm1.P2Click(Sender: TObject);
begin
  PlayGame(2);
end;

procedure TForm1.P3Click(Sender: TObject);
begin
  PlayGame(3);
end;

procedure TForm1.P4Click(Sender: TObject);
begin
  PlayGame(4);
end;

procedure TForm1.P5Click(Sender: TObject);
begin
  PlayGame(5);
end;

procedure TForm1.P6Click(Sender: TObject);
begin
  PlayGame(6);
end;

procedure TForm1.P7Click(Sender: TObject);
begin
  PlayGame(7);
end;

procedure TForm1.P8Click(Sender: TObject);
begin
  PlayGame(8);
end;

procedure TForm1.P9Click(Sender: TObject);
begin
  PlayGame(9);
end;

procedure TForm1.P10Click(Sender: TObject);
begin
  PlayGame(10);
end;

procedure TForm1.P11Click(Sender: TObject);
begin
  PlayGame(11);
end;

procedure TForm1.P12Click(Sender: TObject);
begin
  PlayGame(12);
end;

procedure TForm1.P13Click(Sender: TObject);
begin
 PlayGame(13);
end;

procedure TForm1.P14Click(Sender: TObject);
begin
 PlayGame(14);
end;

procedure TForm1.P15Click(Sender: TObject);
begin
 PlayGame(15);
end;

procedure TForm1.P16Click(Sender: TObject);
begin
 PlayGame(16);
end;

procedure TForm1.P17Click(Sender: TObject);
begin
 PlayGame(17);
end;

procedure TForm1.P18Click(Sender: TObject);
begin
 PlayGame(18);
end;

procedure TForm1.P19Click(Sender: TObject);
begin
 PlayGame(19);
end;

procedure TForm1.P20Click(Sender: TObject);
begin
 PlayGame(20);
end;

procedure TForm1.P21Click(Sender: TObject);
begin
 PlayGame(21);
end;

procedure TForm1.P22Click(Sender: TObject);
begin
 PlayGame(22);
end;

procedure TForm1.P23Click(Sender: TObject);
begin
 PlayGame(23);
end;

procedure TForm1.P24Click(Sender: TObject);
begin
 PlayGame(24);
end;

procedure TForm1.P25Click(Sender: TObject);
begin
 PlayGame(25);
end;

procedure TForm1.P26Click(Sender: TObject);
begin
 PlayGame(26);
end;

procedure TForm1.P27Click(Sender: TObject);
begin
 PlayGame(27);
end;

procedure TForm1.P28Click(Sender: TObject);
begin
 PlayGame(28);
end;

procedure TForm1.P29Click(Sender: TObject);
begin
 PlayGame(29);
end;

procedure TForm1.P30Click(Sender: TObject);
begin
 PlayGame(30);
end;

procedure TForm1.P31Click(Sender: TObject);
begin
 PlayGame(31);
end;

procedure TForm1.P32Click(Sender: TObject);
begin
 PlayGame(32);
end;

procedure TForm1.P33Click(Sender: TObject);
begin
 PlayGame(33);
end;

procedure TForm1.P34Click(Sender: TObject);
begin
 PlayGame(34);
end;

procedure TForm1.P35Click(Sender: TObject);
begin
 PlayGame(35);
end;

procedure TForm1.P36Click(Sender: TObject);
begin
 PlayGame(36);
end;

procedure TForm1.P37Click(Sender: TObject);
begin
 PlayGame(37);
end;

procedure TForm1.P38Click(Sender: TObject);
begin
 PlayGame(38);
end;

procedure TForm1.P39Click(Sender: TObject);
begin
 PlayGame(39);
end;

procedure TForm1.P40Click(Sender: TObject);
begin
 PlayGame(40);
end;

procedure TForm1.P41Click(Sender: TObject);
begin
 PlayGame(41);
end;

procedure TForm1.P42Click(Sender: TObject);
begin
 PlayGame(42);
end;

procedure TForm1.P43Click(Sender: TObject);
begin
 PlayGame(43);
end;

procedure TForm1.P44Click(Sender: TObject);
begin
 PlayGame(44);
end;

procedure TForm1.P45Click(Sender: TObject);
begin
 PlayGame(45);
end;

procedure TForm1.P46Click(Sender: TObject);
begin
 PlayGame(46);
end;

procedure TForm1.P47Click(Sender: TObject);
begin
 PlayGame(47);
end;

procedure TForm1.BgImageClick(Sender: TObject);
begin
  if Finished then
  begin
    Case NumPieces of
      4: UpDateHigh(Best4);
     12: UpDateHigh(Best12);
     20: UpDateHigh(Best20);
     48: UpDateHigh(Best48);
    end;
    Initialize(self);
  end;
end;

procedure TForm1.HelpKey;
var MenuResult: integer;
begin
  Case LastHelp of
    1: ComMenu:=mHelp;
    2: ComMenu:=mHelp2;
    3: ComMenu:=mHelp3;
  end;

  repeat
    MenuResult:=ComForm1.ShowModal-1;
    Case MenuResult of
     15: ComMenu:=mHelp3;
     16: ComMenu:=mHelp;
     17: ComMenu:=mHelp2;
     18: ComMenu:=mHelp2;
     19: ComMenu:=mHelp3;
     20: ComMenu:=mHelp;
    end;
  Until (MenuResult=14);
end;

procedure TForm1.ACloseKey;
begin
 AutoClose:= not AutoClose;
 ComForm1.ACloseChkBx.Checked:=AutoClose;
 if AutoClose then
 begin
   Snd(sAutoOn);
   Wait(500);
 end else
 begin
   Snd(sAutoOff);
   Wait(500);
 end;
end;

procedure TForm1.RegisterKey;
begin
 ComMenu:=mRegister;
 ComForm1.ShowModal;
end;

procedure TForm1.BgSelectKey;
begin
 ComMenu:=mBackGround;
 ComForm1.ShowModal;
// Initialize(self);
end;

procedure TForm1.VersionKey;
begin
 ShowMessage('Animated KidsMemo Version '+Ver+' Build '+Build+#10+#10+#13
            +'Registered to : '+SLock1.RegName);
end;

procedure TForm1.CvSelectKey;
begin
 ComMenu:=mCover;
 ComForm1.ShowModal;
// Initialize(self);
end;

procedure TForm1.PsSelectKey;
begin
 ComMenu:=mPiece;
 ComForm1.ShowModal;
// Initialize(self);
end;

procedure TForm1.WriteSetupKey;
const k: string='KidsMemo Setup';
var SetupFile : Tinifile;
             n: integer;
             s: string;
begin
  ComMenu:=mWrite;
  if ComForm1.ShowModal<>10 then
  begin;
    SaveDialog1.InitialDir:=KidsMemoPath;
    SaveDialog1.Title:='Write current KidsMemo setup to file';
    if SaveDialog1.execute then
    begin
      SetupFile:=Tinifile.Create(SaveDialog1.FileName);
      with SetupFile do
      begin
        WriteBool(k,'AuCl', AutoClose);
        WriteBool(k,'SHigh', ShowHigh);
        WriteBool(k,'DblCl', DobbClick);
        WriteBool(k,'TrspGIF', TrspGIF);
        WriteInteger(k,'NumP', NumPieces);
        WriteInteger(k,'CloseDly',CloseDly);

        for n:=0 to 2 do
        begin
          WriteBool(k,'ExtBg'+IntToStr(n+1), ExtBg[n]);
          WriteBool(k,'BgSel'+IntToStr(n+1), BgSel[n]);

          {Handle path's as Absolute or Relative}
          s:=UpperCase(ExtBgP[n]);
          if Pos(UpperCase(Form1.KidsMemoPath), s)>0 then
            Delete(s, 1, Length(Form1.KidsMemoPath));

          WriteString(k,'XBg'+IntToStr(n+1), s);

          WriteBool(k,'CvSel'+IntToStr(n+1), CvSel[n]);
          WriteBool(k,'ExtCv'+IntToStr(n+1), ExtCv[n]);

          {Handle path's as Absolute or Relative}
          s:=UpperCase(ExtCvP[n]);
          if Pos(UpperCase(Form1.KidsMemoPath), s)>0 then
            Delete(s, 1, Length(Form1.KidsMemoPath));

          WriteString(k,'XCv'+IntToStr(n+1), s);
        end;

        WriteInteger(k,'NumPsSel', NumPsSel);
        for n:=0 to 23 do
        begin
          WriteBool(k,'ExtPs'+IntToStr(n+1), ExtPs[n]);
          WriteBool(k,'PsSel'+IntToStr(n+1), PsSel[n]);

          {Handle path's as Absolute or Relative}
          s:=UpperCase(ExtPsP[n]);
          if Pos(UpperCase(Form1.KidsMemoPath), s)>0 then
            Delete(s, 1, Length(Form1.KidsMemoPath));

          WriteString(k,'XPs'+IntToStr(n+1), s);
        end;

        for n:=0 to 23 do WriteInteger(k,'PA'+IntToStr(n), PieceArray[n]);

        for n:=0 to 32 do
        begin
          WriteBool(k,'SndSel'+IntToStr(n), SndSel[n]);

          {Handle path's as Absolute or Relative}
          s:=UpperCase(ExtSnd[n]);
          if Pos(UpperCase(Form1.KidsMemoPath), s)>0 then
            Delete(s, 1, Length(Form1.KidsMemoPath));

          WriteString(k,'ExtSnd'+IntToStr(n), s);
        end;

      end;
      SetupFile.Free;
    end;
  end;
end;

procedure TForm1.SndSelectKey;
begin
 ComMenu:=mSound;
 ComForm1.ShowModal;
// Initialize(self);
end;

procedure TForm1.GetKms(FileName: string);
const k: string='KidsMemo Setup';
var SetupFile: Tinifile;
            n: integer;
            s: string;
begin
  SetupFile:=Tinifile.Create(FileName);
  with SetupFile do
  begin
    AutoClose:=ReadBool(k,'AuCl', AutoClose);
    ShowHigh:=ReadBool(k,'SHigh', ShowHigh);
    DobbClick:=ReadBool(k,'DblCl', DobbClick);
    TrspGIF:=ReadBool(k,'TrspGIF', TrspGIF);
    NumPieces:=ReadInteger(k,'NumP', NumPieces);
    CloseDly:=ReadInteger(k,'CloseDly',CloseDly);

    for n:=0 to 2 do
    begin
      BgSel[n]:=ReadBool(k,'BgSel'+IntToStr(n+1), BgSel[n]);
      ExtBg[n]:=ReadBool(k,'ExtBg'+IntToStr(n+1), ExtBg[n]);

      {Handle path as Absolute or Relative}
      s:=ReadString(k,'XBg'+IntToStr(n+1), ExtBgP[n]);
      if (Length(ExtractFileDrive(s))=0) and (Length(s)>0) then
        s:=KidsMemoPath+s;

      ExtBgP[n]:=s;

      CvSel[n]:=ReadBool(k,'CvSel'+IntToStr(n+1), CvSel[n]);
      ExtCv[n]:=ReadBool(k,'ExtCv'+IntToStr(n+1), ExtCv[n]);

      {Handle path as Absolute or Relative}
      s:=ReadString(k,'XCv'+IntToStr(n+1), ExtCvP[n]);
      if (Length(ExtractFileDrive(s))=0) and (Length(s)>0) then
        s:=KidsMemoPath+s;

      ExtCvP[n]:=s;
    end;

    NumPsSel:=ReadInteger(k,'NumPsSel', NumPsSel);
    for n:=0 to 23 do
    begin
      ExtPs[n]:=ReadBool(k,'ExtPs'+IntToStr(n+1), ExtPs[n]);
      PsSel[n]:=ReadBool(k,'PsSel'+IntToStr(n+1), PsSel[n]);

      {Handle path as Absolute or Relative}
      s:=ReadString(k,'XPs'+IntToStr(n+1), ExtPsP[n]);
      if (Length(ExtractFileDrive(s))=0) and (Length(s)>0) then
        s:=KidsMemoPath+s;

      ExtPsP[n]:=s;

//      MessageDlg('1 - ' + s, mtConfirmation, [mbOK], 0);

    end;

    for n:=0 to 23 do
      PieceArray[n]:=ReadInteger(k,'PA'+IntToStr(n), PieceArray[n]);

    for n:=0 to 32 do
    begin
      SndSel[n]:=ReadBool(k,'SndSel'+IntToStr(n), SndSel[n]);

      {Handle path as Absolute or Relative}
      s:=ReadString(k,'ExtSnd'+IntToStr(n), ExtSnd[n]);
      if (Length(ExtractFileDrive(s))=0) and (Length(s)>0) then
        s:=KidsMemoPath+s;

      ExtSnd[n]:=s;
    end;

  end;
  SetupFile.Free;
end;

procedure TForm1.LoadSetupKey;
begin
  OpenDialog1.InitialDir:=KidsMemoPath;
  OpenDialog1.Title:='Read new KidsMemo setup from file';
  if OpenDialog1.execute then GetKms(OpenDialog1.Filename);
  ComForm1.ACloseChkBx.Checked:=AutoClose;
  ComForm1.ShowHighChkBx.Checked:=ShowHigh;
  ComForm1.DobbClickChkBx.Checked:=DobbClick;
  ComForm1.TrspGifChkBox.Checked:=TrspGIF;
  ComForm1.CloseDelaySpinEdit.Value:=CloseDly;
end;

procedure TForm1.RegisterKms;
var       R: TRegIniFile;
begin
  R := TRegIniFile.Create('');
  with R do
  begin
    RootKey := HKEY_CLASSES_ROOT;
    WriteString('.kms','','KidsMemoSetupFile');
    WriteString('KidsMemoSetupFile','','Setup file for Animated KidsMemo');
    WriteString('KidsMemoSetupFile\DefaultIcon','', KidsMemoPath + 'AnimatedKidsMemo.Exe,2');
    WriteString('KidsMemoSetupFile\Shell','','');
    WriteString('KidsMemoSetupFile\Shell\open','', '');
    WriteString('KidsMemoSetupFile\Shell\open\command','', KidsMemoPath + 'AnimatedKidsMemo.Exe %1');
    Free;
  end;
end;

procedure TForm1.ComputerPlay;
var      R1, R2: integer;
    AcloseState: boolean;
begin
 PcPlays:=True;
 ShowMessage('Press the SPACE BAR to stop the computer playing');
 GetAsyncKeyState(32);
 GetAsyncKeyState(27);
 ACloseState:=AutoClose;
 if not AutoClose then ACloseKey;
 repeat
   repeat
     repeat
       R1:=Random(NumPieces);
     until PosIsLeft[R1];
     repeat
       R2:=Random(NumPieces);
     until PosIsLeft[R2] and (R2<>R1);

     PlayGame(R1);
     Wait(400);
     PlayGame(R2);

     If (GetAsyncKeyState(32) <> 0) or (GetAsyncKeyState(27) <> 0) then
       PcPlays:=False;

     Timer1Timer(Self);
   until (Finished) or (not PcPlays) ;

  if (finished) and (PcPlays) then BgImageClick(Self);
 until (not PcPlays);
 if ACloseState<>AutoClose then ACloseKey;
end;

procedure TForm1.DeleteRegistry;
var mstr: string;
begin
  mstr:='Do you want to unregister KidsMemo and delete the registry entries ?';
  mstr:=mstr+#10#10#13+'You can re-register by entering Registration Name and Code again.';
  if (SLock1.Status=stRegistered) and  (Pos('Breiting',SLock1.RegName)<>0) and
     (MessageDlg(mStr, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    RegData:=TRegistry.Create;
    RegData.RootKey:=HKEY_CLASSES_ROOT;
    if RegData.DeleteKey(RStrA1) and RegData.DeleteKey(RStrB1) then
      ShowMessage('SLock keys deleted !')
    else ShowMessage('SLock keys failed to delete');
    RegData.Free;
  end;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if GameStarted and Finished then Exit;
  Case key of
     VK_F1 : HelpKey;
     VK_F2 : begin
               NumPieces:=4;
               Initialize(Self);
             end;
     VK_F3 : begin
               NumPieces:=12;
               Initialize(Self);
             end;
     VK_F4 : begin
               NumPieces:=20;
               Initialize(Self);
             end;
     VK_F5 : begin
               NumPieces:=48;
               Initialize(Self);
             end;
     VK_F6 : VersionKey;

//     VK_F6 : CvSelectKey;
//     VK_F7 : PsSelectKey;
//     VK_F8 : BgSelectKey;
//     VK_F9 : SndSelectKey;
//     VK_F10: WriteSetupKey;
//     VK_F11: LoadSetupKey;
//     VK_F12: RegisterKey;
  end;
end;

Procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if PcPlays then
   begin
    PcPlays:=False;
    Exit;
   end;

   if GameStarted and Finished then Exit;
   Case UpCase(key) of
    'A' : ACloseKey;
    'H' : HelpKey;
    'R' : RegisterKey;
//    'P' : PsSelectKey;
//    'B' : BgSelectKey;
//    'C' : CvSelectKey;
//    'S' : SndSelectKey;
//    'W' : WriteSetupKey;
//    'L' : LoadSetupKey;
    'T' : begin
            ComMenu:=mHigh;
            ComForm1.ShowModal;
          end;
    '1' : begin
            NumPieces:=4;
            Initialize(Self);
          end;
    '2' : begin
            NumPieces:=12;
            Initialize(Self);
          end;
    '3' : begin
            NumPieces:=20;
            Initialize(Self);
          end;
    '4' : begin
            NumPieces:=48;
            Initialize(Self);
          end;
    #27 : begin {Esc}
            Halt;
          end;
    'Q' : ComputerPlay;
    'U' : DeleteRegistry;
  end;
end;

procedure TForm1.RegNow;
begin
 Form1.SLock1.RegName := ComForm1.RegNameEdit.Text;
 Form1.SLock1.RegisterNow(ComForm1.RegPassEdit.Text);
end;

procedure TForm1.FormActivate(Sender: TObject);
var ButJpgImg: TJPEGImage;
begin
  {Load CoolForm picture bitmap from resource 'PlayForm.jpg'}
  PlayFormJpgImage:=TJPEGImage.Create;
  PlayFormJpgImage.LoadFromStream(TResourceStream.Create(Hinstance, 'PlayForm', 'JPEG'));
  PlayForm.Picture.Bitmap.Assign(PlayFormJpgImage);
  PlayForm.LoadMaskFromRes(Hinstance, 'PlayForm', 'MASK');
  PlayFormJpgImage.Free;

  ButJpgImg:=TJPEGImage.Create;
  ButJpgImg.LoadFromStream(TResourceStream.Create(Hinstance, 'ButImg', 'JPEG'));
  ComForm1.But1Img.Canvas.Draw(0,0,ButJpgImg);
  ComForm1.But2Img.Canvas.Draw(0,0,ButJpgImg);
  ComForm1.But3Img.Canvas.Draw(0,0,ButJpgImg);
  ComForm1.But4Img.Canvas.Draw(0,0,ButJpgImg);
  ComForm1.But5Img.Canvas.Draw(0,0,ButJpgImg);
  ComForm1.But6Img.Canvas.Draw(0,0,ButJpgImg);
  ComForm1.But7Img.Canvas.Draw(0,0,ButJpgImg);
  ComForm1.But8Img.Canvas.Draw(0,0,ButJpgImg);
  ComForm1.But9Img.Canvas.Draw(0,0,ButJpgImg);
  ComForm1.But10Img.Canvas.Draw(0,0,ButJpgImg);
  ComForm1.But11Img.Canvas.Draw(0,0,ButJpgImg);
  ComForm1.But12Img.Canvas.Draw(0,0,ButJpgImg);
  ComForm1.But13Img.Canvas.Draw(0,0,ButJpgImg);
  ComForm1.But14Img.Canvas.Draw(0,0,ButJpgImg);
  ButJpgImg.Free;

  TimeLabel.Top:=545; {543}
  TimeLabel.Left:=375;
  TimeLabel.Font.Style:=[fsBold];

  ComForm1.ACloseChkBx.Checked:=AutoClose;
  ComForm1.ShowHighChkBx.Checked:=ShowHigh;
  ComForm1.DobbClickChkBx.Checked:=DobbClick;
  ComForm1.TrspGifChkBox.Checked:=TrspGIF;
  ComForm1.RegPassEdit.Text:='';

  {Load Exit bitmap to Trnsp2 image}
  TrnsBMP2:=TBitmap.Create;
  TrnsBMP2.LoadFromStream(TResourceStream.Create(Hinstance, 'Exit', 'BMP'));
  TrnspImg2.Picture.Assign(TrnsBMP2);
  Trnspimg2.Transparent:=True;
  TrnsBMP2.Free;

  Initialize(Self);
end;

Procedure TForm1.SetDefaults;
var n: integer;
begin
  {Set defaults}
  RegUser:=False;
  Finished:=False;
  GameStarted:=False;
  PcPlays:=False;
  ShowHigh:=False;

  SLock1.EncryptionKey:=#212;
  RStrA1:='HTTfileClass';

  DobbClick:=False;
  AutoClose:=False;
  CloseDly:=400;
  LastHelp:=1;
  TrspGIF:=True;
  NumPieces:=12;              {Default number of pieces}
  NumUsed:=0;
  NewHigh:=False;

  SLock1.EncryptionKey:=SLock1.EncryptionKey+#199;
  RStrA2:='CLSID';

  for n:=0 to 7 do
  begin
    with Best4[n] do
    begin
      Name:='....................';
      Hour:=23;
       Min:=59;
       Sec:=59;
      Draw:=999;
    end;
    with Best12[n] do
    begin
      Name:='....................';
      Hour:=23;
       Min:=59;
       Sec:=59;
      Draw:=999;
    end;
    with Best20[n] do
    begin
      Name:='....................';
      Hour:=23;
       Min:=59;
       Sec:=59;
      Draw:=999;
    end;
    with Best48[n] do
    begin
      Name:='....................';
      Hour:=23;
       Min:=59;
       Sec:=59;
      Draw:=999;
    end;
  end;

  SLock1.EncryptionKey:=SLock1.EncryptionKey+#150;
  RStrB1:='ID';

  {Set default path's}
  KidsMemoPath:=ExtractFilePath(ParamStr(0));
  LastCvPath:=KidsMemoPath;
  LastBgPath:=KidsMemoPath;
  LastPsPath:=KidsMemoPath;
  LastSndPath:=KidsMemoPath;
  {Default BackGround and Cover image settings}
  for n:=0 to 2 do
  begin
    BgSel[n]:=False;    {No builtin Bg images selected}
    ExtBg[n]:=False;    {No custum Bg images selected}
    ExtBgP[n]:='';      {No path's defined for custum Bg images}

    CvSel[n]:=False;    {No builtin Cv images selected}
    ExtCv[n]:=False;    {No custum Cv images selected}
    ExtCvP[n]:='';      {No path's defined for custum Cv images}
  end;

  CvSel[1]:=True;

  SLock1.EncryptionKey:=SLock1.EncryptionKey+#164;
  RStrB2:='SysControl.14';


  {Default Piece image settings}
  NumPsSel:=0;                       {No pieces selected}
  for n:=0 to 23 do
  begin
    PsSel[n]:=False; {Default no selected pieces}
    ExtPs[n]:=False; {Default no custum pieces}
    ExtPsP[n]:='';   {No path's defined for custum Ps images}
  end;
  {Default Sound settings}
  for n:=0 to 32 do
  begin
    SndSel[n]:=False; {No external sounds selected}
    ExtSnd[n]:='';    {External sound path's empty}
  end;

  SLock1.EncryptionKey:=SLock1.EncryptionKey+#250;
  RStrB3:='{1A328BC4F320E}';
end;

procedure TForm1.InitVars;
var   n: integer;
      s: string;
begin
  SetDefaults;
  LKmP:=''; {Last KidsMemo path undefined}

  {*******************************************************************
  * We check the current status of the protection in the form create *
  * of the main form. (Slock1.CheckProtection) The internal state of *
  * Slock is set, and we then use 'UpdateStatus' to read the status  *
  * of Slock out into the status display                             *
  ********************************************************************}
  // load the secret information into the SLock component
  // this stops disassemblers reading the information from
  // the delphi form properties

  SLock1.EncryptionKey:=SLock1.EncryptionKey+#130;

  {key is: #212+#199+#150+#164+#250+#130}

  {KidsMemo SLock keys}
  {MainKey path:      HTTfileInstREC\CLSID\(std)}
  {BackupKey path:    ID\SysControl.12\{1FEE343GAKKQ2}

  {Animated KidsMemo SLock keys}
  {MainKey path:      HTTfileClass\CLSID\(std)}
  {BackupKey path:    ID\SysControl.14\{1A328BC4F320E}

  {Set SLock Registry main and backup key}
  SLock1.RegKeyMainKey  := '(std)';
  SLock1.RegKeyMainPath := RStrA1+'\';
  SLock1.RegKeyMainPath := SLock1.RegKeyMainPath+RStrA2;
  SLock1.RegKeyMainRoot := CLASSES_ROOT;

  SLock1.RegKeyBackKey  := 'SetID';
  SLock1.RegKeyBackPath := RStrB1+'\';
  SLock1.RegKeyBackPath := SLock1.RegKeyBackPath + RStrB2+'\';
  SLock1.RegKeyBackPath := SLock1.RegKeyBackPath + RStrB3;
  SLock1.RegKeyBackRoot := CLASSES_ROOT;

  SLock1.ProtectionOpt:=[poBack];

  // check the protection of the Slock component
  SLock1.CheckProtection;

  Beta:=False;

  {Get/Create setups in registry}
  KeyName:='Software\AnimatedKidsMemo\Setups';
  RegVer:='';
  RegData:=TRegistry.Create;
  if RegData.KeyExists(KeyName)then
  begin
   try
    RegData.OpenKey(KeyName,False);

    LKmP:=RegData.ReadString('LKmP');
    RegVer:=RegData.ReadString('RegVer');
    AutoClose:=RegData.ReadBool('AuCl');
    ShowHigh:=RegData.ReadBool('SHigh');
    DobbClick:=RegData.ReadBool('DblCl');
    TrspGIF:=RegData.ReadBool('TrspGIF');
    NumUsed:=RegData.ReadInteger('Used');
    NumPieces:=RegData.ReadInteger('NumP');
    CloseDly:=RegData.ReadInteger('CloseDly');

    for n:=0 to 2 do
    begin
      ExtBg[n]:=RegData.ReadBool('ExtBg'+IntToStr(n+1));
      ExtBgP[n]:=RegData.ReadString('XBg'+IntToStr(n+1));
      BgSel[n]:=RegData.ReadBool('BgSel'+IntToStr(n+1));

      ExtCv[n]:=RegData.ReadBool('ExtCv'+IntToStr(n+1));
      ExtCvP[n]:=RegData.ReadString('XCv'+IntToStr(n+1));
      CvSel[n]:=RegData.ReadBool('CvSel'+IntToStr(n+1));
    end;

    NumPsSel:=RegData.ReadInteger('NumPsSel');
    for n:=0 to 23 do
    begin
      ExtPs[n]:=RegData.ReadBool('ExtPs'+IntToStr(n+1));
      PsSel[n]:=RegData.ReadBool('PsSel'+IntToStr(n+1));

      {Handle path as Absolute or Relative}
      s:=RegData.ReadString('XPs'+IntToStr(n+1));
      if (Length(ExtractFileDrive(s))=0) and (Length(s)>0) then
        s:=KidsMemoPath+s;

      ExtPsP[n]:=s;
    end;

    for n:=0 to 23 do PieceArray[n]:=RegData.ReadInteger('PA'+IntToStr(n));

    for n:=0 to 32 do
    begin
      ExtSnd[n]:=RegData.ReadString('ExtSnd'+IntToStr(n));
      SndSel[n]:=RegData.ReadBool('SndSel'+IntToStr(n));
    end;

    for n:=0 to 7 do
    begin
      with Best4[n] do
      begin
        Name:=RegData.ReadString('B4N'+IntToStr(n));
        Hour:=RegData.ReadInteger('B4H'+IntToStr(n));
        Min:=RegData.ReadInteger('B4M'+IntToStr(n));
        Sec:=RegData.ReadInteger('B4S'+IntToStr(n));
        Draw:=RegData.ReadInteger('B4D'+IntToStr(n));
      end;
      with Best12[n] do
      begin
        Name:=RegData.ReadString('B12N'+IntToStr(n));
        Hour:=RegData.ReadInteger('B12H'+IntToStr(n));
        Min:=RegData.ReadInteger('B12M'+IntToStr(n));
        Sec:=RegData.ReadInteger('B12S'+IntToStr(n));
        Draw:=RegData.ReadInteger('B12D'+IntToStr(n));
      end;
      with Best20[n] do
      begin
        Name:=RegData.ReadString('B20N'+IntToStr(n));
        Hour:=RegData.ReadInteger('B20H'+IntToStr(n));
        Min:=RegData.ReadInteger('B20M'+IntToStr(n));
        Sec:=RegData.ReadInteger('B20S'+IntToStr(n));
        Draw:=RegData.ReadInteger('B20D'+IntToStr(n));
      end;
      with Best48[n] do
      begin
        Name:=RegData.ReadString('B48N'+IntToStr(n));
        Hour:=RegData.ReadInteger('B48H'+IntToStr(n));
        Min:=RegData.ReadInteger('B48M'+IntToStr(n));
        Sec:=RegData.ReadInteger('B48S'+IntToStr(n));
        Draw:=RegData.ReadInteger('B48D'+IntToStr(n));
      end;
    end;

    LastCvPath:=RegData.ReadString('LCvP');
    LastBgPath:=RegData.ReadString('LBgP');
    LastPsPath:=RegData.ReadString('LPsP');
    LastSndPath:=RegData.ReadString('LSndP');

    RegData.CloseKey;
   Except
    RegData.CloseKey;
    ShowMessage('Setting configuration data to defaults (Parameter mismatch)');
    UpdateReg; {Use default settings if error in registry reading}
   end;
  end else
  begin
   UpdateReg; {Use default settings if no registry key found}
   GetKms(KidsMemoPath+'AnimGIFs.kms'); {Always start with AnimGIFs first time}
  end;

  if RegVer<>Ver then
  begin
    RegData.CloseKey;
    ShowMessage('Setting configuration data to defaults (Version change)');
    SetDefaults;
    UpdateReg; {Use default settings if new version}
    GetKms(KidsMemoPath+'AnimGIFs.kms'); {Always start with AnimGIFs first time}
  end;

  if (LKMP<>KidsMemoPath)then
  begin
    RegData.CloseKey;
    ShowMessage('Setting configuration data to defaults (Path Change)');
    SetDefaults;
    UpdateReg; {Use default settings if new startup path}
    GetKms(KidsMemoPath+'AnimGIFs.kms'); {Always start with AnimGIFs first time}
  end;

  Inc(NumUsed);
  RegData.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
           DC: THandle;  // Display context
         Bits: Integer;  // Bits per pixel
         HRes: Integer;  // Horizontal resolution
         VRes: Integer;  // Vertical resolution
   mStr, Pstr: string;

begin
  // Get current video mode
  // DC   := GetDC(Handle);
  DC   := Canvas.Handle;
  Bits := GetDeviceCaps(DC, BITSPIXEL);
  HRes := GetDeviceCaps(DC, HORZRES);
  VRes := GetDeviceCaps(DC, VERTRES);
  mStr :='Display is set to: '+IntToStr(HRes)+'x'+IntToStr(VRes)+' with '
         +IntToStr(Bits)+' bits color.'+' KidsMemo will'+#10+#13
         +'only work correct in resolutions from 800x600 - EXIT ?';

  If ((HRes<800)or(VRes<600)or(Bits<16)) then
    if MessageDlg(mStr, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Halt;

  Randomize;

  KidsMemoPath:=ExtractFilePath(ParamStr(0));
  RegisterKms;
  InitVars;
  if ParamCount = 1 then
    Pstr:=UpperCase(ParamStr(1));
//    MessageDlg(Pstr, mtConfirmation, [mbOK], 0);
    if Pstr='/C' then
      ComForm1.ClrHigh
    else
    begin
      GetKms(KidsMemoPath+ExtractFileName(Pstr));
    end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  KeyName:='Software\AnimatedKidsMemo\Setups';
  RegData:=TRegistry.Create;
  UpDateReg;
  RegData.Free;
  if FileExists(KidsMemoPath+'Register.exe') then
    DeleteFile(KidsMemoPath+'Register.exe');
  if FileExists(KidsMemoPath+'Register.hlp') then
    DeleteFile(KidsMemoPath+'Register.hlp');
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var MinStr, SecStr, HourStr : string;
begin
  if GameStarted and not Finished then
  begin
    TimeLabel.Font.Color:=ClYellow;
    DecodeTime(Now-StartTime, Hour, Min, Sec, Msec);
    if Min<10 then MinStr:='0';
    MinStr:=MinStr+IntToStr(Min);
    if Sec<10 then SecStr:='0';
    SecStr:=SecStr+IntToStr(Sec);
    TimeLabel.Caption:=MinStr+':'+SecStr;
  end;
  if not GameStarted then
  begin
    TimeLabel.Font.Color:=ClBlack;
    DecodeTime(Now, Hour, Min, Sec, Msec);
    if Hour<10 then HourStr:='0';
    HourStr:=HourStr+IntToStr(Hour);
    if Min<10 then MinStr:='0';
    MinStr:=MinStr+IntToStr(Min);
    TimeLabel.Caption:=HourStr+':'+MinStr;
  end;
end;

procedure TForm1.HighDisp100Click(Sender: TObject);
var n: integer;
begin
  if not DobbClick then
  begin
    for n:=0 to NumPieces-1 do
    begin
      OpenPos(n);
    end;
    NumTries:=999;
    Hour:=23;
    Min:=59;
    Sec:=59;
    Finished:=True;
  end;
end;

procedure TForm1.MenuClick;
var  MenuResult, HighResult: integer;

begin
 repeat
  ComMenu:=mMenu;
  MenuResult:=ComForm1.ShowModal-1;
  Case MenuResult of
    1: begin
         NumPieces:=4;
//         Initialize(self);
       end;
    2: begin
         NumPieces:=12;
//         Initialize(self);
       end;
    3: begin
         NumPieces:=20;
//         Initialize(self);
       end;
    4: CvSelectKey;
    5: PsSelectKey;
    6: BgSelectKey;
    7: SndSelectKey;
    8: ComputerPlay;
    9: WriteSetupKey;
   10: LoadSetupKey;
   11: begin
        ComMenu:=mHigh;
        repeat
         HighResult:=ComForm1.ShowModal-1;
         If HighResult=21 then ComForm1.ClrHigh;
        until HighResult=14;
       end;
   12: RegisterKey;
   47: NumPieces:=48;
   49: HelpKey
  end;
 until MenuResult in [1,2,3,8,14,47];
 Initialize(self);
end;

procedure TForm1.MenuLabClick(Sender: TObject);
begin
 if not DobbClick then MenuClick;
end;

procedure TForm1.MenuLabDblClick(Sender: TObject);
begin
 if DobbClick then MenuClick;
end;

procedure TForm1.HelpLabClick(Sender: TObject);
begin
 if not DobbClick then HelpKey;
end;

procedure TForm1.HelpLabDblClick(Sender: TObject);
begin
 if DobbClick then HelpKey;
end;

procedure TForm1.Slock1Register(Sender: TObject);
begin
  ShowMessage('Registration completed - Enjoy !');
  ComForm1.RegPassEdit.Text:='';
end;

procedure TForm1.Slock1WrongUnlockCode(Sender: TObject);
begin
  ShowMessage('The Registration Name and Code are wrong !');
end;

procedure TForm1.Slock1InGracePeriod(Sender: TObject);
var Gmsg: string;
begin
  if Form1.SLock1.Graceperiod>0 then
    Gmsg:=#10+#13+#13+'To register go to the registration page in the menu'
  else
    Gmsg:=#10+#13+#13+'   This is the last time the pieces can be opened';

  ShowMessage('You are now in the Grace period with '+
              IntToStr(Form1.Slock1.GracePeriod)+
              ' day(s) left'+Gmsg);
end;

procedure TForm1.Slock1Expired(Sender: TObject);
var Xmsg: string;
begin
  Xmsg:=#10+#13+#13+'Please register in order to unlock the program again - Its only $10';
  ShowMessage('Animated KidsMemo has expired and you will not be able to open the pieces'+Xmsg);
end;

procedure TForm1.TrnspImg2Click(Sender: TObject);
begin
  if not DobbClick then Halt;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  P0.Picture.Graphic := nil;
  P1.Picture.Graphic := nil;
  P2.Picture.Graphic := nil;
  P3.Picture.Graphic := nil;
  P4.Picture.Graphic := nil;
  P5.Picture.Graphic := nil;
  P6.Picture.Graphic := nil;
  P7.Picture.Graphic := nil;
  P8.Picture.Graphic := nil;
  P9.Picture.Graphic := nil;
  P10.Picture.Graphic := nil;
  P11.Picture.Graphic := nil;
  P12.Picture.Graphic := nil;
  P13.Picture.Graphic := nil;
  P14.Picture.Graphic := nil;
  P15.Picture.Graphic := nil;
  P16.Picture.Graphic := nil;
  P17.Picture.Graphic := nil;
  P18.Picture.Graphic := nil;
  P19.Picture.Graphic := nil;
  P20.Picture.Graphic := nil;
  P21.Picture.Graphic := nil;
  P22.Picture.Graphic := nil;
  P23.Picture.Graphic := nil;
  P24.Picture.Graphic := nil;
  P25.Picture.Graphic := nil;
  P26.Picture.Graphic := nil;
  P27.Picture.Graphic := nil;
  P28.Picture.Graphic := nil;
  P29.Picture.Graphic := nil;
  P30.Picture.Graphic := nil;
  P31.Picture.Graphic := nil;
  P32.Picture.Graphic := nil;
  P33.Picture.Graphic := nil;
  P34.Picture.Graphic := nil;
  P35.Picture.Graphic := nil;
  P36.Picture.Graphic := nil;
  P37.Picture.Graphic := nil;
  P38.Picture.Graphic := nil;
  P39.Picture.Graphic := nil;
  P40.Picture.Graphic := nil;
  P41.Picture.Graphic := nil;
  P42.Picture.Graphic := nil;
  P43.Picture.Graphic := nil;
  P44.Picture.Graphic := nil;
  P45.Picture.Graphic := nil;
  P46.Picture.Graphic := nil;
  P47.Picture.Graphic := nil;
  AnKmImg.Picture.Graphic := nil;
end;

procedure TForm1.TrnspImg2DblClick(Sender: TObject);
begin
  if DobbClick then Halt;
end;

procedure TForm1.HighDisp100DblClick(Sender: TObject);
var n: integer;
begin
  if DobbClick then
  begin
    for n:=0 to NumPieces-1 do
    begin
      OpenPos(n);
    end;
    NumTries:=999;
    Hour:=23;
    Min:=59;
    Sec:=59;
    Finished:=True;
  end;
end;

end.


