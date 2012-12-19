unit UConfig;

interface

uses
  Inifiles, Classes;

type
  TConfig = class(TObject)
  private
    { Private declarations }
    dataIni: TIniFile;
    // Dialog settings
    FMainScreen_Top: Integer;
    FMainScreen_Left: Integer;
    FMainScreen_Width: Integer;
    FMainScreen_Height: Integer;
    FZoneViewSortColumn: Integer;
    FZoneViewSortDescending: Boolean;
    FDataViewSortColumn: Integer;
    FDataViewSortDescending: Boolean;
    FInventoryScreen_Top: Integer;
    FInventoryScreen_Left: Integer;
    FInventoryScreen_Width: Integer;
    FInventoryScreen_Height: Integer;
    FInventoryScreenSortColumn: Integer;
    FInventoryScreenSortDescending: Boolean;
    FAnalyzeScreen_Top: Integer;
    FAnalyzeScreen_Left: Integer;
    FAnalyzeScreen_Width: Integer;
    FAnalyzeScreen_Height: Integer;
    FAnalyzeScreenSortColumn: Integer;
    FAnalyzeScreenSortDescending: Boolean;

    // Globals
    FLastStartedVersion: String;
    FDevMode: Boolean;
    FAnalyzeCreatures: String;

    // Credentials
    FUserName: String;
    FPassword: String;

    // Customization : Change the booleans to bit values later
    FShowMenuBar: Boolean;
    FShowDataBoxes: Boolean;
    FShowBrowserNavBar: Boolean;
    FButtonStyle: Integer;
    FHostLocalDataColumns: Boolean;
    FIncludeHostData: Boolean;
    FColorBelowMinimumKills: Boolean;
    FUseAnalyzeHighest: Boolean;
    FAnalyzeHighestPercent: Integer;
    FUseAnalyzeHigh: Boolean;
    FAnalyzeHighPercent: Integer;
    FAnalyzeMinimumKills: Integer;
    FLazyZoneview: Boolean;
    FExportPercentages: Boolean;
    FLogEventCreatures: Boolean;
    FFilterAnalyzer: Boolean;
    FFilterAnalyzerIndex: Integer;
    FFilterAnalyzerValue: Integer;
    FLimitInvCubeCharges: Boolean;
    FHideBeerRealm: Boolean;
    FBestHuntingColumns: Boolean;
    FOrderByCreature: Boolean;
    FDynamicDataview: Boolean;
    FDataViewItemIndex: Integer;
    FLastDataZone: String;
    FDetectSoulStatus: Boolean;
    FImmortalSoulStealer: Boolean;
    FForcedCharacterID: String;

  public
    { Public declarations }
    procedure Initialize();
    procedure Cleanup();
    procedure ReadValues();
    procedure WriteValues(OnlyWriteAnalyzer: Boolean);

    property MainScreen_Top: Integer read FMainScreen_Top write FMainScreen_Top;
    property MainScreen_Left: Integer read FMainScreen_Left write FMainScreen_Left;
    property MainScreen_Width: Integer read FMainScreen_Width write FMainScreen_Width;
    property MainScreen_Height: Integer read FMainScreen_Height write FMainScreen_Height;
    property ZoneViewSortColumn: Integer read FZoneViewSortColumn write FZoneViewSortColumn;
    property ZoneViewSortDescending: Boolean read FZoneViewSortDescending write FZoneViewSortDescending;
    property DataViewSortColumn: Integer read FDataViewSortColumn write FDataViewSortColumn;
    property DataViewSortDescending: Boolean read FDataViewSortDescending write FDataViewSortDescending;
    property InventoryScreen_Top: Integer read FInventoryScreen_Top write FInventoryScreen_Top;
    property InventoryScreen_Left: Integer read FInventoryScreen_Left write FInventoryScreen_Left;
    property InventoryScreen_Width: Integer read FInventoryScreen_Width write FInventoryScreen_Width;
    property InventoryScreen_Height: Integer read FInventoryScreen_Height write FInventoryScreen_Height;
    property InventoryScreenSortColumn: Integer read FInventoryScreenSortColumn write FInventoryScreenSortColumn;
    property InventoryScreenSortDescending: Boolean read FInventoryScreenSortDescending write FInventoryScreenSortDescending;
    property AnalyzeScreen_Top: Integer read FAnalyzeScreen_Top write FAnalyzeScreen_Top;
    property AnalyzeScreen_Left: Integer read FAnalyzeScreen_Left write FAnalyzeScreen_Left;
    property AnalyzeScreen_Width: Integer read FAnalyzeScreen_Width write FAnalyzeScreen_Width;
    property AnalyzeScreen_Height: Integer read FAnalyzeScreen_Height write FAnalyzeScreen_Height;
    property AnalyzeScreenSortColumn: Integer read FAnalyzeScreenSortColumn write FAnalyzeScreenSortColumn;
    property AnalyzeScreenSortDescending: Boolean read FAnalyzeScreenSortDescending write FAnalyzeScreenSortDescending;

    property LastStartedVersion: String read FLastStartedVersion write FLastStartedVersion;
    property DevMode: Boolean read FDevMode write FDevMode;
    property AnalyzeCreatures: String read FAnalyzeCreatures write FAnalyzeCreatures;
    property UserName: String read FUserName write FUserName;
    property Password: String read FPassword write FPassword;
    property ShowMenuBar: Boolean read FShowMenuBar write FShowMenuBar;
    property ShowDataBoxes: Boolean read FShowDataBoxes write FShowDataBoxes;
    property ShowBrowserNavBar: Boolean read FShowBrowserNavBar write FShowBrowserNavBar;
    property ButtonStyle: Integer read FButtonStyle write FButtonStyle;
    property HostLocalDataColumns: Boolean read FHostLocalDataColumns write FHostLocalDataColumns;
    property IncludeHostData: Boolean read FIncludeHostData write FIncludeHostData;
    property ColorBelowMinimumKills: Boolean read FColorBelowMinimumKills write FColorBelowMinimumKills;
    property UseAnalyzeHighest: Boolean read FUseAnalyzeHighest write FUseAnalyzeHighest;
    property AnalyzeHighestPercent: Integer read FAnalyzeHighestPercent write FAnalyzeHighestPercent;
    property UseAnalyzeHigh: Boolean read FUseAnalyzeHigh write FUseAnalyzeHigh;
    property AnalyzeHighPercent: Integer read FAnalyzeHighPercent write FAnalyzeHighPercent;
    property AnalyzeMinimumKills: Integer read FAnalyzeMinimumKills write FAnalyzeMinimumKills;
    property LazyZoneview: Boolean read FLazyZoneview write FLazyZoneview;
    property ExportPercentages: Boolean read FExportPercentages write FExportPercentages;
    property LogEventCreatures: Boolean read FLogEventCreatures write FLogEventCreatures;
    property FilterAnalyzer: Boolean read FFilterAnalyzer write FFilterAnalyzer;
    property FilterAnalyzerIndex: Integer read FFilterAnalyzerIndex write FFilterAnalyzerIndex;
    property FilterAnalyzerValue: Integer read FFilterAnalyzerValue write FFilterAnalyzerValue;
    property LimitInvCubeCharges: Boolean read FLimitInvCubeCharges write FLimitInvCubeCharges;
    property HideBeerRealm: Boolean read FHideBeerRealm write FHideBeerRealm;
    property BestHuntingColumns: Boolean read FBestHuntingColumns write FBestHuntingColumns;
    property OrderByCreature: Boolean read FOrderByCreature write FOrderByCreature;
    property DynamicDataview: Boolean read FDynamicDataview write FDynamicDataview;
    property DataViewItemIndex: Integer read FDataViewItemIndex write FDataViewItemIndex;
    property LastDataZone: String read FLastDataZone write FLastDataZone;
    property DetectSoulStatus: Boolean read FDetectSoulStatus write FDetectSoulStatus;
    property ImmortalSoulStealer: Boolean read FImmortalSoulStealer write FImmortalSoulStealer;
    property ForcedCharacterID: String read FForcedCharacterID write FForcedCharacterID;
  end;

