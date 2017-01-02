unit UActions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFirstAvenger, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, StdCtrls, Buttons,
  cxImage, cxDBEdit, cxTextEdit, cxMaskEdit, cxSpinEdit, Mask, DBCtrls, DB, IBCustomDataSet, IBQuery, ExtDlgs, ExtCtrls, jpeg;


type
  TFAction = class(TForm)
    DBEditID: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEditNAME: TDBEdit;
    DBEditCODE: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cxSpinEdit1: TcxSpinEdit;
    Button1: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    Image1: TcxImage;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

procedure TFAction.FormCreate(Sender: TObject);
begin
 cxSpinEdit1.EditValue := 0;
end;

end.
