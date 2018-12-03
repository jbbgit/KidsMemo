program KmKeyGen;

uses
  Forms,
  KmUnlock in 'KmUnlock.pas' {frmCreateUnlock};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'KmKeyGen - Create unlock code for KidsMemo V1.00';
  Application.CreateForm(TfrmCreateUnlock, frmCreateUnlock);
  Application.Run;
end.
