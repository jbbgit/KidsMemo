unit ComForms;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Registry, CoolForm, JPEG, GIFImage, ExtDlgs, Spin, StdCtrls,
  ShellApi;

type
  TComForm1 = class(TForm)
    ComForm: TCoolForm;
    RegNameEdit: TEdit;
    RegPassEdit: TEdit;
    RegNameLabel: TLabel;
    RegPassLabel: TLabel;
    BgImg1: TImage;
    BgImg2: TImage;
    BgImg3: TImage;
    CvImg1: TImage;
    CvImg2: TImage;
    CvImg3: TImage;
    CustBut: TButton;
    BiBut: TButton;
    JpgOpenDialog: TOpenPictureDialog;
    RegBut: TButton;
    PsImg1: TImage;
    PsImg2: TImage;
    PsImg4: TImage;
    PsImg5: TImage;
    PsImg6: TImage;
    PsImg3: TImage;
    PsImg7: TImage;
    PsImg8: TImage;
    PsImg9: TImage;
    PsImg10: TImage;
    PsImg11: TImage;
    PsImg12: TImage;
    PsImg13: TImage;
    PsImg14: TImage;
    PsImg15: TImage;
    PsImg16: TImage;
    PsImg17: TImage;
    PsImg18: TImage;
    PsImg19: TImage;
    PsImg20: TImage;
    PsImg21: TImage;
    PsImg22: TImage;
    PsImg23: TImage;
    PsImg24: TImage;
    TrnspImg: TImage;
    AcceptBut: TButton;
    FinishedBut: TButton;
    NewHighBut: TButton;
    MatchBut: TButton;
    NoMatchBut: TButton;
    WavOpenDialog: TOpenDialog;
    But1Img: TImage;
    SelCvLab: TLabel;
    SelBkLab: TLabel;
    SelPsLab: TLabel;
    SelSndLab: TLabel;
    VHiLab: TLabel;
    S4pLab: TLabel;
    S12pLab: TLabel;
    S20pLab: TLabel;
    PcPlayLab: TLabel;
    WrLab: TLabel;
    LdLab: TLabel;
    RegLab: TLabel;
    But7Img: TImage;
    But2Img: TImage;
    But3Img: TImage;
    But4Img: TImage;
    But5Img: TImage;
    But6Img: TImage;
    But8Img: TImage;
    But9Img: TImage;
    But10Img: TImage;
    But11Img: TImage;
    But12Img: TImage;
    ACloseChkBx: TCheckBox;
    ShowHighChkBx: TCheckBox;
    DobbClickChkBx: TCheckBox;
    AcloseLab: TLabel;
    DobbClickLab: TLabel;
    ShowHighLab: TLabel;
    PlayerEdit: TEdit;
    DoneBut: TButton;
    PlayerLab: TLabel;
    WebBut: TButton;
    EmailLab: TLabel;
    OrderBut: TButton;
    OrderFormBut: TButton;
    PcloseBut: TButton;
    CloseDelaySpinEdit: TSpinEdit;
    ACloseDelayLab: TLabel;
    TrspGifChkBox: TCheckBox;
    GifTrspLab: TLabel;
    NextLab: TLabel;
    PrevLab: TLabel;
    QuitLab: TLabel;
    But13Img: TImage;
    HlpLab: TLabel;
    But14Img: TImage;
    S48pLab: TLabel;
    procedure HideAll;
    procedure CustSndSelect(SelNum : integer);
    procedure CustSndDeSelect(SelNum : integer);
    procedure CustBgSelect(ImgNum : integer);
    procedure CustCvSelect(ImgNum : integer);
    procedure CustPsSelect(ImgNum : integer);
    procedure BgImgSelect(ImageNum: integer);
    procedure CvImgSelect(ImageNum: integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure UpdateMenu;
    procedure UpdateBgImg;
    procedure UpdateCvImg;
    procedure HandleFrame(TC:TControl; Color: TColor; Show:boolean);
    procedure UpDatePsImg;
    procedure UpDateSndImg;
    procedure ShowHigh;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PsImgSelect(ImageNum: integer);
    procedure BiButClick(Sender: TObject);
    procedure RegButClick(Sender: TObject);
    procedure AcceptButClick(Sender: TObject);
    procedure CvImg1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CvImg2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CvImg3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BgImg1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BgImg2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BgImg3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SndAndPsSelect(Num: integer; Button: TMouseButton);
    procedure PsImg1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PsImg2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PsImg3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PsImg4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PsImg5MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PsImg6MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PsImg7MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PsImg8MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PsImg9MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PsImg10MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PsImg11MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PsImg12MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PsImg13MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PsImg14MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PsImg15MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PsImg16MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PsImg17MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PsImg18MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PsImg19MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PsImg20MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PsImg21MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PsImg22MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PsImg23MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PsImg24MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure NoMatchButMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MatchButMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FinishedButMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure NewHighButMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure But1ImgClick(Sender: TObject);
    procedure S4pLabClick(Sender: TObject);
    procedure But2ImgClick(Sender: TObject);
    procedure S12pLabClick(Sender: TObject);
    procedure But3ImgClick(Sender: TObject);
    procedure S20pLabClick(Sender: TObject);
    procedure But4ImgClick(Sender: TObject);
    procedure SelCvLabClick(Sender: TObject);
    procedure But5ImgClick(Sender: TObject);
    procedure SelPsLabClick(Sender: TObject);
    procedure But6ImgClick(Sender: TObject);
    procedure SelBkLabClick(Sender: TObject);
    procedure But7ImgClick(Sender: TObject);
    procedure SelSndLabClick(Sender: TObject);
    procedure But8ImgClick(Sender: TObject);
    procedure PcPlayLabClick(Sender: TObject);
    procedure But9ImgClick(Sender: TObject);
    procedure WrLabClick(Sender: TObject);
    procedure But10ImgClick(Sender: TObject);
    procedure LdLabClick(Sender: TObject);
    procedure But11ImgClick(Sender: TObject);
    procedure VHiLabClick(Sender: TObject);
    procedure But12ImgClick(Sender: TObject);
    procedure RegLabClick(Sender: TObject);
    procedure ACloseChkBxClick(Sender: TObject);
    procedure ShowHighChkBxClick(Sender: TObject);
    procedure DobbClickChkBxClick(Sender: TObject);
    procedure PlayerEditKeyPress(Sender: TObject; var Key: Char);
    procedure DoneButClick(Sender: TObject);
    procedure WebButClick(Sender: TObject);
    procedure EmailLabClick(Sender: TObject);
    procedure OrderButClick(Sender: TObject);
    procedure ClrHigh;
    procedure ExtractRegister;
    procedure OrderFormButClick(Sender: TObject);
    procedure PcloseButMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TrspGifChkBoxClick(Sender: TObject);
    procedure NextLabClick(Sender: TObject);
    procedure PrevLabClick(Sender: TObject);
    procedure QuitLabClick(Sender: TObject);
    procedure CloseDelaySpinEditChange(Sender: TObject);
    procedure PlayerEditDblClick(Sender: TObject);
    procedure S48pLabClick(Sender: TObject);
    procedure But13ImgClick(Sender: TObject);
    procedure HlpLabClick(Sender: TObject);
    procedure But14ImgClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
             ComForm1: TComForm1;
                  Res: TResourceStream;
           ComFormJpg: TJPEGImage;
  ComFormBmp, TestBmp: TBitMap;
              TrnsBMP: TBitmap;

      JpgImage : TJPEGImage;
        GIFImg : TGIFImage;
       PsImgArray : Array[0..23] of TImage;
        Bitmap : TBitmap;

      HeadColor: integer;

implementation

uses MemoUnit;

{$R *.DFM}

procedure TComForm1.HandleFrame(TC:TControl; Color: Tcolor; Show:boolean);
var t,l,w,h,s : integer;
begin
  s:=2;
  With TC do
  begin
    t:=Top;l:=Left;w:=Width;h:=Height;
  end;
  if Show then
  begin
   {Remove frame of image}
    With TrnspImg.Picture.Bitmap.Canvas do
    begin
      Pen.Color:=Color;
      Pen.Style:=psSolid;
      Pen.Width:=s*2;
      MoveTo(l,t);
      LineTo(l+w,t);
      LineTo(l+w,t+h);
      LineTo(l,t+h);
      LineTo(l,t);
    end;
  end else
  begin
    {Draw frame of image}
    With TrnspImg.Picture.Bitmap.Canvas do
    begin
      Pen.Color:=ClWhite ;
      Pen.Style:=psSolid;
      Pen.Width:=s*2;
      MoveTo(l,t);
      LineTo(l+w,t);
      LineTo(l+w,t+h);
      LineTo(l,t+h);
      LineTo(l,t);
    end;
  end;
end;

procedure TComForm1.HideAll;
var n: integer;
begin
  {Remove frames around Bg or Cv images}
  if Form1.ComMenu in [mBackGround, mCover] then
    for n:=0 to 2 do HandleFrame(PsImgArray[n], ClWhite, False);

  if Form1.ComMenu in [mPiece, mSound] then
    for n:=0 to 23 do HandleFrame(PsImgArray[n], ClWhite, False);

  HandleFrame(PcloseBut, ClWhite, False);
  HandleFrame(NoMatchBut, ClWhite, False);
  HandleFrame(MatchBut, ClWhite, False);
  HandleFrame(FinishedBut, ClWhite, False);
  HandleFrame(NewHighBut, ClWhite, False);

  But1Img.Visible:=False;But2Img.Visible:=False;But3Img.Visible:=False;
  But4Img.Visible:=False;But5Img.Visible:=False;But6Img.Visible:=False;
  But7Img.Visible:=False;But8Img.Visible:=False;But9Img.Visible:=False;
  But10Img.Visible:=False;But11Img.Visible:=False;But12Img.Visible:=False;
  But13Img.Visible:=False;But14Img.Visible:=False;

  SelCvLab.Visible:=False;
  SelBkLab.Visible:=False;
  SelPsLab.Visible:=False;
  SelSndLab.Visible:=False;
  VHiLab.Visible:=False;
  S4pLab.Visible:=False;
  S12pLab.Visible:=False;
  S20pLab.Visible:=False;
  S48pLab.Visible:=False;
  HlpLab.Visible:=False;
  PcPlayLab.Visible:=False;
  WrLab.Visible:=False;
  LdLab.Visible:=False;
  RegLab.Visible:=False;

  RegPassEdit.Visible:=False;
  RegPassLabel.Visible:=False;
  RegNameEdit.Visible:=False;
  RegNameLabel.Visible:=False;
  EmailLab.Visible:=False;
  OrderBut.Visible:=False;
  RegBut.Visible:=False;
  WebBut.Visible:=False;
  OrderFormBut.Visible:=False;
  PlayerEdit.Visible:=False;
  PlayerLab.Visible:=False;
  NextLab.Visible:=False;
  PrevLab.Visible:=False;
  QuitLab.Visible:=False;

  ACloseChkBx.Visible:=False;
  ACloseDelayLab.Visible:=False;
  CloseDelaySpinEdit.Visible:=False;
  ShowHighChkBx.Visible:=False;
  DobbClickChkBx.Visible:=False;
  AcloseLab.Visible:=False;
  DobbClickLab.Visible:=False;
  ShowHighLab.Visible:=False;
  TrspGifChkBox.Visible:=False;
  GifTrspLab.Visible:=False;

  BgImg1.Visible:=False;BgImg2.Visible:=False;BgImg3.Visible:=False;
  CvImg1.Visible:=False;CvImg2.Visible:=False;CvImg3.Visible:=False;

  PsImg1.Visible:=False;PsImg2.Visible:=False;PsImg3.Visible:=False;
  PsImg4.Visible:=False;PsImg5.Visible:=False;PsImg6.Visible:=False;
  PsImg7.Visible:=False;PsImg8.Visible:=False;PsImg9.Visible:=False;
  PsImg10.Visible:=False;PsImg11.Visible:=False;PsImg12.Visible:=False;
  PsImg13.Visible:=False;PsImg14.Visible:=False;PsImg15.Visible:=False;
  PsImg16.Visible:=False;PsImg17.Visible:=False;PsImg18.Visible:=False;
  PsImg19.Visible:=False;PsImg20.Visible:=False;PsImg21.Visible:=False;
  PsImg22.Visible:=False;PsImg23.Visible:=False;PsImg24.Visible:=False;

  CustBut.Visible:=False;
  AcceptBut.Visible:=False;
  BiBut.Visible:=False;
  NoMatchBut.Visible:=False;
  MatchBut.Visible:=False;
  FinishedBut.Visible:=False;
  NewHighBut.Visible:=False;
  PcloseBut.Visible:=False;
  DoneBut.Visible:=False;
end;

procedure TComForm1.UpdateMenu;
begin
  But1Img.SetBounds(56, 48,215,30);
  But2Img.SetBounds(56, 88,215,30);
  But3Img.SetBounds(56,128,215,30);
  But13Img.SetBounds(56,168,215,30);
  But4Img.SetBounds(56,208,215,30);
  But5Img.SetBounds(56,248,215,30);
  But6Img.SetBounds(56,288,215,30);

  But7Img.SetBounds(328, 48,215,30);
  But8Img.SetBounds(328, 88,215,30);
  But9Img.SetBounds(328,128,215,30);
  But10Img.SetBounds(328,168,215,30);
  But11Img.SetBounds(328,208,215,30);
  But12Img.SetBounds(328,248,215,30);
  But14Img.SetBounds(328,288,215,30);

  S4pLab.Top:=54;S4pLab.Left:=86;
  S12pLab.Top:=94;S12pLab.Left:=82;
  S20pLab.Top:=134;S20pLab.Left:=82;
  S48pLab.Top:=174;S48pLab.Left:=82;
  SelCvLab.Top:=214;SelCvLab.Left:=86;
  SelPsLab.Top:=254;SelPsLab.Left:=88;
  SelBkLab.Top:=294;SelBkLab.Left:=60;

  SelSndLab.Top:=54;SelSndLab.Left:=348;
  PcPlayLab.Top:=94;PcPlayLab.Left:=374;
  WrLab.Top:=134;WrLab.Left:=368;
  LdLab.Top:=174;LdLab.Left:=356;
  VHiLab.Top:=214;VHiLab.Left:=376;
  RegLab.Top:=254;RegLab.Left:=404;
  HlpLab.Top:=294;HlpLab.Left:=419;

  But1Img.Visible:=True;But2Img.Visible:=True;But3Img.Visible:=True;
  But4Img.Visible:=True;But5Img.Visible:=True;But6Img.Visible:=True;
  But7Img.Visible:=True;But8Img.Visible:=True;But9Img.Visible:=True;
  But10Img.Visible:=True;But11Img.Visible:=True;But12Img.Visible:=True;
  But13Img.Visible:=True;But14Img.Visible:=True;

  SelCvLab.Visible:=True;
  SelBkLab.Visible:=True;
  SelPsLab.Visible:=True;
  SelSndLab.Visible:=True;
  VHiLab.Visible:=True;
  S4pLab.Visible:=True;
  S12pLab.Visible:=True;
  S20pLab.Visible:=True;
  S48pLab.Visible:=True;
  HlpLab.Visible:=True;
  PcPlayLab.Visible:=True;
  WrLab.Visible:=True;
  LdLab.Visible:=True;
  RegLab.Visible:=True;
  ACloseChkBx.Visible:=True;
  ACloseDelayLab.Visible:=True;
  CloseDelaySpinEdit.Visible:=True;
  ShowHighChkBx.Visible:=True;
  DobbClickChkBx.Visible:=True;
  AcloseLab.Visible:=True;
  DobbClickLab.Visible:=True;
  ShowHighLab.Visible:=True;
  TrspGifChkBox.Visible:=True;
  GifTrspLab.Visible:=True;
  DoneBut.Visible:=True;
  DoneBut.SetFocus;
end;

procedure TcomForm1.UpdateBgImg;
var n : integer;
begin
  n:=135;
  BgImg1.SetBounds(9,   n, 190, 140);
  BgImg2.SetBounds(205, n, 190, 140);  {L,  T ,  W ,  H }
  BgImg3.SetBounds(401, n, 190, 140);
  PsImgArray[0]:=BgImg1;
  PsImgArray[1]:=BgImg2;
  PsImgArray[2]:=BgImg3;
  for n:=0 to 2 do
  begin
    JpgImage:=TJPEGImage.Create;
    if not Form1.ExtBg[n] then   {Use built-in Bg image}
    begin
      Res:=TResourceStream.Create(Hinstance, 'Bg'+PChar(IntToStr(n+1)), 'JPEG');
      JpgImage.LoadFromStream(Res);
      Res.Free;
    end else JpgImage.LoadFromFile(Form1.ExtBgP[n]); {Use custum Bg image}

    Bitmap:=TBitmap.Create;
    Bitmap.Assign(JpgImage);
    With PsImgArray[n] do
    begin
     Canvas.StretchDraw(Rect(0,0,BgImg1.Width,BgImg1.Height), Bitmap);
    end;
    JpgImage.Free;
    Bitmap.Free;
    if Form1.BgSel[n] then HandleFrame(PsImgArray[n], ClYellow, True)
    else HandleFrame(PsImgArray[n], ClWhite, False)
  end;
  BgImg1.Visible:=True;
  BgImg2.Visible:=True;
  BgImg3.Visible:=True;
end;

procedure TcomForm1.UpdateCvImg;
var n : integer;
begin
  n:=130;
  CvImg1.SetBounds(48,  n, 150, 150);
  CvImg2.SetBounds(224, n, 150, 150);  {L,  T ,  W ,  H }
  CvImg3.SetBounds(400, n, 150, 150);
  PsImgArray[0]:=CvImg1;
  PsImgArray[1]:=CvImg2;
  PsImgArray[2]:=CvImg3;
  for n:=0 to 2 do
  begin
    JpgImage:=TJPEGImage.Create;
    if not Form1.ExtCv[n] then                     {Use built-in Cv image}
    begin
      Res:=TResourceStream.Create(Hinstance, 'Cv'+PChar(IntToStr(n+1)), 'JPEG');
      JpgImage.LoadFromStream(Res);
      Res.Free;
    end else JpgImage.LoadFromFile(Form1.ExtCvP[n]); {Use custum Cv image}
    Bitmap:=TBitmap.Create;
    Bitmap.Assign(JpgImage);
    With PsImgArray[n] do
    begin
     Canvas.StretchDraw(Rect(0,0,CvImg1.Width,CvImg1.Height), Bitmap);
    end;
    JpgImage.Free;
    Bitmap.Free;
    if Form1.CvSel[n] then HandleFrame(PsImgArray[n], ClYellow, True)
    else HandleFrame(PsImgArray[n], ClWhite, False)
  end;
  CvImg1.Visible:=True;
  CvImg2.Visible:=True;
  CvImg3.Visible:=True;
end;

procedure TComForm1.UpDatePsImg;
var     n : integer;
    IsGif : boolean;
begin
  n:=135;
  PsImg1.SetBounds( 80, n, 50, 50);  {L,  T ,  W ,  H }
  PsImg2.SetBounds(136, n, 50, 50);
  PsImg3.SetBounds(192, n, 50, 50);
  PsImg4.SetBounds(248, n, 50, 50);
  PsImg5.SetBounds(304, n, 50, 50);
  PsImg6.SetBounds(360, n, 50, 50);
  PsImg7.SetBounds(416, n, 50, 50);
  PsImg8.SetBounds(472, n, 50, 50);
  PsImg9.SetBounds(  80, n+56, 50, 50);
  PsImg10.SetBounds(136, n+56, 50, 50);
  PsImg11.SetBounds(192, n+56, 50, 50);
  PsImg12.SetBounds(248, n+56, 50, 50);
  PsImg13.SetBounds(304, n+56, 50, 50);
  PsImg14.SetBounds(360, n+56, 50, 50);
  PsImg15.SetBounds(416, n+56, 50, 50);
  PsImg16.SetBounds(472, n+56, 50, 50);
  PsImg17.SetBounds( 80, n+112, 50, 50);
  PsImg18.SetBounds(136, n+112, 50, 50);
  PsImg19.SetBounds(192, n+112, 50, 50);
  PsImg20.SetBounds(248, n+112, 50, 50);
  PsImg21.SetBounds(304, n+112, 50, 50);
  PsImg22.SetBounds(360, n+112, 50, 50);
  PsImg23.SetBounds(416, n+112, 50, 50);
  PsImg24.SetBounds(472, n+112, 50, 50);

  PsImgArray[0]:=PsImg1;PsImgArray[1]:=PsImg2;PsImgArray[2]:=PsImg3;PsImgArray[3]:=PsImg4;
  PsImgArray[4]:=PsImg5;PsImgArray[5]:=PsImg6;PsImgArray[6]:=PsImg7;PsImgArray[7]:=PsImg8;
  PsImgArray[8]:=PsImg9;PsImgArray[9]:=PsImg10;PsImgArray[10]:=PsImg11;PsImgArray[11]:=PsImg12;
  PsImgArray[12]:=PsImg13;PsImgArray[13]:=PsImg14;PsImgArray[14]:=PsImg15;PsImgArray[15]:=PsImg16;
  PsImgArray[16]:=PsImg17;PsImgArray[17]:=PsImg18;PsImgArray[18]:=PsImg19;PsImgArray[19]:=PsImg20;
  PsImgArray[20]:=PsImg21;PsImgArray[21]:=PsImg22;PsImgArray[22]:=PsImg23;PsImgArray[23]:=PsImg24;

  Exclude(GIFImageDefaultDrawOptions, goAnimate);

  for n:=0 to 23 do
  begin
    if (Form1.ExtPs[n]) and (UpperCase(ExtractFileExt(Form1.ExtPsP[n]))='.GIF') then
      IsGif:=True
    else
      IsGif:=False;

    if not IsGif then JpgImage:=TJPEGImage.Create;
    if not Form1.ExtPs[n] then   {Use built-in Ps image}
    begin
      Res:=TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(n+1)), 'JPEG');
      JpgImage.LoadFromStream(Res);
      Res.Free;
    end else
    begin
     if not IsGif then JpgImage.LoadFromFile(Form1.ExtPsP[n]) {Use custum Ps image}
     else begin
       GIFImg:=TGIFImage.Create;
       GIFImg.LoadFromFile(Form1.ExtPsP[n]);
     end;
    end;

    With PsImgArray[n] do
    begin
      if not IsGif then picture.assign(JpgImage) else picture.assign(GIFImg);
    end;

    if not IsGif then JpgImage.Free else GIFImg.Free;

    if Form1.PsSel[n] then HandleFrame(PsImgArray[n], ClYellow, True)
    else HandleFrame(PsImgArray[n], ClWhite, False)
  end;
  PsImg1.Visible:=True;PsImg2.Visible:=True;PsImg3.Visible:=True;
  PsImg4.Visible:=True;PsImg5.Visible:=True;PsImg6.Visible:=True;
  PsImg7.Visible:=True;PsImg8.Visible:=True;PsImg9.Visible:=True;
  PsImg10.Visible:=True;PsImg11.Visible:=True;PsImg12.Visible:=True;
  PsImg13.Visible:=True;PsImg14.Visible:=True;PsImg15.Visible:=True;
  PsImg16.Visible:=True;PsImg17.Visible:=True;PsImg18.Visible:=True;
  PsImg19.Visible:=True;PsImg20.Visible:=True;PsImg21.Visible:=True;
  PsImg22.Visible:=True;PsImg23.Visible:=True;PsImg24.Visible:=True;
