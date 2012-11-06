object DlgTitles: TDlgTitles
  Left = 0
  Top = 0
  Caption = 'Earned Titles'
  ClientHeight = 403
  ClientWidth = 735
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
    735
    403)
  PixelsPerInch = 96
  TextHeight = 13
  object LblTitlesCap: TLabel
    Left = 8
    Top = 351
    Width = 66
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Titles earned:'
    ExplicitTop = 466
  end
  object LblTitlesEarnedCount: TLabel
    Left = 89
    Top = 351
    Width = 12
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = '...'
    ExplicitTop = 466
  end
  object BtnOK: TButton
    Left = 8
    Top = 370
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Use title'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = BtnOKClick
    ExplicitTop = 485
  end
  object BtnCancel: TButton
    Left = 89
    Top = 370
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    ExplicitTop = 485
  end
  object LvInventory: TListView
    Left = 8
    Top = 8
    Width = 719
    Height = 337
    Anchors = [akLeft, akTop, akRight, akBottom]
    Checkboxes = True
    Columns = <
      item
        Caption = 'Name'
        Width = 300
      end
      item
        Caption = 'Type'
      end
      item
        Caption = 'Description'
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
    ExplicitWidth = 568
    ExplicitHeight = 452
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
