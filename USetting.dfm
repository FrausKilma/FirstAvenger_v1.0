object FrmSettings: TFrmSettings
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 224
  ClientWidth = 412
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    412
    224)
  PixelsPerInch = 96
  TextHeight = 13
  object Btn1: TButton
    Left = 128
    Top = 32
    Width = 153
    Height = 25
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' COM '#1087#1086#1088#1090#1072
    TabOrder = 0
    OnClick = Btn1Click
  end
  object btnOk: TBitBtn
    Left = 329
    Top = 191
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
  end
  object btnCancel: TBitBtn
    Left = 8
    Top = 191
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
  end
end