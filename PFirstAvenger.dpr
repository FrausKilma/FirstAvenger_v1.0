program PFirstAvenger;

uses
  Forms,
  UActions in 'UActions.pas' {FAction},
  UFirstAvenger in 'UFirstAvenger.pas' {FMain},
  UIMG in 'UIMG.pas' {FIMG},
  PortUnit in 'PortUnit.pas',
  USetting in 'USetting.pas' {FrmSettings};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Avengers';
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
