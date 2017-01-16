object FAction: TFAction
  Left = 0
  Top = 0
  Caption = #1044#1077#1081#1089#1090#1074#1080#1103
  ClientHeight = 406
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    650
    406)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 20
    Width = 59
    Height = 13
    Caption = 'ID '#1057#1086#1073#1099#1090#1080#1103
  end
  object Label2: TLabel
    Left = 24
    Top = 56
    Width = 48
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
  end
  object Label3: TLabel
    Left = 24
    Top = 128
    Width = 44
    Height = 13
    Caption = #1055#1086#1088#1103#1076#1086#1082
  end
  object Label4: TLabel
    Left = 24
    Top = 88
    Width = 44
    Height = 13
    Caption = #1050#1086#1084#1072#1085#1076#1072
  end
  object Label5: TLabel
    Left = 264
    Top = 20
    Width = 49
    Height = 13
    Caption = #1050#1072#1088#1090#1080#1085#1082#1072
  end
  object Label6: TLabel
    Left = 24
    Top = 243
    Width = 82
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1080#1085#1082#1080
  end
  object Label7: TLabel
    Left = 24
    Top = 202
    Width = 30
    Height = 13
    Caption = #1042#1088#1077#1084#1103
  end
  object BitBtn1: TBitBtn
    Left = 475
    Top = 370
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 7
    ExplicitLeft = 523
    ExplicitTop = 359
  end
  object BitBtn2: TBitBtn
    Left = 559
    Top = 370
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 8
    ExplicitLeft = 607
    ExplicitTop = 359
  end
  object SEIDX: TcxSpinEdit
    Left = 112
    Top = 124
    Properties.AssignedValues.MinValue = True
    TabOrder = 3
    Width = 121
  end
  object Button1: TButton
    Left = 329
    Top = 330
    Width = 313
    Height = 34
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1082#1072#1088#1090#1080#1085#1082#1091
    TabOrder = 6
    OnClick = Button1Click
    ExplicitTop = 319
    ExplicitWidth = 362
  end
  object Image1: TcxImage
    Left = 328
    Top = 12
    Anchors = [akLeft, akTop, akRight, akBottom]
    Properties.FitMode = ifmProportionalStretch
    TabOrder = 9
    ExplicitWidth = 357
    ExplicitHeight = 301
    Height = 312
    Width = 309
  end
  object SETimerTime: TcxSpinEdit
    Left = 112
    Top = 199
    TabOrder = 5
    Width = 121
  end
  object SESubIDX: TcxSpinEdit
    Left = 112
    Top = 240
    TabOrder = 10
    Width = 121
  end
  object cbTimer: TcxCheckBox
    Left = 24
    Top = 160
    Caption = #1055#1086' '#1090#1072#1081#1084#1077#1088#1091
    Properties.OnEditValueChanged = cbTimerPropertiesEditValueChanged
    TabOrder = 4
    Width = 121
  end
  object DBEditID: TEdit
    Left = 112
    Top = 17
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'DBEditID'
  end
  object DBEditNAME: TEdit
    Left = 112
    Top = 53
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object DBEditCODE: TEdit
    Left = 112
    Top = 85
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 340
    Top = 344
  end
end