end;

procedure TComForm1.UpDateSndImg;
var     n : integer;
    IsGif : boolean;
begin
  n:=170;
  PsImg1.SetBounds( 80, n, 50, 50);  {L,  T ,  W ,  H }
  PsImg2.SetBounds(136, n, 50, 50);
  PsImg3.SetBounds(192, n, 50, 50);
  PsImg4.SetBounds(248, n, 50, 50);
  PsImg5.SetBounds(304, n, 50, 50);
  PsImg6.SetBounds(360, n, 50, 50);
  PsImg7.SetBounds(416, n, 50, 50);
  PsImg8.SetBounds(472, n, 50, 50);
  PsImg9.SetBounds(  80, n+56, 50, 50);
  PsImg10.SetBounds(136, n+56, 50, 50);
  PsImg11.SetBounds(192, n+56, 50, 50);
  PsImg12.SetBounds(248, n+56, 50, 50);
  PsImg13.SetBounds(304, n+56, 50, 50);
  PsImg14.SetBounds(360, n+56, 50, 50);
  PsImg15.SetBounds(416, n+56, 50, 50);
  PsImg16.SetBounds(472, n+56, 50, 50);
  PsImg17.SetBounds( 80, n+112, 50, 50);
  PsImg18.SetBounds(136, n+112, 50, 50);
  PsImg19.SetBounds(192, n+112, 50, 50);
  PsImg20.SetBounds(248, n+112, 50, 50);
  PsImg21.SetBounds(304, n+112, 50, 50);
  PsImg22.SetBounds(360, n+112, 50, 50);
  PsImg23.SetBounds(416, n+112, 50, 50);
  PsImg24.SetBounds(472, n+112, 50, 50);

  PsImgArray[0]:=PsImg1;PsImgArray[1]:=PsImg2;PsImgArray[2]:=PsImg3;PsImgArray[3]:=PsImg4;
  PsImgArray[4]:=PsImg5;PsImgArray[5]:=PsImg6;PsImgArray[6]:=PsImg7;PsImgArray[7]:=PsImg8;
  PsImgArray[8]:=PsImg9;PsImgArray[9]:=PsImg10;PsImgArray[10]:=PsImg11;PsImgArray[11]:=PsImg12;
  PsImgArray[12]:=PsImg13;PsImgArray[13]:=PsImg14;PsImgArray[14]:=PsImg15;PsImgArray[15]:=PsImg16;
  PsImgArray[16]:=PsImg17;PsImgArray[17]:=PsImg18;PsImgArray[18]:=PsImg19;PsImgArray[19]:=PsImg20;
  PsImgArray[20]:=PsImg21;PsImgArray[21]:=PsImg22;PsImgArray[22]:=PsImg23;PsImgArray[23]:=PsImg24;

  Exclude(GIFImageDefaultDrawOptions, goAnimate);

  for n:=0 to 23 do
  begin
    if (Form1.ExtPs[n]) and (UpperCase(ExtractFileExt(Form1.ExtPsP[n]))='.GIF') then
      IsGif:=True
    else
      IsGif:=False;

    if not IsGif then JpgImage:=TJPEGImage.Create;
    if not Form1.ExtPs[n] then   {Use built-in Ps image}
    begin
      Res:=TResourceStream.Create(Hinstance, 'Image'+PChar(IntToStr(n+1)), 'JPEG');
      JpgImage.LoadFromStream(Res);
      Res.Free;
    end else
    begin
     if not IsGif then JpgImage.LoadFromFile(Form1.ExtPsP[n]) {Use custum Ps image}
     else begin
       GIFImg:=TGIFImage.Create;
       GIFImg.LoadFromFile(Form1.ExtPsP[n])
     end;
    end;

    With PsImgArray[n] do
    begin
      if not IsGif then picture.assign(JpgImage) else picture.assign(GIFImg);
    end;

    if IsGif then GIFImg.Free else JpgImage.Free;

    if Form1.SndSel[n] then HandleFrame(PsImgArray[n], ClBlue, True)
    else HandleFrame(PsImgArray[n], ClWhite, False)
  end;
  PsImg1.Visible:=True;PsImg2.Visible:=True;PsImg3.Visible:=True;
  PsImg4.Visible:=True;PsImg5.Visible:=True;PsImg6.Visible:=True;
  PsImg7.Visible:=True;PsImg8.Visible:=True;PsImg9.Visible:=True;
  PsImg10.Visible:=True;PsImg11.Visible:=True;PsImg12.Visible:=True;
  PsImg13.Visible:=True;PsImg14.Visible:=True;PsImg15.Visible:=True;
  PsImg16.Visible:=True;PsImg17.Visible:=True;PsImg18.Visible:=True;
  PsImg19.Visible:=True;PsImg20.Visible:=True;PsImg21.Visible:=True;
  PsImg22.Visible:=True;PsImg23.Visible:=True;PsImg24.Visible:=True;
  for n:=24 to 32 do
  begin
    if Form1.SndSel[n] then
    Case n of
     24: HandleFrame(PcloseBut, ClBlue, True);
     29: HandleFrame(NoMatchBut, ClBlue, True);
     30: HandleFrame(MatchBut, ClBlue, True);
     31: HandleFrame(FinishedBut, ClBlue, True);
     32: HandleFrame(NewHighBut, ClBlue, True);
    end else
    Case n of
     24: HandleFrame(PcloseBut, ClWhite, False);
     29: HandleFrame(NoMatchBut, ClWhite, False);
     30: HandleFrame(MatchBut, ClWhite, False);
     31: HandleFrame(FinishedBut, ClWhite, False);
     32: HandleFrame(NewHighBut, ClWhite, False);
    end;
  end;
