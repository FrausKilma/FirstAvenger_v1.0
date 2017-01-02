unit UFirstAvenger;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActnList, ImgList, dxBar, cxClasses, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxButtons, ExtCtrls, IBDatabase, DB, cxControls, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxImage, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, IBCustomDataSet, IBTable, cxGridLevel,
  cxGridCustomView, cxGrid, IBUpdateSQL, IBQuery, jpeg,
  System.Actions, cxNavigator;

type
  TFMain = class(TForm)
    ALEvents: TActionList;
    ActionTry: TAction;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    ImageList1: TImageList;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    ALMain: TActionList;
    AAdd: TAction;
    AEdit: TAction;
    ADel: TAction;
    ARefresh: TAction;
    Panel1: TPanel;
    BStart: TcxButton;
    AStart: TAction;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DataSource1: TDataSource;
    IBTActions: TIBTable;
    cxGrid1DBTableView1ID: TcxGridDBColumn;
    cxGrid1DBTableView1NAME: TcxGridDBColumn;
    cxGrid1DBTableView1BODY: TcxGridDBColumn;
    cxGrid1DBTableView1CODE: TcxGridDBColumn;
    cxGrid1DBTableView1IDX: TcxGridDBColumn;
    IBTActionsID: TIntegerField;
    IBTActionsNAME: TIBStringField;
    IBTActionsBODY: TBlobField;
    IBTActionsCODE: TIBStringField;
    IBTActionsIDX: TIntegerField;
    IBUpdateSQL1: TIBUpdateSQL;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AnyActionExecute(Sender: TObject);
    procedure ActionTryExecute(Sender: TObject);
    procedure AAddExecute(Sender: TObject);
    procedure AEditExecute(Sender: TObject);
    procedure ADelExecute(Sender: TObject);
    procedure ARefreshExecute(Sender: TObject);
    procedure IBTActionsAfterInsert(DataSet: TDataSet);
    procedure CreateQuery(var Q:TIBQuery);
    procedure IBTActionsAfterTransactionEnd(Sender: TObject);
    procedure IBTActionsAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  type
    TGraphType = (gtBitmap, gtIcon, gtMetafile, gtJpeg);

var
  FMain: TFMain;
  A:Integer;

implementation
 uses UActions;

{$R *.dfm}
procedure TFMain.CreateQuery(var Q:TIBQuery);
begin
  Q := TIBQuery.Create(nil);
  Q.Database := IBDatabase1;
  Q.Transaction := IBTransaction1;
end;

procedure TFMain.AAddExecute(Sender: TObject);
var QIns:TIBQuery;
QGetMaxID:TIBQuery;
MaxID:Integer;
MS:TMemoryStream;
begin
//  IBTActions.Insert;
  CreateQuery(QGetMaxID);
  QGetMaxID.SQL.Text := 'Select max(ID) ID from ACTIONS';
  QGetMaxID.Open;
  if not QGetMaxID.IsEmpty then MaxID := QGetMaxID.FieldByName('ID').AsInteger;
  QGetMaxID.Close;
  FreeAndNil(QGetMaxID);

  Application.CreateForm(TFAction, FAction);
  FAction.DBEditID.EditText := IntToStr(MaxID+1);
  if FAction.ShowModal = mrOk
   then
   begin
    CreateQuery(QIns);
    MS := TMemoryStream.Create;
    QIns.SQL.Text := 'Insert into ACTIONS  (BODY, CODE, IDX, NAME) values (:BODY, :CODE, :IDX, :NAME)';
//    QIns.ParamByName('ID').AsInteger := MaxID + 1;
    QIns.ParamByName('IDX').AsInteger := FAction.cxSpinEdit1.EditingValue;
     if Assigned(FAction.Image1.Picture.Graphic) then
     begin
      MS.Position := 0;
      FAction.Image1.Picture.Graphic.SaveToStream(Ms);
      QIns.ParamByName('BODY').LoadFromStream(MS,ftBlob);
     end;
    QIns.ParamByName('NAME').AsString := FAction.DBEditNAME.EditText;
    QIns.ParamByName('CODE').AsString := FAction.DBEditCODE.EditText;
    QIns.ExecSQL;
    FreeAndNil(QIns);
    FreeAndNil(MS);
    IBTransaction1.CommitRetaining;
    ARefresh.Execute;
   end
   else IBTActions.Cancel;
  IBTActions.Close;
  IBTActions.Open;
  FreeAndNil(FAction);
end;

procedure TFMain.ActionTryExecute(Sender: TObject);
begin
  ShowMessage('1');
end;

