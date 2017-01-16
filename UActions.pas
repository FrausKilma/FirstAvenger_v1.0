unit UActions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFirstAvenger, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, StdCtrls, Buttons,
  cxImage, cxDBEdit, cxTextEdit, cxMaskEdit, cxSpinEdit, Mask, DBCtrls, DB, IBCustomDataSet, IBQuery, ExtDlgs, ExtCtrls,
  cxCheckBox;


type
  TFAction = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SEIDX: TcxSpinEdit;
    Button1: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    Image1: TcxImage;
    SETimerTime: TcxSpinEdit;
    Label6: TLabel;
    Label7: TLabel;
    SESubIDX: TcxSpinEdit;
    cbTimer: TcxCheckBox;
    DBEditID: TEdit;
    DBEditNAME: TEdit;
    DBEditCODE: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbTimerPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAction: TFAction;

implementation

{$R *.dfm}

procedure TFAction.Button1Click(Sender: TObject);
begin
 if OpenPictureDialog1.Execute then
  Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TFAction.cbTimerPropertiesEditValueChanged(Sender: TObject);
begin
 SETimerTime.Visible := cbTimer.Checked;
 SESubIDX.Visible := cbTimer.Checked;
end;

procedure TFAction.FormCreate(Sender: TObject);
begin
 SEIDX.EditValue := 0;
 SETimerTime.EditValue := 0;
 SESubIDX.EditValue := 0;
end;

end.