end;

procedure TComForm1.ShowHigh;
var  Name, MinStr, SecStr, HourStr, DrawStr: string;
                   n, Hour, Min, Sec, Draws: integer;
begin
  With ComForm.Canvas do
  begin
    Pen.Color:=ClBlack ;
    brush.color := clBlack;
    brush.style := bsCross;
    RectAngle(0,0,600,434);
    brush.style := bsSolid;
    Ellipse(100, 20, 500, 420);

    Font.Name:='Times New Roman';
    Font.Height:=35;
    Font.Style:=[fsbold];
    SetBKmode(handle,TRANSPARENT);
    SetTextColor(handle, ClAqua);
    TextOut(165,5,IntToStr(Form1.NumPieces) + ' Pieces Highscore :');

    Font.Height:=25;
    Font.Style:=[fsunderline,fsbold];
    SetTextColor(handle, clRed);
    TextOut(150,85,'Player');
    Case Form1.NumPieces of
      4: TextOut(365,85,'Tries');
     12: TextOut(358,85,'Tries');
     20: TextOut(358,85,'Tries');
     48: TextOut(358,85,'Tries');
    end;
    TextOut(460,85,'Time');

    Font.Name:='Courier New';
    Font.Height:=25;
    Font.Style:=[fsbold]; {fsitalic}
    SetTextColor(handle,ClYellow);
    for n:=0 to 7 do
    begin
      Name:='....................';
      Hour:=23;
      Min:=59;
      Sec:=59;
      Draws:=999;
      Case Form1.NumPieces of
        4: begin
             Name:=Form1.Best4[n].Name;
             Hour:=Form1.Best4[n].Hour;
              Min:=Form1.Best4[n].Min;
              Sec:=Form1.Best4[n].Sec;
             Draws:=Form1.Best4[n].Draw;
           end;
       12: begin
             Name:=Form1.Best12[n].Name;
             Hour:=Form1.Best12[n].Hour;
              Min:=Form1.Best12[n].Min;
              Sec:=Form1.Best12[n].Sec;
             Draws:=Form1.Best12[n].Draw;
           end;
       20: begin
             Name:=Form1.Best20[n].Name;
             Hour:=Form1.Best20[n].Hour;
              Min:=Form1.Best20[n].Min;
              Sec:=Form1.Best20[n].Sec;
             Draws:=Form1.Best20[n].Draw;
           end;
       48: begin
             Name:=Form1.Best48[n].Name;
             Hour:=Form1.Best48[n].Hour;
              Min:=Form1.Best48[n].Min;
              Sec:=Form1.Best48[n].Sec;
             Draws:=Form1.Best48[n].Draw;
           end;
      end; {Case}
      HourStr:=''; MinStr:=''; SecStr:=''; DrawStr:='';
      if Hour<10 then HourStr:='0';
      HourStr:=HourStr+IntToStr(Hour);
      if Min<10 then MinStr:='0';
      MinStr:=MinStr+IntToStr(Min);
      if Sec<10 then SecStr:='0';
      SecStr:=SecStr+IntToStr(Sec);
      if Draws<10 then DrawStr:='  ';
      if (Draws>9) and (Draws<100) then DrawStr:=' ';
      DrawStr:=DrawStr+IntToStr(Draws);
      TextOut(35,125+n*23,IntToStr(n+1)+') '+Name+'  '+DrawStr+'   '+HourStr+':'+MinStr+':'+SecStr);
    end;{for}
  end;{With}
