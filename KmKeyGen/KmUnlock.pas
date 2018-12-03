unit KmUnlock;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Slock, Spin, ExtCtrls, ShellApi;

type
  TfrmCreateUnlock = class(TForm)
    grpUnlockCode: TGroupBox;
    edtRegName: TEdit;
    lblChallenge: TLabel;
    GroupBox1: TGroupBox;
    lblUnlock: TLabel;
    edtUnlock: TEdit;
    grpUnlockType: TGroupBox;
    rdbRegister: TRadioButton;
    rdbExtend: TRadioButton;
    speExtension: TSpinEdit;
    pnlButtons: TPanel;
    btnClose: TButton;
    Memo1: TMemo;
    GetTextBut: TButton;
    PrepMailBut: TButton;
    procedure rdbExtendClick(Sender: TObject);
    procedure rdbRegisterClick(Sender: TObject);
    procedure edtRegNameChange(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure GetTextButClick(Sender: TObject);
    procedure PrepMailButClick(Sender: TObject);
  private
    procedure CalculateUnlock;
  end;

var
  frmCreateUnlock: TfrmCreateUnlock;
  EmailStr, RegNameStr: string;

implementation

uses
     SlokUtil;
{$R *.DFM}

{*******************************************************************************
* Procedure : rdbExtendClick                                                   *
********************************************************************************
* Purpose   : Sets the 'unlock mode' radio button to extend mode               *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TfrmCreateUnlock.rdbExtendClick(Sender: TObject);
begin
     // set the mode
     speExtension.Enabled := True;

     // recalculate the unlock code based on the new mode
     edtRegNameChange(Self);
end; {rdbExtendClick}

{*******************************************************************************
* Procedure : rdbRegisterClick                                                 *
********************************************************************************
* Purpose   : Sets the 'unlock mode' radio button to register mode             *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TfrmCreateUnlock.rdbRegisterClick(Sender: TObject);
begin
     // set the mode
     speExtension.Enabled := False;

     // recalculate the unlock code based on the new mode
     edtRegNameChange(Self);
end; {rdbRegisterClick}

{*******************************************************************************
* Procedure : edtRegNameChange                                               *
********************************************************************************
* Purpose   : Calculates the unlock string when the challenge info changes     *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TfrmCreateUnlock.edtRegNameChange(Sender: TObject);
begin
  // calculate the unlock string from the challenge string
  CalculateUnlock;

end; {edtRegNameChange}

{*******************************************************************************
* Procedure : CalculateUnlock                                                  *
********************************************************************************
* Purpose   : Calculates the unlock string based on the challenge string, the  *
*             Application Private Key and the extension value and mode         *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TfrmCreateUnlock.CalculateUnlock;
var PrivateKey, ChallengeString: string;
begin
  {Get ChallengeString from KidsMemo V1.00 privateKey + Registration Name}
  PrivateKey:=#212+#199+#150+#164+#250+#130;
  ChallengeString := GetChallenge(PrivateKey+edtRegName.Text, 0);
  if rdbExtend.Checked then
  begin
    // we are creating an extension code
    edtUnlock.Text := GetUnlockString(ChallengeString, PrivateKey, speExtension.Value);
  end;
  if rdbRegister.Checked then
  begin
    // we are creating a registration code
    edtUnlock.Text := GetUnlockString(ChallengeString, PrivateKey, 0);
  end;
end; {CalculateUnlock}

{*******************************************************************************
* Procedure : btnCloseClick                                                    *
********************************************************************************
* Purpose   : Closes the SUnlock application                                   *
********************************************************************************
* Paramters : None                                                             *
********************************************************************************
* Returns   : None                                                             *
*******************************************************************************}
procedure TfrmCreateUnlock.btnCloseClick(Sender: TObject);
begin
     Close;
end; {btnCloseClick}

procedure TfrmCreateUnlock.GetTextButClick(Sender: TObject);
var sp: integer;
begin
 Memo1.Clear;
 Memo1.PasteFromClipboard;
 RegNameStr:=Memo1.Lines[0];
 RegNameStr:=Copy(RegNameStr,16,Length(RegNameStr)-15);
 EdtRegName.Text:=RegNameStr;
 EmailStr:=Memo1.Lines[1];
 EmailStr:=Copy(EmailStr,8,Length(EmailStr)-7);
 repeat
   sp:=pos(' ',RegNameStr);
   if sp<>0 then
   begin
     delete(RegNameStr,sp,1);
     insert('%20',RegNameStr,sp);
   end;
 until sp=0;
end;

procedure TfrmCreateUnlock.PrepMailButClick(Sender: TObject);
var  UrlStr: string;
begin
  Memo1.Clear;
  Memo1.Lines.LoadFromFile('RegBody.txt');
  Memo1.Lines[5]:=Memo1.Lines[5]+EdtRegName.Text;
  Memo1.Lines[6]:=Memo1.Lines[6]+EdtUnlock.Text;
  Memo1.SelectAll;
  Memo1.CopyToClipboard;
  UrlStr:=EmailStr+'?subject=KidsMemo%20Registration&cc=KidsMemo@Kagi.com';
  UrlStr:=UrlStr+'&body='+RegNameStr+',';
  ShellExecute(GetDesktopWindow(), nil,PChar('mailto:'+UrlStr), nil, nil, SW_SHOWNORMAL);
end;

end.

