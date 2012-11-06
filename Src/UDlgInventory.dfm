object DlgInventory: TDlgInventory
  Left = 0
  Top = 0
  Caption = 'Inventory'
  ClientHeight = 518
  ClientWidth = 584
  Color = clBtnFace
  Constraints.MinHeight = 350
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    584
    518)
  PixelsPerInch = 96
  TextHeight = 13
  object LblCubeChargesCap: TLabel
    Left = 144
    Top = 466
    Width = 70
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Cube charges:'
  end
  object LblCubeCharges: TLabel
    Left = 220
    Top = 466
    Width = 12
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = '...'
  end
  object LblSelectByWeight: TLabel
    Left = 224
    Top = 490
    Width = 57
    Height = 13
    Anchors = [akRight, akBottom]
    Caption = 'Select items'
  end
  object LblItemsSelected: TLabel
    Left = 8
    Top = 466
    Width = 74
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Items selected:'
  end
  object LblItemsSelectedCount: TLabel
    Left = 89
    Top = 466
    Width = 12
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = '...'
  end
  object LblChargesLeftWarning: TLabel
    Left = 264
    Top = 466
    Width = 248
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Warning: Not enough charges to perform all actions'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object BtnOK: TButton
    Left = 8
    Top = 485
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Portal it!'
    Default = True
    ModalResult = 1
    TabOrder = 8
    OnClick = BtnOKClick
  end
  object BtnCancel: TButton
    Left = 89
    Top = 485
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 9
  end
  object LvInventory: TListView
    Left = 8
    Top = 8
    Width = 568
    Height = 452
    Anchors = [akLeft, akTop, akRight, akBottom]
    Checkboxes = True
    Columns = <
      item
        Caption = 'Name'
        Width = 300
      end
      item
        Caption = 'Rarity'
      end
      item
        Alignment = taRightJustify
        Caption = 'Weight'
      end
      item
        Alignment = taRightJustify
        Caption = 'Value'
        Width = 75
      end
      item
        Alignment = taRightJustify
        Caption = 'Val / Weight'
        Width = 75
      end>
    ReadOnly = True
    RowSelect = True
    SortType = stData
    TabOrder = 0
    ViewStyle = vsReport
    OnAdvancedCustomDrawItem = LvInventoryAdvancedCustomDrawItem
    OnChange = LvInventoryChange
    OnColumnClick = LvInventoryColumnClick
    OnCompare = LvInventoryCompare
  end
  object BtnSelectWeight13: TButton
    Left = 467
    Top = 485
    Width = 30
    Height = 25
    Hint = 'Select all items with a weight of 13'
    Anchors = [akRight, akBottom]
    Caption = '13'
    TabOrder = 6
    OnClick = BtnSelectWeight13Click
  end
  object BtnSelectWeight12: TButton
    Left = 431
    Top = 485
    Width = 30
    Height = 25
    Hint = 'Select all items with a weight of 12 or greater'
    Anchors = [akRight, akBottom]
    Caption = '12+'
    TabOrder = 5
    OnClick = BtnSelectWeight12Click
  end
  object BtnSelectWeight11: TButton
    Left = 395
    Top = 485
    Width = 30
    Height = 25
    Hint = 'Select all items with a weight of 11 or greater'
    Anchors = [akRight, akBottom]
    Caption = '11+'
    TabOrder = 4
    OnClick = BtnSelectWeight11Click
  end
  object BtnUnselectAll: TButton
    Left = 503
    Top = 485
    Width = 73
    Height = 25
    Hint = 'Unselect all items'
    Anchors = [akRight, akBottom]
    Caption = 'Unselect all'
    TabOrder = 7
    OnClick = BtnUnselectAllClick
  end
  object BtnSelectWeight10: TButton
    Left = 359
    Top = 485
    Width = 30
    Height = 25
    Hint = 'Select all items with a weight of 10 or greater'
    Anchors = [akRight, akBottom]
    Caption = '10+'
    TabOrder = 3
    OnClick = BtnSelectWeight10Click
  end
  object BtnSelectItemsCommon: TButton
    Left = 287
    Top = 485
    Width = 30
    Height = 25
    Hint = 'Select all Common items'
    Anchors = [akRight, akBottom]
    Caption = 'C'
    TabOrder = 1
    OnClick = BtnSelectItemsCommonClick
  end
  object BtnSelectWeight9: TButton
    Left = 323
    Top = 485
    Width = 30
    Height = 25
    Hint = 'Select all items with a weight of 9 or greater'
    Anchors = [akRight, akBottom]
    Caption = '9+'
    TabOrder = 2
    OnClick = BtnSelectWeight9Click
  end
  object ImageList1: TImageList
    Left = 24
    Top = 64
  end
  object XPManifest1: TXPManifest
    Left = 88
    Top = 64
  end
  object ActionList1: TActionList
    Left = 152
    Top = 64
  end
end
