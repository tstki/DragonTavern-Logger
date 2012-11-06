object DlgHotkeys: TDlgHotkeys
  Left = 0
  Top = 0
  Caption = 'Hotkeys'
  ClientHeight = 358
  ClientWidth = 336
  Color = clBtnFace
  Constraints.MaxHeight = 394
  Constraints.MaxWidth = 352
  Constraints.MinHeight = 345
  Constraints.MinWidth = 352
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    336
    358)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 112
    Width = 13
    Height = 13
    Caption = 'E :'
  end
  object Label2: TLabel
    Left = 8
    Top = 226
    Width = 14
    Height = 13
    Caption = 'R :'
  end
  object Label3: TLabel
    Left = 8
    Top = 245
    Width = 13
    Height = 13
    Caption = 'T :'
  end
  object Label4: TLabel
    Left = 27
    Top = 245
    Width = 289
    Height = 26
    Anchors = [akLeft, akTop, akRight]
    Caption = 
      'Travel - to tavern, or from tavern to previous location (only wo' +
      'rks if the link is visible)'
    WordWrap = True
  end
  object Label5: TLabel
    Left = 27
    Top = 226
    Width = 74
    Height = 13
    Caption = 'Rankings board'
  end
  object Label6: TLabel
    Left = 27
    Top = 112
    Width = 140
    Height = 13
    Caption = 'Explore current zone (if able)'
  end
  object Label7: TLabel
    Left = 8
    Top = 8
    Width = 299
    Height = 39
    Anchors = [akLeft, akTop, akRight]
    Caption = 
      'Dragon Tavern has a number of hotkeys you can use while in-game.' +
      ' Simply press the keys listed below if the link is visible. You ' +
      'may have to enable them in your account settings first.'
    WordWrap = True
  end
  object Label8: TLabel
    Left = 8
    Top = 55
    Width = 14
    Height = 13
    Caption = 'A :'
  end
  object Label9: TLabel
    Left = 27
    Top = 55
    Width = 85
    Height = 13
    Caption = 'Advantages page'
  end
  object Label10: TLabel
    Left = 8
    Top = 169
    Width = 11
    Height = 13
    Caption = 'I :'
  end
  object Label11: TLabel
    Left = 27
    Top = 169
    Width = 75
    Height = 13
    Caption = 'Inventory page'
  end
  object Label12: TLabel
    Left = 8
    Top = 207
    Width = 13
    Height = 13
    Caption = 'P :'
  end
  object Label13: TLabel
    Left = 27
    Top = 207
    Width = 54
    Height = 13
    Caption = 'Public page'
  end
  object Label14: TLabel
    Left = 27
    Top = 188
    Width = 86
    Height = 13
    Caption = 'Return to location'
  end
  object Label15: TLabel
    Left = 8
    Top = 188
    Width = 12
    Height = 13
    Caption = 'L :'
  end
  object Label16: TLabel
    Left = 8
    Top = 74
    Width = 13
    Height = 13
    Caption = 'B :'
  end
  object Label17: TLabel
    Left = 27
    Top = 74
    Width = 198
    Height = 13
    Caption = 'Buy more credits / Replenish credits page'
  end
  object Label18: TLabel
    Left = 8
    Top = 93
    Width = 14
    Height = 13
    Caption = 'C :'
  end
  object Label19: TLabel
    Left = 27
    Top = 93
    Width = 105
    Height = 13
    Caption = 'Character sheet page'
  end
  object Label20: TLabel
    Left = 8
    Top = 150
    Width = 14
    Height = 13
    Caption = 'H :'
  end
  object Label21: TLabel
    Left = 27
    Top = 150
    Width = 119
    Height = 13
    Caption = 'Recent happenings page'
  end
  object Label22: TLabel
    Left = 27
    Top = 131
    Width = 93
    Height = 13
    Caption = 'Competition groups'
  end
  object Label23: TLabel
    Left = 8
    Top = 131
    Width = 14
    Height = 13
    Caption = 'G :'
  end
  object Label24: TLabel
    Left = 8
    Top = 277
    Width = 15
    Height = 13
    Caption = '+ :'
  end
  object Label25: TLabel
    Left = 27
    Top = 277
    Width = 211
    Height = 13
    Caption = 'Increase difficulty (must be in location view)'
  end
  object Label26: TLabel
    Left = 8
    Top = 296
    Width = 11
    Height = 13
    Caption = '- :'
  end
  object Label27: TLabel
    Left = 27
    Top = 296
    Width = 214
    Height = 13
    Caption = 'Decrease difficulty (must be in location view)'
  end
  object BtnOK: TButton
    Left = 8
    Top = 325
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    ExplicitTop = 313
  end
end