end;

procedure TComForm1.FormActivate(Sender: TObject);
var Px: integer;
begin
  ComForm.Picture.Bitmap:=ComFormBmp; {Redraw clean comform bitmap}
  SetBKmode(ComForm.canvas.handle,TRANSPARENT);
  HeadColor:=ClYellow;

  {Output text according to function}
  Case Form1.ComMenu of
   mhelp :
        begin {Help text}
        {Draw on transp. image}
         With ComForm.Canvas do
         begin
          Pen.Color:=ClBlack ;
          brush.color := clBlack;
          brush.style := bsCross;
          RectAngle(0,0,600,434);
          brush.style := bsSolid;
          Ellipse(100, 20, 500, 420);

          Font.Name:='Times New Roman';
          Font.Height:=30;
          Font.Style:=[fsbold];
          SetBKmode(handle,TRANSPARENT);
          SetTextColor(handle, HeadColor);
          TextOut(145,5,'Animated KidsMemo v'+Ver);

          Font.Name:='Arial';
          Font.Height:=19;
          Font.Style:=[];
          SetTextColor(handle,ClAqua);

{
          TextOut(15, 50,'Animated KidsMemo is a memory game where you try to match identical pairs');
          TextOut(15, 70,'of images by turning pieces. If the images match the two pieces disappear from');
          TextOut(15, 90,'the game. The goal is to remove all pieces in fewest possible draws. The game');
          TextOut(15,110,'can have 4, 12, 20 or 48 pieces. This along with various other user settings can');
          TextOut(15,130,'be set by clicking "Menu" in the bottom of the blue frame.');

          TextOut(15,160,'The pieces are turned by clicking on them. Two pieces must be turned in each');
          TextOut(15,180,'draw. If they dont match they must be turned back again by clicking the images.');
          TextOut(15,200,'If the "Auto Close On" feature is set the pieces will automatically turn back after');
          TextOut(15,220,'a delay. The delay can be adjusted by the "Auto Close Delay" feature in the');
          TextOut(15,240,'menu. When a game is finished click the background image to continue.');

          TextOut(15,270,'The best number of draws for the selected level is displayed in the top right');
          TextOut(15,290,'display and the current draws of the player in the top left display. The elapsed');
          TextOut(15,310,'time of a given play is displayed at the bottom. The total time and draws used');
          TextOut(15,330,'to finish a game is used to qualify for the highscore list. If the menu feature');
          TextOut(15,350,'"Promt for player name" is set the player will be prompted for a name before');
          TextOut(15,370,'entering the highscore. Otherwise the last know player name is used.');
}
          TextOut(15, 50,'Animated KidsMemo er et huskespil hvor du skal forsøge at finde identiske');
          TextOut(15, 70,'billeder ved at vende brikker to og to. Hvis billederne er ens forsvinder');
          TextOut(15, 90,'brikkerne fra spillet. Målet er så at fjerne alle brikkerne i færrest mulige træk.');
          TextOut(15,110,'Spillet kan have 4, 12, 20 eller 48 brikker. Dette samt adskillige andre bruger');
          TextOut(15,130,'indstillinger kan ændres ved at klikke på den røde "Menu" tekst.');

          TextOut(15,160,'Brikkerne vendes ved at man klikker på dem. Der skal vendes to brikker i');
          TextOut(15,180,'hvert træk. Hvis de valgte brikker ikke er ens skal de vendes tilbage ved at');
          TextOut(15,200,'klikke på dem igen. hvis "Vend automatisk" er valgt i menuen vil brikkerne');
          TextOut(15,220,'automatisk vende igen efter en kort pause. Når et spil er slut klikkes');
          TextOut(15,240,'med musen på baggrundsbilledet for at fortsætte.');

          TextOut(15,270,'På spillebrædtets øverste venstre tæller vises løbende spillerens antal træk og');
          TextOut(15,290,'til højre vises det hidtil færreste antal træk for samme antal brikker. Den brugte');
          TextOut(15,310,'tid på et spil vises løbende i bunden af spillebrædtet. Når et spil er afsluttet');
          TextOut(15,330,'bruges antal træk samt benyttet tid til at kvalificere spilleren til highscore');
          TextOut(15,350,'listen. Hvis punktet "Spørg om navn" er valgt kan spilleren indtaste et navn til');
          TextOut(15,370,'highscore listen - ellers benyttes navnet på den sidst kendte spiller.');

          Font.Name:='Arial';
          Font.Height:=14;
          Font.Style:=[];
          SetTextColor(handle,ClAqua);
          TextOut(270,420,'Page 1 of 3');

          NextLab.Visible:=True;
          PrevLab.Visible:=True;
          QuitLab.Visible:=True;
          Form1.LastHelp:=1;
         end; {with}
        end;

   mhelp2:
        begin {Help text}
        {Draw on transp. image}
         With ComForm.Canvas do
         begin
          Pen.Color:=ClBlack ;
          brush.color := clBlack;
          brush.style := bsCross;
          RectAngle(0,0,600,434);
          brush.style := bsSolid;
          Ellipse(100, 20, 500, 420);

          Font.Name:='Times New Roman';
          Font.Height:=30;
          Font.Style:=[fsbold];
          SetBKmode(handle,TRANSPARENT);
          SetTextColor(handle, HeadColor);
          TextOut(145,5,'Animated KidsMemo v'+Ver);

          Font.Name:='Arial';
          Font.Height:=19;
          Font.Style:=[];
          SetTextColor(handle,ClAqua);
{
          TextOut(15, 50,'The highscore can be viewed from the menu and cleared by pressing the');
          TextOut(15, 70,'<Backspace> key while viewing it.');

          TextOut(15,110,'If the "double click for menu" is selected, it takes a double click to enter the');
          TextOut(15,130,'menu as well as entering the help menus and closing the program. This option');
          TextOut(15,150,'is meant to prevent toddlers from accidentally entering these functions.');

          TextOut(15,190,'Clicking the "Computer Plays" button in the menu will start a new game played');
          TextOut(15,210,'by the computer. However this feature is recommended not to be used with');
          TextOut(15,230,'animated piece images because they take too long time to load and therefore');
          TextOut(15,250,'sometimes will be closed again before the animation is displayed.');

          TextOut(15,290,'To shift the image/sound setup click the "Load Setup from File" in the menu');
          TextOut(15,310,'and select any KidsMemo Setup (kms) file.  When loaded the game will use');
          TextOut(15,330,'the images, sounds and settings specified in that kms file. There are six kms');
          TextOut(15,350,'files included with Animated KidsMemo.');
}
          TextOut(15, 50,'Highscore listen kan til enhver tid ses via menu punktet "Se Highscore" og');
          TextOut(15, 70,'slettes ved at trykke <Backspace> imens den vises.');

          TextOut(15,110,'Hvis menu punktet "dobbeltklik for menu" er valgt skal der dobbeltklikkes');
          TextOut(15,130,'for at komme ind i menuen samt for at afslutte programmet. Dette er ret');
          TextOut(15,150,'hensigtsmæssigt når de helt små skal øve sig med musen.');

          TextOut(15,190,'Ved at vælge menu punktet "PC Automatisk" er det muligt at få computeren');
          TextOut(15,210,'til at spille alene. Computeren vil spille ved løbende at vælge to tilfældige');
          TextOut(15,230,'brikker indtil alle par er fundet. Spillet kan stoppes ved at trykke');
          TextOut(15,250,'på mellemrums tasten.');

          TextOut(15,290,'Nye billed/lyd temaer (setups) kan hentes ved at klikke på menu punktet');
          TextOut(15,310,'"Load Setup Fra Fil" og derefter hente en KidsMemo setup (.kms) fil. Efter');
          TextOut(15,330,'filen er hentet vil billeder og lyd fra .kms filen blive benyttet i spillet.');
          TextOut(15,350,'Der er otte billed/lyd setup filer inkluderet i Animated KidsMemo.');

          Font.Name:='Arial';
          Font.Height:=14;
          Font.Style:=[];
          SetTextColor(handle,ClAqua);
          TextOut(270,420,'Page 2 of 3');

          NextLab.Visible:=True;
          PrevLab.Visible:=True;
          QuitLab.Visible:=True;

          Form1.LastHelp:=2;
         end; {with}
        end;
   mhelp3 :
        begin {Help text}
        {Draw on transp. image}
         With ComForm.Canvas do
         begin
          Pen.Color:=ClBlack ;
          brush.color := clBlack;
          brush.style := bsCross;
          RectAngle(0,0,600,434);
          brush.style := bsSolid;
          Ellipse(100, 20, 500, 420);

          Font.Name:='Times New Roman';
          Font.Height:=30;
          Font.Style:=[fsbold];
          SetBKmode(handle,TRANSPARENT);
          SetTextColor(handle, HeadColor);
          TextOut(145,5,'Animated KidsMemo v'+Ver);

          Font.Name:='Arial';
          Font.Height:=19;
          Font.Style:=[];
          SetTextColor(handle,ClAqua);
{
          TextOut(15, 50,'Customization of Animated KidsMemo is done by loading new images and');
          TextOut(15, 70,'sounds instead of the built-ins. This is managed from the different select');
          TextOut(15, 90,'functions available in the menu. Each menu has a seperate help text which');
          TextOut(15,110,'explains how to select, deselect and load new images/sounds.');

          TextOut(15,140,'The last used setup is allways remembered by the computer without saving');
          TextOut(15,160,'it, but if you want to share or get back to a previous setup, it has to be');
          TextOut(15,180,'saved in a kms file by using the "Write Setup to File" feature in the menu.');

          TextOut(15,210,'Users of Animated KidsMemo is encouraged to make thier own setups which');
          TextOut(15,230,'could be family album pictures with matching voices or whatever the imagination');
          TextOut(15,250,'will come up with. If a custom setup could be of general interest please e-mail');
          TextOut(15,270,'me a copy and get a free registration. Remember that it IS possible to make');
          TextOut(15,290,'custom setups and kms files with an expired Animated KidsMemo.');

          TextOut(30,330,'Comments, suggestions and custom setups can be e-mailed to me at:');
}
          TextOut(15, 50,'Animated KidsMemo kan bruger defineres ved at benytte nye billeder og');
          TextOut(15, 70,'lyde fremfor de indbyggede. Dette udføres fra de forskellige "Vælg.."');
          TextOut(15, 90,'menu punkter der hver især har deres egen hjælpetekst der forklarer');
          TextOut(15,110,'hvordan man vælger, fravælger og henter nye billeder og lyde.');

          TextOut(15,140,'De sidst benyttede indstillinger huskes altid til næste gang programmet');
          TextOut(15,160,'startes men hvis man ønsker at dele et sæt indstillinger med en anden bruger');
          TextOut(15,180,'kan det gemmes i en .kms fil fra "Write Setup Til Fil" menu punktet.');

          TextOut(15,210,'Animated KidsMemo brugere opfordres til at lave deres egne temaer som f.eks.');
          TextOut(15,230,'billerder fra familie albumet med tilhørende stemmer eller hvad man nu');
          TextOut(15,250,'med lidt fantasi kan forestille sig. Hjemmelavede temaer af generel interesse');
          TextOut(15,270,'kan e-mailes til mig mod tilgengæld at få en gratis registrering. Det kræver');
          TextOut(15,290,'ikke en registreret version af programmet for at lave/gemme egne temaer.');

          TextOut(30,330,'Kommentare, forslag samt egne temaer kan e-mailes til mig på:');

          Font.Name:='Arial';
          Font.Height:=14;
          Font.Style:=[];
          SetTextColor(handle,ClAqua);
          TextOut(270,420,'Page 3 of 3');

          EmailLab.Top:=365;EmailLab.Left:=220;
          EmailLab.Visible:=True;

          NextLab.Visible:=True;
          PrevLab.Visible:=True;
          QuitLab.Visible:=True;

          Form1.LastHelp:=3;
         end; {with}
        end;

   mRegister :
       begin {Registration text}
         With ComForm.Canvas do
         begin
          Pen.Color:=ClBlack ;
          brush.color := clBlack;
          brush.style := bsCross;
          RectAngle(0,0,600,434);
          brush.style := bsSolid;
          Ellipse(100, 20, 500, 420);

          Font.Name:='Times New Roman';
          Font.Height:=30;
          Font.Style:=[fsbold];
          SetBKmode(handle,TRANSPARENT);
          SetTextColor(handle, HeadColor);
          TextOut(228,5,'Registration:');

          Font.Name:='Arial';
          Font.Height:=18;
          Font.Style:=[];
          SetTextColor(handle,ClAqua);

          TextOut(20,40,'If you find Animated KidsMemo fun playing you can register it for $10. When');
          TextOut(20,60,'registering you will receive an unlock code which prevents KidsMemo from expiring.');
          TextOut(20,80,'Use one of the following methods to register the program:');

          TextOut(120,130,'To order online and pay with your Credit Card.');
          TextOut(120,180,'To order by e-mail, post or fax and pay by Cash, Check or Card.');

          TextOut(20,220,'When receiving the registration information please enter the Registration Name');
          TextOut(20,240,'and Code in the respective boxes below and press the <Register> button.');
          TextOut(20,260,'');


          TextOut(160,350,'For further information about registering.');

          Font.Name:='Courier New';
          Font.Height:=18;
          SetTextColor(handle,ClRed);
          TextOut(20, 97,'________________________________________________________'); {56}
          TextOut(20,147,'________________________________________________________'); {56}
          TextOut(20,197,'________________________________________________________'); {56}
          TextOut(20,317,'________________________________________________________'); {56}
          TextOut(20,367,'________________________________________________________'); {56}

          Font.Name:='Arial';
          Font.Height:=20;
          SetTextColor(handle,ClLime);
          Case Ord(Form1.SLock1.Status) of
            0 : TextOut(25,400,'Status: Not Expired     ');
            1 : TextOut(25,400,'Status: Grace Period    ');
            2 : TextOut(25,400,'Status: Expired          ');
            3 : TextOut(25,400,'Status: Registered        ');
          end;
          Case Ord(Form1.SLock1.Status) of
            0 : TextOut(450,400,IntToStr(Form1.SLock1.TrialPeriod + Form1.SLock1.GracePeriod)+' Day(s) left');
            1 : TextOut(435,400,IntToStr(Form1.SLock1.GracePeriod)+' Day(s) left');
            2 : TextOut(485,400,IntToStr(Form1.SLock1.TrialPeriod)+' Day(s) left');
            3 : ;
          end;

         end; {with}

         OrderBut.Top:=128;OrderBut.Left:=20;OrderBut.Visible:=True;
         OrderBut.SetFocus;

         OrderFormBut.Top:=178;OrderFormBut.Left:=20;OrderFormBut.Visible:=True;
         WebBut.Left:=20;WebBut.Top:=348;WebBut.Visible:=True;

         RegNameEdit.Text:=Form1.SLock1.RegName;
         RegBut.Left:=440;RegBut.Top:=287;RegBut.Visible:=True;
         RegNameEdit.Left:=200;RegNameEdit.Top:=273;RegNameEdit.Visible:=True;
         RegPassEdit.Left:=200;RegPassEdit.Top:=302;RegPassEdit.Visible:=True;
         RegNameLabel.Left:=61;RegNameLabel.Top:=275;RegNameLabel.Visible:=True;
         RegPassLabel.Left:=64;RegPassLabel.Top:=304;RegPassLabel.Visible:=True;

         DoneBut.Visible:=True;

       end;

   mBackGround :
       begin {Bg image selection}
         With ComForm.Canvas do
         begin
          Font.Name:='Times New Roman';
          Font.Height:=25;
          Font.Style:=[fsbold];
          SetBKmode(handle,TRANSPARENT);
          SetTextColor(handle,HeadColor);
          TextOut(190,5,'Background Selection :');

          Font.Name:='Arial';
          Font.Height:=19;
          Font.Style:=[];
          SetTextColor(handle,ClAqua);

          TextOut(20, 50,'Select or deselect background images by clicking on the images. If multiple');
          TextOut(20, 70,'images are selected KidsMemo selects randomly from the selected images.');
          TextOut(20, 90,'If no images are selected a random selection from all three images is used');

          TextOut(20,300,'Custum images can be loaded in place of the built-in by right-clicking on the');
          TextOut(20,320,'images. The <Built-in> button will preset the images to the built-in set. Custum');
          TextOut(20,340,'background images can be JPEG images of any size (Native size is 627x470)');
         end; {with}

         AcceptBut.Top:=390;AcceptBut.Left:=320;
         AcceptBut.Visible:=True;
         AcceptBut.SetFocus;

         BiBut.Top:=390;BiBut.Left:=198;
         BiBut.Visible:=True;

         UpDateBgImg;
       end;

   mCover :
       begin {Cover image selection}
         ComForm.Canvas.Font.Name:='Times New Roman';
         ComForm.Canvas.Font.Height:=25;
         ComForm.Canvas.Font.Style:=[fsbold];
         SetTextColor(ComForm.canvas.handle,HeadColor);
         ComForm.Canvas.TextOut(220,5,'Cover Selection :');

         ComForm.Canvas.Font.Name:='Arial';
         ComForm.Canvas.Font.Height:=19;
         ComForm.Canvas.Font.Style:=[];
         SetTextColor(ComForm.canvas.handle,ClAqua);

         ComForm.Canvas.TextOut(20, 45,'Select or deselect cover images by clicking on the images below. If multiple');
         ComForm.Canvas.TextOut(20, 65,'images are selected KidsMemo selects randomly from the selected images.');
         ComForm.Canvas.TextOut(20, 85,'If no images are selected a random selection from all three images is used');

         ComForm.Canvas.TextOut(20,305,'Custum images can be loaded in place of the built-in by right-clicking on the');
         ComForm.Canvas.TextOut(20,325,'images. The <Built-in> button will preset the images to the built-in set. Custum');
         ComForm.Canvas.TextOut(20,345,'cover images can be JPEG images of any size (Native size is 150x150)');

         AcceptBut.Top:=390;AcceptBut.Left:=320;
         AcceptBut.Visible:=True;
         AcceptBut.SetFocus;
         BiBut.Top:=390;BiBut.Left:=198;
         BiBut.Visible:=True;

         UpDateCvImg;
       end;

   mPiece:
       begin {Piece image selection}
         ComForm.Canvas.Font.Name:='Times New Roman';
         ComForm.Canvas.Font.Height:=25;
         ComForm.Canvas.Font.Style:=[fsbold];
         SetTextColor(ComForm.canvas.handle,HeadColor);
         ComForm.Canvas.TextOut(225,5,'Piece Selection :');

         ComForm.Canvas.Font.Name:='Arial';
         ComForm.Canvas.Font.Height:=19;
         ComForm.Canvas.Font.Style:=[];
         SetTextColor(ComForm.canvas.handle,ClAqua);

         ComForm.Canvas.TextOut(20, 40,'Select or deselect piece images by clicking on the images. If the number of');
         ComForm.Canvas.TextOut(20, 60,'selected pieces exceed whats needed for a given game KidsMemo will select');
         ComForm.Canvas.TextOut(20, 80,'randomly from the selected images. If no images are selected a random');
         ComForm.Canvas.TextOut(20,100 ,'selection from all images is used. Up to 23 images can be selected.');

         ComForm.Canvas.TextOut(20,310,'Custum images can be loaded in place of the built-in by right-clicking on the');
         ComForm.Canvas.TextOut(20,330,'images. The <Built-in> button will preset the images to the built-in set. Custum');
         ComForm.Canvas.TextOut(20,350,'piece images can be Animated GIF, GIF or JPEG images of any size. An');
         ComForm.Canvas.TextOut(20,370,'animated GIF image will first show animation when used in the game.');


         AcceptBut.Top:=400;AcceptBut.Left:=320;
         AcceptBut.Visible:=True;
         AcceptBut.SetFocus;

         BiBut.Top:=400;BiBut.Left:=198;
         BiBut.Visible:=True;

         UpDatePsImg;
       end;

   mSound:
       begin {Sound selection}
         ComForm.Canvas.Font.Name:='Times New Roman';
         ComForm.Canvas.Font.Height:=25;
         ComForm.Canvas.Font.Style:=[fsbold];
         SetTextColor(ComForm.canvas.handle,HeadColor);
         ComForm.Canvas.TextOut(225,5,'Sound Selection :');

         ComForm.Canvas.Font.Name:='Arial';
         ComForm.Canvas.Font.Height:=19;
         ComForm.Canvas.Font.Style:=[];
         SetTextColor(ComForm.canvas.handle,ClAqua);

         ComForm.Canvas.TextOut(15, 40,'Load custum sound for each piece or event by right-clicking the corresponding');
         ComForm.Canvas.TextOut(15, 60,'piece image or event button. The <Built-in> button resets all sounds to the');
         ComForm.Canvas.TextOut(15, 80,'built-in sounds. To reset a single piece or event just click on it.');

         AcceptBut.Top:=390;AcceptBut.Left:=320;
         AcceptBut.Visible:=True;
         AcceptBut.SetFocus;

         BiBut.Top:=390;BiBut.Left:=198;
         BiBut.Visible:=True;

         Px:=73;

         NoMatchBut.Top:=125;NoMatchBut.Left:=Px; //120
         NoMatchBut.Visible:=True;
         MatchBut.Top:=125;MatchBut.Left:=Px+96; //216
         MatchBut.Visible:=True;
         FinishedBut.Top:=125;FinishedBut.Left:=Px+2*96; //312
         FinishedBut.Visible:=True;
         NewHighBut.Top:=125;NewHighBut.Left:=Px+3*96;  //408
         NewHighBut.Visible:=True;
         PcloseBut.Top:=125;PcloseBut.Left:=Px+4*96;
         PcloseBut.Visible:=True;

         UpDateSndImg;
       end;
   mWrite :
        begin {Help text}
        {Draw on transp. image}
         With ComForm.Canvas do
         begin
          Pen.Color:=ClBlack ;
          brush.color := clBlack;
          brush.style := bsCross;
          RectAngle(0,0,600,434);
          brush.style := bsSolid;
          Ellipse(100, 20, 500, 420);

          Font.Name:='Times New Roman';
          Font.Height:=30;
          Font.Style:=[fsbold];
          SetBKmode(handle,TRANSPARENT);
          SetTextColor(handle, HeadColor);
          TextOut(220,5,'Write Setup');

          Font.Name:='Arial';
          Font.Height:=19;
          Font.Style:=[];
          SetTextColor(handle,ClAqua);
          TextOut(15, 50,'Write setup will make a KidsMemo Setup (kms) file containing information about');
          TextOut(15, 70,'the current custum Background, Cover, Piece and Sound files used. The setup');
          TextOut(15, 90,'can be loaded at a later time with the <Load Setup from File> menu button.');
          TextOut(15,110,'If kms file is doubleclicked from Windows Explorer, Animated KidsMemo will');
          TextOut(15,130,'automatically start up with that setup activated.');

          TextOut(15,160,'If other users shall be able to use your custum setup, custum image and sound');
          TextOut(15,180,'files has to be placed in a sub-folder to the Animated KidsMemo directory');
          TextOut(15,200,'before they are selected in the program. In that way the kms file will only');
          TextOut(15,220,'contain relative path information about the custum files and they can be used');
          TextOut(15,240,'on different installations by distributing the sub-folder and the kms file.');

          TextOut( 15,270,'If you have made a good collection of custum images you can e-mail them to');
          TextOut(180,290,'. If they are selected to appear on the KidsMemo');
          TextOut( 15,310,'website - you will be granted one free registration from KidsMemo.');



          TextOut(150,360,'Click the DONE button to write setup file');

          EmailLab.Top:=290;EmailLab.Left:=15;
          EmailLab.Visible:=True;
          DoneBut.Visible:=True;
          DoneBut.SetFocus;
         end; {with}
        end;

   mMenu :
        begin {Menu text}
         ComForm.Canvas.Font.Name:='Times New Roman';
         ComForm.Canvas.Font.Height:=32;
         ComForm.Canvas.Font.Style:=[fsbold];
         SetTextColor(ComForm.canvas.handle, HeadColor);
         ComForm.Canvas.TextOut(130,5,'Animated KidsMemo Menu :');
         UpdateMenu;
       end;

    mHigh:{Display Top 8 HighScore}
           begin
             ShowHigh;
             DoneBut.Visible:=True;
             DoneBut.SetFocus;
            end;

 mNewHigh:{New player in Top 8 HighScore}
           begin
             ShowHigh;
             PlayerEdit.Visible:=True;
             PlayerLab.Visible:=True;
             ComForm1.ActiveControl:=PlayerEdit;
           end;

  end;{Case}