procedure TFMain.ADelExecute(Sender: TObject);
var i:Integer;
ArrInt:array of Integer;
QDel:TIBQuery;
begin
 if cxGrid1DBTableView1.DataController.Controller.SelectedRecordCount = 1 then
  begin
  if MessageDlg('������� ������?',mtWarning, mbOKCancel,0) = mrOk then
    IBTActions.Delete;
  end
 else
  begin
    if MessageDlg('������� ��������� ������?',mtWarning, mbOKCancel,0) = mrOk then
    begin
      SetLength(ArrInt, 0);
      for I := 0 to cxGrid1DBTableView1.DataController.Controller.SelectedRecordCount - 1 do
       begin
        SetLength(ArrInt, Length(ArrInt)+1);
        ArrInt[HIGH(ArrInt)] := cxGrid1DBTableView1.DataController.Controller.SelectedRecords[i].Values[0]
       end;
      CreateQuery(QDel);
      QDel.SQL.Text := 'delete from ACTIONS where ID in (';
      for i := 0 to High(ArrInt) do
      begin
       if i = High(ArrInt)
       then QDel.SQL.Text := QDel.SQL.Text + IntToStr(ArrInt[i])
       else QDel.SQL.Text := QDel.SQL.Text + IntToStr(ArrInt[i])+ ', ';
      end;
      QDel.SQL.Text := QDel.SQL.Text + ')';
      QDel.ExecSQL;
      FreeAndNil(QDel);
    end;
  end;
  ARefresh.Execute;
end;

procedure TFMain.AEditExecute(Sender: TObject);
var MS:TMemoryStream;
QUpd:TIBQuery;
begin
  IBTActions.Edit;
  Application.CreateForm(TFAction, FAction);
  MS := TMemoryStream.Create;
  TBlobField(IBTActions.FieldByName('BODY')).SaveToStream(MS);
//  MS.SaveToFile('1.jpg');
//  FAction.Image1.Picture.LoadFromFile('1.jpg');
  MS.Position := 1;
  FAction.Image1.Picture.Bitmap.LoadFromStream(MS);
  if FAction.ShowModal = mrOk
   then
   begin
    CreateQuery(QUpd);
    QUpd.SQL.Text := ('update ACTIONS set BODY = :BODY, CODE = :CODE,  IDX = :IDX,  NAME = :NAME where id=:id' );
    QUpd.ParamByName('ID').AsInteger := IBTActions.FieldByName('ID').AsInteger;
    QUpd.ParamByName('IDX').AsInteger := FAction.cxSpinEdit1.EditingValue;
     if Assigned(FAction.Image1.Picture.Graphic) then
     begin
      MS.Position := 0;
      FAction.Image1.Picture.Graphic.SaveToStream(Ms);
      QUpd.ParamByName('BODY').LoadFromStream(MS,ftBlob);
     end;
    QUpd.ParamByName('NAME').AsString := FAction.DBEditNAME.EditText;
    QUpd.ParamByName('CODE').AsString := FAction.DBEditCODE.EditText;
    QUpd.ExecSQL;
    IBTransaction1.CommitRetaining;
    ARefresh.Execute;
   end
   else IBTActions.Cancel;
  FreeAndNil(FAction);
  FreeAndNil(MS);
end;

procedure TFMain.AnyActionExecute(Sender: TObject);
begin
 inherited;
  ShowMessage(TAction(Sender).Hint);
end;


procedure TFMain.ARefreshExecute(Sender: TObject);
begin
 IBTActions.Close;
 IBTActions.Open;
end;

procedure TFMain.Button1Click(Sender: TObject);
var NewAction:TAction;
begin
 NewAction := TAction.Create(Self);
 NewAction.ActionList := ALEvents;
 NewAction.Name := 'Act' + IntToStr(A);
 NewAction.Hint := IntToStr(A);
 NewAction.OnExecute := AnyActionExecute;
 Inc(A);
end;



procedure TFMain.FormCreate(Sender: TObject);
begin
 A := 1;
 ALMain.State:= asNormal;
end;


procedure TFMain.IBTActionsAfterDelete(DataSet: TDataSet);
begin
 cxGrid1.Refresh;
end;

procedure TFMain.IBTActionsAfterInsert(DataSet: TDataSet);
var QGen:TIBQuery;
begin
//  QGen := TIBQuery.Create(nil);
//  QGen.Database := FMain.IBDatabase1;
//  QGen.Transaction := FMain.IBTransaction1;
//  QGen.SQL.Text := 'SELECT GEN_ID(gen_actions_id_main, 1) FROM ACTIONS';
//  QGen.Open;
//  Fmain.IBTActions.FieldByName('ID').AsInteger := QGen.FieldByName('GEN_ID').AsInteger;
//  QGen.Close;
//  FreeAndNil(QGen);
end;


procedure TFMain.IBTActionsAfterTransactionEnd(Sender: TObject);
begin
 cxGrid1.Refresh;
end;

end.