implementation

uses
  SysUtils, Forms, UStrings;

procedure TConfig.Initialize();
begin
  dataIni := TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
end;

procedure TConfig.Cleanup();
begin
  dataIni.Free;
end;

procedure TConfig.ReadValues();
var
  appINI : TIniFile;
begin
  appINI := TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));

  try
    // Dialog settings
    FMainScreen_Top := appINI.ReadInteger('Options', 'MainScreen_Top', -1);
    FMainScreen_Left := appINI.ReadInteger('Options', 'MainScreen_Left', -1);
    FMainScreen_Width := appINI.ReadInteger('Options', 'MainScreen_Width', -1);
    FMainScreen_Height := appINI.ReadInteger('Options', 'MainScreen_Height', -1);
    FZoneViewSortColumn := appINI.ReadInteger('Options', 'ZoneViewSortColumn', 0);
    FZoneViewSortDescending := appINI.ReadBool('Options', 'ZoneViewSortDescending', False);
    FDataViewSortColumn := appINI.ReadInteger('Options', 'DataViewSortColumn', 0);
    FDataViewSortDescending := appINI.ReadBool('Options', 'DataViewSortDescending', False);
    FInventoryScreen_Top := appINI.ReadInteger('Options', 'InventoryScreen_Top', -1);
    FInventoryScreen_Left := appINI.ReadInteger('Options', 'InventoryScreen_Left', -1);
    FInventoryScreen_Width := appINI.ReadInteger('Options', 'InventoryScreen_Width', -1);
    FInventoryScreen_Height := appINI.ReadInteger('Options', 'InventoryScreen_Height', -1);
    FInventoryScreenSortColumn := appINI.ReadInteger('Options', 'InventoryScreenSortColumn', 4);
    FInventoryScreenSortDescending := appINI.ReadBool('Options', 'InventoryScreenSortDescending', True);
    FAnalyzeScreen_Top := appINI.ReadInteger('Options', 'AnalyzeScreen_Top', -1);
    FAnalyzeScreen_Left := appINI.ReadInteger('Options', 'AnalyzeScreen_Left', -1);
    FAnalyzeScreen_Width := appINI.ReadInteger('Options', 'AnalyzeScreen_Width', -1);
    FAnalyzeScreen_Height := appINI.ReadInteger('Options', 'AnalyzeScreen_Height', -1);
    FAnalyzeScreenSortColumn := appINI.ReadInteger('Options', 'AnalyzeScreenSortColumn', 0);
    FAnalyzeScreenSortDescending := appINI.ReadBool('Options', 'AnalyzeScreenSortDescending', False);

    // Globals
    FLastStartedVersion := appINI.ReadString('Globals', 'LastStartedVersion', StrVersion);
    FDevMode := appINI.ReadBool('Globals', 'DevMode', False);
    FAnalyzeCreatures := appIni.ReadString('Globals','AnalyzeCreatures','Beast,Construct,Demon,Dragonkin,Elemental,Fae,Giantkin,Goblinoid,Goo,Humanoid,Insect,Outworlder,Undead');
    FLogEventCreatures := appIni.ReadBool('Globals', 'LogEventCreatures', False);

    // Credentials
    FUserName := appINI.ReadString('Login', 'UserName', '');
    FPassword := appINI.ReadString('Login', 'Password', '');

    // Customization
    FShowMenuBar := appINI.ReadBool('Customization', 'ShowMenuBar', True);
    FShowDataBoxes := appINI.ReadBool('Customization', 'ShowDataBoxes', True);
    FShowBrowserNavBar := appINI.ReadBool('Customization', 'ShowBrowserNavBar', True);
    FButtonStyle := appINI.ReadInteger('Customization', 'ButtonStyle', 0);
    FHostLocalDataColumns := appINI.ReadBool('Customization', 'HostLocalDataColumns', False);
    FIncludeHostData := appINI.ReadBool('Customization', 'IncludeHostData', True);
    FColorBelowMinimumKills := appIni.ReadBool('Customization', 'ColorBelowMinimumKills', True);
    FUseAnalyzeHighest := appINI.ReadBool('Customization', 'UseAnalyzeHighest', True);
    FAnalyzeHighestPercent := appINI.ReadInteger('Customization', 'AnalyzeHighestPercent', 40);
    FUseAnalyzeHigh := appINI.ReadBool('Customization', 'UseAnalyzeHigh', True);
    FAnalyzeHighPercent := appINI.ReadInteger('Customization', 'AnalyzeHighPercent', 25);
    FAnalyzeMinimumKills := appINI.ReadInteger('Customization', 'AnalyzeMinimumKills', 25);
    FLazyZoneview := appIni.ReadBool('Customization', 'LazyZoneView', False);
    FExportPercentages := appIni.ReadBool('Customization', 'ExportPercentages', False);
    FFilterAnalyzer := appINI.ReadBool('Customization', 'FilterAnalyzer', False);
    FFilterAnalyzerIndex := appINI.ReadInteger('Customization', 'FilterAnalyzerIndex', 0);
    FFilterAnalyzerValue := appINI.ReadInteger('Customization', 'FilterAnalyzerValue', 25);
    FLimitInvCubeCharges := appINI.ReadBool('Customization', 'LimitInvCubeCharges', False);
    FHideBeerRealm := appINI.ReadBool('Customization', 'HideBeerRealm', True);
    FBestHuntingColumns := appINI.ReadBool('Customization', 'BestHuntingColumns', True);
    FOrderByCreature := appINI.ReadBool('Customization', 'OrderByCreature', True);
    FDynamicDataview := appINI.ReadBool('Customization', 'DynamicDataview', True);
    FDataViewItemIndex := appINI.ReadInteger('Customization', 'DataViewItemIndex', 0);
    FLastDataZone := appINI.ReadString('Customization', 'LastDataZone', '');
    FDetectSoulStatus := appINI.ReadBool('Customization', 'DetectSoulStatus', False);
    FImmortalSoulStealer := appINI.ReadBool('Customization', 'ImmortalSoulStealer', False);
    FForcedCharacterID := appINI.ReadString('Customization', 'ForcedCharacterID', '');
  finally
    appINI.Free;
  end;