end;

procedure TComForm1.FormCreate(Sender: TObject);
// var TrnsBMP: TBitmap;
begin
  {Load CoolComForm picture bitmap from resource 'ComForm.jpg'}
  ComFormJpg:=TJPEGImage.Create;
  ComFormJpg.LoadFromStream(TResourceStream.Create(Hinstance, 'ComForm', 'JPEG'));
  ComFormBmp:=TBitmap.Create;
  ComFormBmp.Assign(ComFormJpg);
  ComFormJpg.Free;

  ComForm.LoadMaskFromRes(Hinstance, 'ComForm', 'MASK');

  {Load all white bmp to TrnspImg}
  TrnsBMP:=TBitmap.Create;
  TrnsBMP.LoadFromStream(TResourceStream.Create(Hinstance, 'Trnsp', 'BMP'));
  TrnspImg.Picture.Assign(TrnsBMP);
  Trnspimg.Transparent:=True;
  TrnsBMP.Free;
  CloseDelaySpinEdit.Value:=Form1.CloseDly;
end;

procedure TComForm1.CustSndSelect(SelNum : integer);
begin
  WavOpenDialog.Title:='Select any WAVE file';
  if Form1.SndSel[SelNum-1] then
  begin
    WavOpenDialog.InitialDir:=ExtractFilePath(Form1.ExtSnd[SelNum-1]);
    WavOpenDialog.FileName:=ExtractFileName(Form1.ExtSnd[SelNum-1]);
  end else WavOpenDialog.InitialDir:=Form1.LastSndPath;
  if WavOpenDialog.Execute then
  begin
    Form1.SndSel[SelNum-1]:=True;
    Form1.ExtSnd[SelNum-1]:=WavOpenDialog.FileName;
    Form1.PlaySound(WavOpenDialog.FileName, True);
    UpDateSndImg;
    Form1.LastSndPath:=ExtractFilePath(WavOpenDialog.FileName);
    JpgOpenDialog.FileName:='';
  end;
