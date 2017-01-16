unit USetting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmSettings = class(TForm)
    Btn1: TButton;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure Btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSettings: TFrmSettings;

implementation
 uses  UFirstAvenger;
{$R *.dfm}

procedure TFrmSettings.Btn1Click(Sender: TObject);
begin
  FMain.ComPort1.ShowSetupDialog;

end;

end.
