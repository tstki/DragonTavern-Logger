object DlgAnalyze: TDlgAnalyze
  Left = 0
  Top = 0
  Caption = 'Data analysis'
  ClientHeight = 589
  ClientWidth = 844
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 200
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    844
    589)
  PixelsPerInch = 96
  TextHeight = 13
  object LblHideItemsTotalKills: TLabel
    Left = 415
    Top = 561
    Width = 41
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'total kills'
    ExplicitTop = 570
  end
  object BtnCancel: TButton
    Left = 8
    Top = 556
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Close'
    Default = True
    ModalResult = 2
    TabOrder = 1
    OnClick = BtnCancelClick
  end
  object LvAnalyze: TListView
    Left = 8
    Top = 8
    Width = 828
    Height = 537
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        Caption = 'Zone'
        Width = 140
      end
      item
        Caption = 'Sub Zone'
        Width = 145
      end
      item
        Alignment = taRightJustify
        Caption = 'Levels'
      end
      item
        Alignment = taRightJustify
        Caption = 'Total kills'
        Width = 60
      end>
    DoubleBuffered = True
    ReadOnly = True
    RowSelect = True
    ParentDoubleBuffered = False
    SortType = stData
    TabOrder = 0
    ViewStyle = vsReport
    OnAdvancedCustomDrawItem = LvAnalyzeAdvancedCustomDrawItem
    OnAdvancedCustomDrawSubItem = LvAnalyzeAdvancedCustomDrawSubItem
    OnChange = LvAnalyzeChange
    OnColumnClick = LvAnalyzeColumnClick
    OnCompare = LvAnalyzeCompare
  end
  object BtnRefresh: TButton
    Left = 89
    Top = 556
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Refresh'
    TabOrder = 2
    OnClick = BtnRefreshClick
  end
  object CbxHideEnumerator: TComboBox
    Left = 294
    Top = 558
    Width = 51
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akBottom]
    TabOrder = 3
  end
  object ChkHideAnalyzeItems: TCheckBox
    Left = 194
    Top = 560
    Width = 94
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Hide rows with'
    TabOrder = 4
    OnClick = ChkHideAnalyzeItemsClick
  end
  object EditHideItemsValue: TEdit
    Left = 351
    Top = 558
    Width = 58
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 5
    OnChange = EditHideItemsValueChange
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