end;

procedure TComForm1.CustSndDeSelect(SelNum : integer);
begin
 Form1.SndSel[SelNum-1]:=False;
 Form1.ExtSnd[SelNum-1]:='';
 UpDateSndImg;
end;

procedure TComForm1.CustBgSelect(ImgNum : integer);
begin
  JpgOpenDialog.Title:='Select any JPEG image (627x470 if not to be scaled)';
  JpgOpenDialog.Filter := 'JPEG image files |*.jpg';
  if Form1.ExtBg[ImgNum-1] then
  begin
    JpgOpenDialog.InitialDir:=ExtractFilePath(Form1.ExtBgP[ImgNum-1]);
    JpgOpenDialog.FileName:=ExtractFileName(Form1.ExtBgP[ImgNum-1]);
  end else JpgOpenDialog.InitialDir:=Form1.LastBgPath;
  if JpgOpenDialog.Execute then
  begin
    Form1.ExtBgP[ImgNum-1]:=JpgOpenDialog.FileName;
    Form1.ExtBg[ImgNum-1]:=True;
    UpDateBgImg;
    Form1.LastBgPath:=ExtractFilePath(JpgOpenDialog.FileName);
    JpgOpenDialog.FileName:='';
  end;
end;

procedure TComForm1.CustCvSelect(ImgNum : integer);
begin
  JpgOpenDialog.Title:='Select any JPEG image (Buit-in images is 150x150)';
  JpgOpenDialog.Filter := 'JPEG image files |*.jpg';
  if Form1.ExtCv[ImgNum-1] then
  begin
    JpgOpenDialog.InitialDir:=ExtractFilePath(Form1.ExtCvP[ImgNum-1]);
    JpgOpenDialog.FileName:=ExtractFileName(Form1.ExtCvP[ImgNum-1]);
  end else JpgOpenDialog.InitialDir:=Form1.LastCvPath;
  if JpgOpenDialog.Execute then
  begin
    Form1.ExtCvP[ImgNum-1]:=JpgOpenDialog.FileName;
    Form1.ExtCv[ImgNum-1]:=True;
    UpDateCvImg;
    Form1.LastCvPath:=ExtractFilePath(JpgOpenDialog.FileName);
    JpgOpenDialog.FileName:='';
  end;
