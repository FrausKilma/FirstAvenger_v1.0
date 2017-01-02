unit UIMG;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, System.Actions, Vcl.ActnList,
  cxImage, DB;

type
    RImage = record
    ID:Integer;
    Name:String;
    Code:string;
    IMG:TMemoryStream;
    TimerON:Boolean;
    Time:Integer;
    IDX:Integer;
    procedure add;
  end;

  TFIMG = class(TForm)
    cxImage1: TcxImage;
    actlstMAIN: TActionList;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function FindImage(Code:String):RImage;
    procedure AvialableCom(Text:String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  FIMG: TFIMG;
  ImageControler:array of RImage;
  DefImage:RImage;

implementation
uses UFirstAvenger, PortUnit;

{$R *.dfm}
procedure RImage.add;
var num:Integer;
MS:TMemoryStream;
begin
 SetLength(ImageControler, Length(ImageControler)+1);
 num:=High(ImageControler);
 ImageControler[num].ID := FMain.IBTActions.FieldByName('ID').AsInteger;
 ImageControler[num].Name := FMain.IBTActions.FieldByName('NAME').AsString;
 ImageControler[num].Code := FMain.IBTActions.FieldByName('CODE').AsString;
 MS := TMemoryStream.Create;
 TBlobField(FMain.IBTActions.FieldByName('BODY')).SaveToStream(MS);
 ImageControler[num].IMG := TMemoryStream.Create;
 ImageControler[num].IMG := MS;
 ImageControler[num].TimerON := false; // GO TO
 ImageControler[num].Time := 0; // GO TO
 FreeAndNil(MS);
end;

procedure TFIMG.FormCreate(Sender: TObject);
begin
  SetLength(ImageControler, 0);
end;

procedure TFIMG.FormShow(Sender: TObject);
var i:Integer;
defAction:TAction;
begin
 FMain.IBTActions.First;
 while not FMain.IBTActions.Eof do
 begin
  DefImage.add;
  FMain.IBTActions.Next;
 end;

end;

procedure TFIMG.AvialableCom(Text: String);
var Img:RImage;
begin
  Img := FindImage(Text);
  Img.IMG.SaveToFile('C:\1.jpg');
  cxImage1.Picture.LoadFromFile('C:\1.jpg');
end;

function TFIMG.FindImage(Code:String):RImage;
var i :Integer;
begin
  for i := Low(ImageControler) to High(ImageControler) do
   begin
     if UpperCase(ImageControler[i].Code) = UpperCase(Code) then
      begin
        Result := ImageControler[i];
      end;
   end;

end;

end.