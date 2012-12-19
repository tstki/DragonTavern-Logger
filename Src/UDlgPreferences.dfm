object DlgPreferences: TDlgPreferences
  Left = 0
  Top = 0
  Caption = 'Preferences'
  ClientHeight = 333
  ClientWidth = 399
  Color = clBtnFace
  Constraints.MinWidth = 372
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    399
    333)
  PixelsPerInch = 96
  TextHeight = 13
  object BtnOK: TButton
    Left = 8
    Top = 300
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = BtnOKClick
  end
  object BtnCancel: TButton
    Left = 89
    Top = 300
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 384
    Height = 286
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Interface'
      object Label3: TLabel
        Left = 15
        Top = 97
        Width = 80
        Height = 13
        Caption = 'Show buttons as'
      end
      object ChkShowMenuBar: TCheckBox
        Left = 15
        Top = 25
        Width = 132
        Height = 17
        Caption = 'Show menu bar'
        TabOrder = 0
      end
      object ChkShowDataBoxes: TCheckBox
        Left = 153
        Top = 25
        Width = 145
        Height = 17
        Caption = 'Show data boxes'
        TabOrder = 1
      end
      object ChkShowBrowserNavBar: TCheckBox
        Left = 15
        Top = 48
        Width = 178
        Height = 17
        Caption = 'Show browser navigation bar'
        TabOrder = 2
      end
      object ChkHostLocalDataColumns: TCheckBox
        Left = 15
        Top = 71
        Width = 178
        Height = 17
        Caption = 'Show Host && Local data columns'
        TabOrder = 3
      end
      object CbxButtonStyle: TComboBox
        Left = 153
        Top = 94
        Width = 145
        Height = 21
        TabOrder = 4
      end
      object ChkLazyZoneview: TCheckBox
        Left = 15
        Top = 116
        Width = 106
        Height = 17
        Hint = 'Ensures the zone view is never cleared automatically.'
        Caption = 'Lazy zone view'
        TabOrder = 5
      end
      object ChkDynamicDataview: TCheckBox
        Left = 15
        Top = 139
        Width = 234
        Height = 17
        Caption = 'Dynamic data view - best hunting columns'
        TabOrder = 6
      end
      object ChkDetectSoulStatus: TCheckBox
        Left = 15
        Top = 162
        Width = 178
        Height = 17
        Hint = 'Ensures the zone view is never cleared automatically.'
        Caption = 'Warn on bursting stolen souls'
        TabOrder = 7
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Analyzer'
      ImageIndex = 1
      object Label2: TLabel
        Left = 15
        Top = 80
        Width = 183
        Height = 13
        Caption = 'Minimum total to include zone average'
      end
      object LblUseAnalyzerGreenNumberPercent: TLabel
        Left = 277
        Top = 26
        Width = 11
        Height = 13
        Caption = '%'
      end
      object LblUseAnalyzerDarkGreenNumberPercent: TLabel
        Left = 277
        Top = 53
        Width = 11
        Height = 13
        Caption = '%'
      end
      object Label5: TLabel
        Left = 277
        Top = 80
        Width = 16
        Height = 13
        Caption = 'kills'
      end
      object ChkUseAnalyzerGreenNumberPercent: TCheckBox
        Left = 15
        Top = 25
        Width = 194
        Height = 17
        Caption = 'Blue background above:'
        TabOrder = 0
        OnClick = ItemChange
      end
      object ChkUseAnalyzerDarkGreenNumberPercent: TCheckBox
        Left = 15
        Top = 52
        Width = 194
        Height = 17
        Caption = 'Green background above:'
        TabOrder = 1
        OnClick = ItemChange
      end
      object ChkHideBeerRealm: TCheckBox
        Left = 15
        Top = 127
        Width = 154
        Height = 17
        Hint = 
          'The beer dragon realms were a special event only available durin' +
          'g the year of the dragon celebration'
        Caption = 'Hide beer dragon realms'
        TabOrder = 2
      end
      object ChkColorBelowMinimumKills: TCheckBox
        Left = 15
        Top = 104
        Width = 194
        Height = 17
        Caption = 'Red background below minimum kills'
        TabOrder = 3
        OnClick = ItemChange
      end
      object ChkBestHuntingColumns: TCheckBox
        Left = 15
        Top = 150
        Width = 186
        Height = 17
        Caption = 'Show only best hunting columns'
        TabOrder = 4
        OnClick = ChkBestHuntingColumnsClick
      end
      object ChkOrderByCreature: TCheckBox
        Left = 23
        Top = 167
        Width = 178
        Height = 17
        Caption = 'Order by creature type'
        TabOrder = 5
      end
      object EditMinimumKills: TEdit
        Left = 215
        Top = 77
        Width = 56
        Height = 21
        TabOrder = 6
        OnChange = ItemChange
      end
      object EditAnalyzerDarkGreenNumberPercent: TEdit
        Left = 215
        Top = 50
        Width = 56
        Height = 21
        TabOrder = 7
        OnChange = ItemChange
      end
      object EditAnalyzerGreenNumberPercent: TEdit
        Left = 215
        Top = 23
        Width = 56
        Height = 21
        TabOrder = 8
        OnChange = ItemChange
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Data handling'
      ImageIndex = 2
      DesignSize = (
        376
        258)
      object Label1: TLabel
        Left = 15
        Top = 21
        Width = 341
        Height = 52
        Anchors = [akLeft, akTop, akRight]
        Caption = 
          'This controls where the application receives it'#39's data from. By ' +
          'default the resulting total of both the developer and your local' +
          ' storage are used. But, if you prefer to only use the data YOU d' +
          'iscovered then you can disable this option.'
        WordWrap = True
      end
      object Label8: TLabel
        Left = 15
        Top = 106
        Width = 58
        Height = 13
        Caption = 'CSV Export:'
      end
      object Label9: TLabel
        Left = 15
        Top = 127
        Width = 329
        Height = 39
        Anchors = [akLeft, akTop, akRight]
        Caption = 
          'Events such as festivus can cause creatures to spawn in areas th' +
          'ey normally do not. It is recommended to disable logging for the' +
          'se creatures.'
        WordWrap = True
      end
      object BtnMerge: TButton
        Left = 252
        Top = 75
        Width = 108
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Merge local to Host'
        TabOrder = 0
        OnClick = BtnMergeClick
      end
      object RadioExportPercentages: TRadioButton
        Left = 151
        Top = 104
        Width = 95
        Height = 17
        Caption = 'Percentages'
        TabOrder = 1
      end
      object RadioExportValues: TRadioButton
        Left = 82
        Top = 104
        Width = 63
        Height = 17
        Caption = 'Values'
        TabOrder = 2
      end
      object ChkIncludeHostData: TCheckBox
        Left = 15
        Top = 79
        Width = 154
        Height = 17
        Caption = 'Include host data in totals'
        TabOrder = 3
      end
      object ChkLogEventCreatures: TCheckBox
        Left = 15
        Top = 172
        Width = 154
        Height = 17
        Caption = 'Log event related monsters'
        TabOrder = 4
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Immortal'
      ImageIndex = 4
      DesignSize = (
        376
        258)
      object Label10: TLabel
        Left = 15
        Top = 21
        Width = 315
        Height = 52
        Anchors = [akLeft, akTop, akRight]
        Caption = 
          'Enabling immortal powers will add extra checks. In use the power' +
          ' shortcuts, DTL will need to know the character ID. If you visit' +
          ' the immortal powers page once, it will detect and remember it f' +
          'or later use.'
        WordWrap = True
      end
      object Label11: TLabel
        Left = 191
        Top = 107
        Width = 99
        Height = 13
        Caption = 'Not yet implemented'
      end
      object Label12: TLabel
        Left = 15
        Top = 82
        Width = 90
        Height = 13
        Caption = 'Force character ID'
      end
      object ChkImmortalSoulStealer: TCheckBox
        Left = 15
        Top = 106
        Width = 170
        Height = 17
        Caption = 'Show Soul Stealer buttons'
        TabOrder = 1
      end
      object EditForcedCharacterID: TEdit
        Left = 129
        Top = 79
        Width = 56
        Height = 21
        TabOrder = 0
        OnChange = ItemChange
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Other'
      ImageIndex = 3
      object GroupBox4: TGroupBox
        Left = 3
        Top = 3
        Width = 314
        Height = 138
        Caption = 'Pre-Login'
        TabOrder = 0
        object Label6: TLabel
          Left = 15
          Top = 80
          Width = 48
          Height = 13
          Caption = 'Username'
        end
        object Label7: TLabel
          Left = 15
          Top = 107
          Width = 46
          Height = 13
          Caption = 'Password'
        end
        object Label4: TLabel
          Left = 15
          Top = 21
          Width = 268
          Height = 52
          Caption = 
            'If you wish DTL to fill the username and password field upon lau' +
            'nch, you can enter those here. The info will be stored as plain ' +
            'text in DragonLogger.ini, so be careful when handing files to fr' +
            'iends.'
          WordWrap = True
        end
        object EditUsername: TEdit
          Left = 153
          Top = 77
          Width = 145
          Height = 21
          TabOrder = 0
          OnChange = ItemChange
        end
        object EditPassword: TEdit
          Left = 152
          Top = 104
          Width = 145
          Height = 21
          PasswordChar = '*'
          TabOrder = 1
          OnChange = ItemChange
        end
      end
      object GroupBox5: TGroupBox
        Left = 3
        Top = 147
        Width = 314
        Height = 57
        Caption = 'Inventory Dialog'
        TabOrder = 1
        object ChkLimitInvCubeCharges: TCheckBox
          Left = 15
          Top = 25
          Width = 218
          Height = 17
          Hint = 
            'If no items are selected, no more than the max number of cube ch' +
            'arges wil be selected initially'
          Caption = 'Limit auto-select to max cube charges'
          TabOrder = 0
        end
      end
    end
  end
end