end;

procedure TComForm1.CustPsSelect(ImgNum : integer);
begin
  Exclude(GIFImageDefaultDrawOptions, goDirectDraw);
//  Include(GIFImageDefaultDrawOptions, goAnimate);
  JpgOpenDialog.Title:='Select any JPEG or GIF image (Buit-in images is 150x150)';
  JpgOpenDialog.Filter := 'JPEG or GIF image files |*.gif;*.jpg';

  if Form1.ExtPs[ImgNum-1] then
  begin
    JpgOpenDialog.InitialDir:=ExtractFilePath(Form1.ExtPsP[ImgNum-1]);
    JpgOpenDialog.FileName:=ExtractFileName(Form1.ExtPsP[ImgNum-1]);
  end else JpgOpenDialog.InitialDir:=Form1.LastPsPath;
  if JpgOpenDialog.Execute then
  begin
    Form1.ExtPsP[ImgNum-1]:=JpgOpenDialog.FileName;
    Form1.ExtPs[ImgNum-1]:=True;
    UpDatePsImg;
    Form1.LastPsPath:=ExtractFilePath(JpgOpenDialog.FileName);
    JpgOpenDialog.FileName:='';
  end;
end;

procedure TComForm1.BgImgSelect(ImageNum: integer);
begin
  Form1.BgSel[ImageNum-1]:=not Form1.BgSel[ImageNum-1];
  if Form1.BgSel[ImageNum-1] then
  begin
    HandleFrame(PsImgArray[ImageNum-1], ClYellow, True);
    Form1.Snd(sSelect);
  end else
  begin
    HandleFrame(PsImgArray[ImageNum-1], ClWhite, False);
    Form1.Snd(sDeSelect);
  end;
end;

procedure TComForm1.CvImgSelect(ImageNum: integer);
begin
  Form1.CvSel[ImageNum-1]:=not Form1.CvSel[ImageNum-1];
  if Form1.CvSel[ImageNum-1] then
  begin
    HandleFrame(PsImgArray[ImageNum-1], ClYellow, True);
    Form1.Snd(sSelect);
  end else
  begin
    HandleFrame(PsImgArray[ImageNum-1], ClWhite, False);
    Form1.Snd(sDeSelect);
  end;
end;

procedure TComForm1.PsImgSelect(ImageNum: integer);
var  n, FrameOnPos: integer;
           FrameOn: boolean;
begin
  {Make sure there is no legal image numbers in array if none selected}
  if (Form1.NumPsSel=0) then for n:=0 to 22 do Form1.PieceArray[n]:=255; {0..9}
  FrameOn:=False;
  {See if piece allready selected}
  for n:=1 to Form1.NumPsSel do
  begin
    if Form1.PieceArray[n-1]=ImageNum then
    begin
     Form1.PsSel[ImageNum-1]:=False;{Update position in PsSel to deselected}
     FrameOn:=True; {Frame is allready selected}
     FrameOnPos:=n-1; {FrameOnPos holds index for piece to unselect}
    end;
  end;

  If FrameOn=true then
  begin
    if Form1.NumPsSel<23 then    {10}
    begin
      for n:=FrameOnPos+1 to Form1.NumPsSel do
        Form1.PieceArray[n-1]:=Form1.PieceArray[n]; {Shift one left}
    end;
    Dec(Form1.NumPsSel);
    {Remove frame of selected image}
    HandleFrame(PsImgArray[ImageNum-1], ClWhite, False);
    Form1.Snd(sDeSelect);
  end else
  begin
    if Form1.NumPsSel=23 then  {10}
    begin
      {Remove frame of first image in pieceArray}
      HandleFrame(PsImgArray[Form1.PieceArray[0]-1], ClWhite, False);
      Form1.PsSel[Form1.PieceArray[0]-1]:=False;{Update PsSel to reflect the unselected piece}
      for n:=1 to Form1.NumPsSel do
        Form1.PieceArray[n-1]:=Form1.PieceArray[n]; {Shift one left}
    end;
    {Draw frame arround selected image}
    HandleFrame(PsImgArray[ImageNum-1], ClYellow, True);
    Form1.Snd(sSelect);
    Form1.PsSel[ImageNum-1]:=True; {Update position in PsSel to selected}

    if Form1.NumPsSel<23 then Inc(Form1.NumPsSel); {10}
    Form1.PieceArray[Form1.NumPsSel-1]:=ImageNum;
  end;
end;

