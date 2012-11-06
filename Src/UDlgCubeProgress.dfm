object DlgCubeProgress: TDlgCubeProgress
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Progress'
  ClientHeight = 62
  ClientWidth = 253
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 85
    Height = 13
    Caption = 'Cube in progress:'
  end
  object LblCount: TLabel
    Left = 99
    Top = 8
    Width = 12
    Height = 13
    Caption = '...'
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 27
    Width = 227
    Height = 17
    Max = 10
    TabOrder = 0
  end
end