end;

procedure TConfig.WriteValues(OnlyWriteAnalyzer: Boolean);
var
  appINI : TIniFile;
begin
  appINI := TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));

  try
    if OnlyWriteAnalyzer then begin
      appINI.WriteInteger('Options', 'AnalyzeScreen_Top', FAnalyzeScreen_Top);
      appINI.WriteInteger('Options', 'AnalyzeScreen_Left', FAnalyzeScreen_Left);
      appINI.WriteInteger('Options', 'AnalyzeScreen_Width', FAnalyzeScreen_Width);
      appINI.WriteInteger('Options', 'AnalyzeScreen_Height', FAnalyzeScreen_Height);
      appINI.WriteInteger('Options', 'AnalyzeScreenSortColumn', FAnalyzeScreenSortColumn);
      appINI.WriteBool('Options', 'AnalyzeScreenSortDescending', FAnalyzeScreenSortDescending);

      appINI.WriteBool('Customization', 'FilterAnalyzer', FFilterAnalyzer);
      appINI.WriteInteger('Customization', 'FilterAnalyzerIndex', FFilterAnalyzerIndex);
      appINI.WriteInteger('Customization', 'FFilterAnalyzerValue', FFilterAnalyzerValue);
    end else begin
      // Dialog settings
      appINI.WriteInteger('Options', 'MainScreen_Top', FMainScreen_Top);
      appINI.WriteInteger('Options', 'MainScreen_Left', FMainScreen_Left);
      appINI.WriteInteger('Options', 'MainScreen_Width', FMainScreen_Width);
      appINI.WriteInteger('Options', 'MainScreen_Height', FMainScreen_Height);
      appINI.WriteInteger('Options', 'ZoneViewSortColumn', FZoneViewSortColumn);
      appINI.WriteBool('Options', 'ZoneViewSortDescending', FZoneViewSortDescending);
      appINI.WriteInteger('Options', 'DataViewSortColumn', FDataViewSortColumn);
      appINI.WriteBool('Options', 'DataViewSortDescending', FDataViewSortDescending);
      appINI.WriteInteger('Options', 'InventoryScreen_Top', FInventoryScreen_Top);
      appINI.WriteInteger('Options', 'InventoryScreen_Left', FInventoryScreen_Left);
      appINI.WriteInteger('Options', 'InventoryScreen_Width', FInventoryScreen_Width);
      appINI.WriteInteger('Options', 'InventoryScreen_Height', FInventoryScreen_Height);
      appINI.WriteInteger('Options', 'InventoryScreenSortColumn', FInventoryScreenSortColumn);
      appINI.WriteBool('Options', 'InventoryScreenSortDescending', FInventoryScreenSortDescending);

      // Globals
      appINI.WriteString('Globals', 'LastStartedVersion', FLastStartedVersion);
      appINI.WriteBool('Globals', 'LogEventCreatures', FLogEventCreatures);
      //DevMode
      //AnalyzeCreatures

      // Credentials
      appINI.WriteString('Login', 'UserName', FUserName);
      appINI.WriteString('Login', 'Password', FPassword);

      // Customization
  //    appINI.WriteBool('Customization', 'ShowMenuBar', FShowMenuBar);
  //    appINI.WriteBool('Customization', 'ShowDataBoxes', FShowDataBoxes);
      appINI.WriteBool('Customization', 'ShowBrowserNavBar', FShowBrowserNavBar);
  //    appINI.WriteInteger('Customization', 'ButtonStyle', FButtonStyle);
      appINI.WriteBool('Customization', 'HostLocalDataColumns', FHostLocalDataColumns);
      appINI.WriteBool('Customization', 'IncludeHostData', FIncludeHostData);
      appINI.WriteBool('Customization', 'ColorBelowMinimumKills', FColorBelowMinimumKills);
      appINI.WriteBool('Customization', 'UseAnalyzeHighest', FUseAnalyzeHighest);
      appINI.WriteInteger('Customization', 'AnalyzeHighestPercent', FAnalyzeHighestPercent);
      appINI.WriteBool('Customization', 'UseAnalyzeHigh', FUseAnalyzeHigh);
      appINI.WriteInteger('Customization', 'AnalyzeHighPercent', FAnalyzeHighPercent);
      appINI.WriteInteger('Customization', 'AnalyzeMinimumKills', FAnalyzeMinimumKills);
      appIni.WriteBool('Customization', 'LazyZoneView', FLazyZoneview);
      appIni.WriteBool('Customization', 'ExportPercentages', FExportPercentages);
      appIni.WriteBool('Customization', 'LimitInvCubeCharges', FLimitInvCubeCharges);
      appIni.WriteBool('Customization', 'HideBeerRealm', FHideBeerRealm);
      appIni.WriteBool('Customization', 'BestHuntingColumns', FBestHuntingColumns);
      appIni.WriteBool('Customization', 'OrderByCreature', FOrderByCreature);
      appIni.WriteBool('Customization', 'DynamicDataview', FDynamicDataview);
      appIni.WriteInteger('Customization', 'DataViewItemIndex', FDataViewItemIndex);
      appIni.WriteString('Customization', 'LastDataZone', FLastDataZone);
      appIni.WriteBool('Customization', 'DetectSoulStatus', FDetectSoulStatus);
      appIni.WriteBool('Customization', 'ImmortalSoulStealer', FImmortalSoulStealer);
      appIni.WriteString('Customization', 'ForcedCharacterID', FForcedCharacterID);
    end;

  finally
    appINI.Free;
  end;
end;

end.