procedure TComForm1.BiButClick(Sender: TObject);
var n: integer;
begin
 {Reset to use only built in Bg/Cv images}
 Case Form1.ComMenu of
   mBackGround:
         begin
           Form1.BgImageNum:=1;
           {Default BackGround image settings}
           for n:=0 to 2 do
           begin
             Form1.BgSel[n]:=False;    {No builtin Bg images selected}
             Form1.ExtBg[n]:=False;    {No custum Bg images selected}
             Form1.ExtBgP[n]:='';      {No path's defined for custum Bg images}
           end;
           UpDateBgImg;
         end;

   mCover:
         begin
           Form1.CvImageNum:=1;
           {Default Cover image settings}
           for n:=0 to 2 do
           begin
             Form1.CvSel[n]:=False;    {No builtin Cv images selected}
             Form1.ExtCv[n]:=False;    {No custum Cv images selected}
             Form1.ExtCvP[n]:='';      {No path's defined for custum Cv images}
           end;
           UpDateCvImg;
         end;
   mPiece:
         begin
           Form1.NumPsSel:=0;       {No selected pieces}
           for n:=0 to 23 do
           begin
             Form1.PsSel[n]:=False; {No selected pieces}
             Form1.ExtPs[n]:=False; {No custum pieces}
             Form1.ExtPsP[n]:='';   {No path's defined for custum Ps images}
           end;
           UpDatePsImg;
         end;
   mSound:
         begin
           for n:=0 to 32 do
           begin
             Form1.SndSel[n]:=False; {No external sounds selected}
             Form1.ExtSnd[n]:='';    {External sound path's empty}
           end;
           UpDateSndImg;
         end;
 end; {Case}
end;

procedure TComForm1.RegButClick(Sender: TObject);
begin
 if (Length(RegNameEdit.Text)>0) and (Length(RegPassEdit.Text)>0) then
 begin
   Form1.SLock1.RegName := RegNameEdit.Text;
   Form1.SLock1.RegisterNow(RegPassEdit.Text);
   Form1.Slock1.CheckProtection;
   Case Ord(Form1.SLock1.Status) of
     0 : ComForm.Canvas.TextOut(420,330,'Status: Not Expired  ');
     1 : ComForm.Canvas.TextOut(420,330,'Status: Expired          ');
     2 : ComForm.Canvas.TextOut(420,330,'Status: In Grace Period');
     3 : begin
           ComForm.Canvas.TextOut(420,330,'Status: Registered        ');
           HideAll;
           ModalResult:=mrOK;
         end;
   end;
 end;
end;

procedure TComForm1.CvImg1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Case Button of
    mbLeft  : CvImgSelect(1);
    mbRight : CustCvSelect(1);
  end;
end;

procedure TComForm1.CvImg2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Case Button of
    mbLeft  : CvImgSelect(2);
    mbRight : CustCvSelect(2);
  end;
end;

procedure TComForm1.CvImg3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Case Button of
    mbLeft  : CvImgSelect(3);
    mbRight : CustCvSelect(3);
  end;
end;

procedure TComForm1.BgImg1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Case Button of
    mbLeft  : BgImgSelect(1);
    mbRight : CustBgSelect(1);
  end;
end;

procedure TComForm1.BgImg2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Case Button of
    mbLeft  : BgImgSelect(2);
    mbRight : CustBgSelect(2);
  end;
end;

procedure TComForm1.BgImg3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Case Button of
    mbLeft  : BgImgSelect(3);
    mbRight : CustBgSelect(3);
  end;
end;

procedure TComForm1.SndAndPsSelect(Num: integer; Button: TMouseButton);
begin
  if Form1.ComMenu=mSound then
  Case Button of
    mbLeft  : CustSndDeselect(Num);
    mbRight : CustSndSelect(Num);
  end else
  Case Button of
    mbLeft  : PsImgSelect(Num);
    mbRight : CustPsSelect(Num);
  end;
end;

procedure TComForm1.PsImg1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(1, Button);
end;

procedure TComForm1.PsImg2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(2, Button);
end;

procedure TComForm1.PsImg3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(3, Button);
end;

procedure TComForm1.PsImg4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(4, Button);
end;

procedure TComForm1.PsImg5MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(5, Button);
end;

procedure TComForm1.PsImg6MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(6, Button);
end;

procedure TComForm1.PsImg7MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(7, Button);
end;

procedure TComForm1.PsImg8MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(8, Button);
end;

procedure TComForm1.PsImg9MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(9, Button);
end;

procedure TComForm1.PsImg10MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(10, Button);
end;

procedure TComForm1.PsImg11MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(11, Button);
end;

procedure TComForm1.PsImg12MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(12, Button);
end;

procedure TComForm1.PsImg13MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(13, Button);
end;

procedure TComForm1.PsImg14MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(14, Button);
end;

procedure TComForm1.PsImg15MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(15, Button);
end;

procedure TComForm1.PsImg16MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(16, Button);
end;

procedure TComForm1.PsImg17MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(17, Button);
end;

procedure TComForm1.PsImg18MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(18, Button);
end;

procedure TComForm1.PsImg19MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(19, Button);
end;

procedure TComForm1.PsImg20MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(20, Button);
end;

procedure TComForm1.PsImg21MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(21, Button);
end;

procedure TComForm1.PsImg22MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(22, Button);
end;

procedure TComForm1.PsImg23MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(23, Button);
end;

procedure TComForm1.PsImg24MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(24, Button);
end;

procedure TComForm1.PcloseButMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(Ord(sClose)+1, Button);
end;

procedure TComForm1.NoMatchButMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(Ord(sWrong)+1, Button);
end;

procedure TComForm1.MatchButMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(Ord(sMatch)+1, Button);
end;

procedure TComForm1.FinishedButMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(Ord(sFinish)+1, Button);
end;

procedure TComForm1.NewHighButMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SndAndPsSelect(Ord(sHigh)+1, Button);
end;

procedure TComForm1.But1ImgClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 2; {Start 4 piece game}
end;

procedure TComForm1.S4pLabClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 2; {Start 4 piece game}
end;

procedure TComForm1.But2ImgClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 3; {Start 12 piece game}
end;

procedure TComForm1.S12pLabClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 3; {Start 12 piece game}
end;

procedure TComForm1.But3ImgClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 4; {Start 20 piece game}
end;

procedure TComForm1.S20pLabClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 4; {Start 20 piece game}
end;

procedure TComForm1.S48pLabClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 48; {Start 48 piece game}
end;

procedure TComForm1.But13ImgClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 48; {Start 48 piece game}
end;

procedure TComForm1.HlpLabClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 50; {Help}
end;

procedure TComForm1.But14ImgClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 50; {Help}
end;

procedure TComForm1.But4ImgClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 5; {Select Cover Images}
end;

procedure TComForm1.SelCvLabClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 5; {Select Cover Images}
end;

procedure TComForm1.But5ImgClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 6; {Select Piece Images}
end;

procedure TComForm1.SelPsLabClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 6; {Select Piece Images}
end;

procedure TComForm1.But6ImgClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 7; {Select Bg Images}
end;

procedure TComForm1.SelBkLabClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 7; {Select Bg Images}
end;

procedure TComForm1.But7ImgClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 8; {Select Custum Sound}
end;

procedure TComForm1.SelSndLabClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 8; {Select Custum Sound}
end;

procedure TComForm1.But8ImgClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 9; {Computer Plays}
end;

procedure TComForm1.PcPlayLabClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 9; {Computer Plays}
end;

procedure TComForm1.But9ImgClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 10; {Write Setup}
end;

procedure TComForm1.WrLabClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 10; {Write Setup}
end;

procedure TComForm1.But10ImgClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 11; {Load Setup}
end;

procedure TComForm1.LdLabClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 11; {Load Setup}
end;

procedure TComForm1.But11ImgClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 12; {View HighScore}
end;

procedure TComForm1.VHiLabClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 12; {View HighScore}
end;

procedure TComForm1.But12ImgClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 13; {Register}
end;

procedure TComForm1.RegLabClick(Sender: TObject);
begin
  HideAll;
  ModalResult := 13; {Register}
end;

procedure TComForm1.PlayerEditKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    HideAll;
//    ModalResult:=mrOK;
    ModalResult:=14;
  end;
end;

procedure TComForm1.PlayerEditDblClick(Sender: TObject);
begin
    HideAll;
    ModalResult:=14;
end;

procedure TComForm1.DoneButClick(Sender: TObject);
begin
  HideAll;
//  ModalResult:=mrOK;
  ModalResult:=15;
end;

procedure TComForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
//   ShowMessage('Key pressed = '+ UpCase(key));

   Case UpCase(key) of
    #27 : begin {Esc}
            HideAll;
            ModalResult := 15;
          end;
     #8 : begin {Backspace}
            HideAll;
            ModalResult := 22;
          end;

   end;
end;

procedure TComForm1.QuitLabClick(Sender: TObject);
begin
  HideAll;
  ModalResult:=15;
end;

procedure TComForm1.PrevLabClick(Sender: TObject);
begin
  HideAll;
  Case Form1.ComMenu of
   mhelp: ModalResult:=16;
   mhelp2: ModalResult:=17;
   mhelp3: ModalResult:=18;
  end;
end;

procedure TComForm1.NextLabClick(Sender: TObject);
begin
  HideAll;
  Case Form1.ComMenu of
   mhelp: ModalResult:=19;
   mhelp2: ModalResult:=20;
   mhelp3: ModalResult:=21;
  end;
end;

procedure TComForm1.AcceptButClick(Sender: TObject);
begin
  HideAll;
  ModalResult := mrOK;
end;

procedure TComForm1.ACloseChkBxClick(Sender: TObject);
begin
 Form1.AutoClose:=ACloseChkBx.Checked;
 if Form1.AutoClose then
 begin
   Form1.Snd(sAutoOn);
   Form1.Wait(500);
 end else
 begin
   Form1.Snd(sAutoOff);
   Form1.Wait(500);
 end;
end;

procedure TComForm1.TrspGifChkBoxClick(Sender: TObject);
begin
 Form1.TrspGIF:=TrspGifChkBox.Checked;
 if Form1.TrspGIF then
 begin
   Form1.Snd(sAutoOn);
   Form1.Wait(500);
 end else
 begin
   Form1.Snd(sAutoOff);
   Form1.Wait(500);
 end;
end;

procedure TComForm1.ShowHighChkBxClick(Sender: TObject);
begin
 Form1.ShowHigh:=ShowHighChkBx.Checked;
 if Form1.ShowHigh then
 begin
   Form1.Snd(sAutoOn);
   Form1.Wait(500);
 end else
 begin
   Form1.Snd(sAutoOff);
   Form1.Wait(500);
 end;
end;

procedure TComForm1.DobbClickChkBxClick(Sender: TObject);
begin
 Form1.DobbClick:=DobbClickChkBx.Checked;
 if Form1.DobbClick then
 begin
   Form1.Snd(sAutoOn);
   Form1.Wait(500);
 end else
 begin
   Form1.Snd(sAutoOff);
   Form1.Wait(500);
 end;
end;

procedure TComForm1.WebButClick(Sender: TObject);
begin
  ShellExecute(GetDesktopWindow(), nil, PChar('http://home.worldonline.dk/~jbb/KidsMemo/'), nil, nil, SW_SHOWNORMAL);
end;

procedure TComForm1.EmailLabClick(Sender: TObject);
begin
  ShellExecute(GetDesktopWindow(), nil, PChar('mailto:KidsMemo@Kagi.com'), nil, nil, SW_SHOWNORMAL);
end;

procedure TComForm1.OrderButClick(Sender: TObject);
begin
  ShellExecute(GetDesktopWindow(), nil, PChar('http://order.kagi.com/cgi-bin/r1.cgi?ERY&'), nil, nil, SW_SHOWNORMAL);
end;

procedure TComForm1.ClrHigh;
var n: integer;
begin
  for n:=0 to 7 do
  begin
    with Form1.Best4[n] do
    begin
      Name:='....................';
      Hour:=23;
       Min:=59;
       Sec:=59;
      Draw:=999;
    end;
    with Form1.Best12[n] do
    begin
      Name:='....................';
      Hour:=23;
       Min:=59;
       Sec:=59;
      Draw:=999;
    end;
    with Form1.Best20[n] do
    begin
      Name:='....................';
      Hour:=23;
       Min:=59;
       Sec:=59;
      Draw:=999;
    end;
  end;
end;

procedure TComForm1.ExtractRegister;
var Res:TResourceStream;
begin
  Res:=TResourceStream.Create( hInstance,'RegExe',pChar('PROG'));
  Res.SaveToFile(Form1.KidsMemoPath+'Register.exe');
  Res:=TResourceStream.Create( hInstance,'RegHelp',pChar('HELP'));
  Res.SaveToFile(Form1.KidsMemoPath+'Register.hlp');
  Res.Free;
end;

procedure TComForm1.OrderFormButClick(Sender: TObject);
begin
  ExtractRegister;
  WinExec(PChar(Form1.KidsMemoPath+'Register.exe'), SW_SHOWNORMAL);
end;

procedure TComForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PsImg1.Picture.Graphic:= nil;
  PsImg2.Picture.Graphic:= nil;
  PsImg4.Picture.Graphic:= nil;
  PsImg5.Picture.Graphic:= nil;
  PsImg6.Picture.Graphic:= nil;
  PsImg3.Picture.Graphic:= nil;
  PsImg7.Picture.Graphic:= nil;
  PsImg8.Picture.Graphic:= nil;
  PsImg9.Picture.Graphic:= nil;
  PsImg10.Picture.Graphic:= nil;
  PsImg11.Picture.Graphic:= nil;
  PsImg12.Picture.Graphic:= nil;
  PsImg13.Picture.Graphic:= nil;
  PsImg14.Picture.Graphic:= nil;
  PsImg15.Picture.Graphic:= nil;
  PsImg16.Picture.Graphic:= nil;
  PsImg17.Picture.Graphic:= nil;
  PsImg18.Picture.Graphic:= nil;
  PsImg19.Picture.Graphic:= nil;
  PsImg20.Picture.Graphic:= nil;
  PsImg21.Picture.Graphic:= nil;
  PsImg22.Picture.Graphic:= nil;
  PsImg23.Picture.Graphic:= nil;
  PsImg24.Picture.Graphic:= nil;
end;

procedure TComForm1.CloseDelaySpinEditChange(Sender: TObject);
begin
 with CloseDelaySpinEdit do
 begin
   if (Value>=MinValue) and (Value<=MaxValue) then
     Form1.CloseDly:=CloseDelaySpinEdit.Value;
 end;
end;

end.




