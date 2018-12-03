program AnimatedKidsMemo;

uses
  Forms,
  MemoUnit in 'MemoUnit.pas' {Form1},
  ComForms in 'ComForms.pas' {ComForm1};

{$R Bitmaps.RES Bitmaps.RC}
{$R wave.RES wave.RC}
{$R Register.RES Register.RC}
{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Animated KidsMemo';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TComForm1, ComForm1);
  Application.Run;
end.
