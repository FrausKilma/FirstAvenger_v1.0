object FIMG: TFIMG
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'IMG'
  ClientHeight = 281
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxImage1: TcxImage
    Left = 0
    Top = 0
    Align = alClient
    TabOrder = 0
    Height = 281
    Width = 488
  end
  object actlstMAIN: TActionList
    Left = 320
    Top = 88
  end
end