unit UZoneConfig;

interface

uses
  Inifiles, Classes, contnrs;

type
  TZoneObj = class(TObject)
  private
    { Private declarations }
    FName: String;
    FLevelRange: String;
    FParent: String;
    FAmSubZone: Boolean;
  public
    { Public declarations }
    property Name: String read FName write FName;
    property LevelRange: String read FLevelRange write FLevelRange;
    property AmSubZone: Boolean read FAmSubZone write FAmSubZone;
    property Parent: String read FParent write FParent;
  end;

  TZoneConfig = class(TObject)
  private
    { Private declarations }
    dataIni: TIniFile;
  public

    { Public declarations }
    procedure Initialize();
    procedure Cleanup();
    procedure GetZoneNames(var ZoneData: TObjectList; IncludeMainZones: Boolean);
  end;

implementation

uses
  SysUtils, Forms;

procedure TZoneConfig.Initialize();
begin
  dataIni := TIniFile.Create(ChangeFileExt(Application.ExeName,'_Zones.ini'));
end;

procedure TZoneConfig.Cleanup();
begin
  dataIni.Free;
end;

procedure TZoneConfig.GetZoneNames(var ZoneData: TObjectList; IncludeMainZones: Boolean);
var
  MainZones, SubZones: TStringList;
  ZoneObject: TZoneObj;
  I,J: Integer;
begin
  MainZones := TStringList.Create();
  SubZones := TStringList.Create();
  try
    dataIni.ReadSections(MainZones);

    for I := 0 to MainZones.Count - 1 do begin
      // Get subzones for this zone
      dataIni.ReadSection(MainZones[I], SubZones);

      // Include main zones in list of names?
      if IncludeMainZones then begin
        ZoneObject := TZoneObj.Create;

        ZoneObject.FName := MainZones[I];
        ZoneObject.FLevelRange := dataIni.ReadString(MainZones[I], 'Lvl', '?');
        ZoneObject.FAmSubZone := False;
        ZoneData.Add(ZoneObject);
      end;

      // Add the subzones by name
      for J := 0 to SubZones.Count - 1 do begin
        if SubZones[J] <> 'Lvl' then begin
          ZoneObject := TZoneObj.Create;
          ZoneObject.FName := SubZones[J];
          ZoneObject.FLevelRange := dataIni.ReadString(MainZones[I], SubZones[J], '?');
          ZoneObject.FAmSubZone := True;
          ZoneObject.FParent := MainZones[I];
          ZoneData.Add(ZoneObject);
        end;
      end;
    end;
  finally
    MainZones.Free();
    SubZones.Free();
  end;
end;

end.
