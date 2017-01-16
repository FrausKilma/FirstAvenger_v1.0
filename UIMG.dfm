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
    Properties.FitMode = ifmStretch
    TabOrder = 0
    Height = 281
    Width = 488
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 185
    Height = 265
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 312
    Top = 96
  end
  object ActionList1: TActionList
    Left = 368
    Top = 184
    object AExit: TAction
      Caption = 'AExit'
      ShortCut = 113
      OnExecute = AExitExecute
    end
  end
end
