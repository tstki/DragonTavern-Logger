unit UDataConfig;

interface

uses
  Inifiles, Classes, contnrs;

type
  TDataRow = class(TObject)
  private
    { Private declarations }
    FCreatureName: String;
    FHostKills: Integer;
    FLocalKills: Integer;
  public
    { Public declarations }
    Constructor Create(Name:String; HostKills, LocalKills: Integer); overload;
    property CreatureName: String read FCreatureName write FCreatureName;
    property HostKills: Integer read FHostKills write FHostKills;
    property LocalKills: Integer read FLocalKills write FLocalKills;
  end;

  TDataList = class(TObjectList)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AddItem(CreatureName: String; HostKills, LocalKills: Integer);
    procedure MergeValue(CreatureName: String; HostKills, LocalKills: Integer);
    function GetItemByCreature(CreatureName: String): TDataRow;
    function GetTotalKills(IncludeHostData: Boolean): Integer;
  end;

  TDataConfig = class(TObject)
  private
    { Private declarations }
    dataHostIni: TIniFile;
    dataLocalIni: TIniFile;
  public
    { Public declarations }
    procedure Initialize();
    procedure Cleanup();
    procedure AddValue(zoneName, creatureType: String);
    procedure GetZoneData(var ZoneData: TDataList; ZoneName: String);
    procedure DoMerge();
  end;

implementation

uses
  SysUtils, Forms;

Constructor TDataRow.Create(Name: String; HostKills, LocalKills: Integer);
begin
  inherited Create();

  FCreatureName := Name;
  FHostKills := HostKills;
  FLocalKills := LocalKills;
end;

//

procedure TDataList.AddItem(CreatureName: String; HostKills, LocalKills: Integer);
var
  newItem: TDataRow;
begin
  newItem := TDataRow.Create();
  newItem.CreatureName := CreatureName;
  newItem.HostKills := HostKills;
  newItem.LocalKills := LocalKills;

  Self.Add(newItem);
end;

procedure TDataList.MergeValue(CreatureName: String; HostKills, LocalKills: Integer);
var
  I: Integer;
  Found: Boolean;
begin
  Found := False;
  for I := 0 to Self.Count-1 do begin
    if CompareText(TDataRow(Self.Items[i]).CreatureName, CreatureName) = 0 then begin
      TDataRow(Self.Items[i]).HostKills := TDataRow(Self.Items[i]).HostKills + HostKills;
      TDataRow(Self.Items[i]).LocalKills := TDataRow(Self.Items[i]).LocalKills + LocalKills;

      Found := True;
      break;
    end;
  end;

  if not Found then
    AddItem(CreatureName, HostKills, LocalKills);
end;

function TDataList.GetItemByCreature(CreatureName: String): TDataRow;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Count-1 do begin
    if TDataRow(Items[i]).CreatureName = CreatureName then begin
      Result := TDataRow(Items[i]);
      break;
    end;
  end;
end;

function TDataList.GetTotalKills(IncludeHostData: Boolean): Integer;
var
  I, TotalCount: Integer;
begin
  TotalCount := 0;

  for I := 0 to Count-1 do begin
    if IncludeHostData then
      TotalCount := TotalCount + TDataRow(Items[i]).FHostKills;
    TotalCount := TotalCount + TDataRow(Items[i]).FLocalKills;
  end;

  Result := TotalCount;
end;

//

procedure TDataConfig.Initialize();
begin
  dataHostIni := TIniFile.Create(ChangeFileExt(Application.ExeName,'_Data.ini'));
  dataLocalIni := TIniFile.Create(ChangeFileExt(Application.ExeName,'_DataLocal.ini'));
end;

procedure TDataConfig.Cleanup();
begin
  dataHostIni.Free;
  dataLocalIni.Free;
end;

procedure TDataConfig.GetZoneData(var ZoneData: TDataList; ZoneName: String);
var
  ZoneCreatures: TStringList;
  I: Integer;
begin
  ZoneCreatures := TStringList.Create();
  try
    dataHostIni.ReadSection(ZoneName, ZoneCreatures);

    // Read host data
    for I := 0 to ZoneCreatures.Count-1 do
      ZoneData.AddItem(ZoneCreatures[I], dataHostIni.ReadInteger(ZoneName, ZoneCreatures[I], 0), 0);

    // Read local data and add it to the result
    dataLocalIni.ReadSection(ZoneName, ZoneCreatures);
    for I := 0 to ZoneCreatures.Count-1 do
      ZoneData.MergeValue(ZoneCreatures[I], 0, dataLocalIni.ReadInteger(ZoneName, ZoneCreatures[I], 0));
  finally
    ZoneCreatures.Free();
  end;
end;

procedure TDataConfig.AddValue(zoneName, creatureType: String);
var
  curVal: Integer;
begin
  // Add one count to the local data file.
  curVal := dataLocalIni.ReadInteger(zoneName, creatureType, 0);
  dataLocalIni.WriteInteger(zoneName, creatureType, curVal+1);
end;

procedure TDataConfig.DoMerge();
var
  ZoneNames, ZoneCreatures: TStringList;
  I, J, curHostVal, curLocalVal: Integer;
begin
  // Merge the local data into the hosts file, and set the local data to "0"
  ZoneNames := TStringList.Create();
  ZoneCreatures := TStringList.Create();

  try
    dataLocalIni.ReadSections(ZoneNames);

    for I:=0 to ZoneNames.Count-1 do begin
      dataLocalIni.ReadSection(ZoneNames[i], ZoneCreatures);

      for J:=0 to ZoneCreatures.Count-1 do begin
        curHostVal := dataHostIni.ReadInteger(ZoneNames[i], ZoneCreatures[j], 0);
        curLocalVal := dataLocalIni.ReadInteger(ZoneNames[i], ZoneCreatures[j], 0);

        dataHostIni.WriteInteger(ZoneNames[i], ZoneCreatures[j], curHostVal + curLocalVal);
        dataLocalIni.WriteInteger(ZoneNames[i], ZoneCreatures[j], 0);
      end;
    end;

  finally
    ZoneCreatures.Free();
    ZoneNames.Free();
  end;
end;


end.
