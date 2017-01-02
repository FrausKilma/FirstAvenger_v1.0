program PFirstAvenger;

uses
  Forms,
  UActions in 'UActions.pas' {FAction},
  UFirstAvenger in 'UFirstAvenger.pas' {FMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
