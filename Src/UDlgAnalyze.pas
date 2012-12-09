unit UDlgAnalyze;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ImgList, xmldom, XMLIntf, msxmldom, XMLDoc,
  ExtCtrls, StrUtils, TeCanvas, ToolWin, ActnMan, ActnCtrls, ActnMenus,
  Menus, ActnList, OleCtrls, SHDocVw, XPMan, mshtml, contnrs,
  UConfig, CheckLst, UDataConfig, UZoneConfig;

type
  TDlgAnalyze = class(TForm)
    ImageList1: TImageList;
    XPManifest1: TXPManifest;
    ActionList1: TActionList;
    BtnCancel: TButton;
    LvAnalyze: TListView;
    BtnRefresh: TButton;
    CbxHideEnumerator: TComboBox;
    ChkHideAnalyzeItems: TCheckBox;
    EditHideItemsValue: TEdit;
    LblHideItemsTotalKills: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure LvAnalyzeChange(Sender: TObject; Item: TListItem; Change: TItemChange);
    procedure LvAnalyzeCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure LvAnalyzeColumnClick(Sender: TObject; Column: TListColumn);
    procedure LvAnalyzeAdvancedCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure LvAnalyzeAdvancedCustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure ChkHideAnalyzeItemsClick(Sender: TObject);
    procedure EditHideItemsValueChange(Sender: TObject);
  private
    { Private declarations }
    FConfig: TConfig;
    FColumnNames: TStringList;
    FInitialColumnCount: Integer;
    FZones: TZoneConfig;
    FData: TDataConfig;
//    FAnalyzeSortColumn: Integer;
//    FAnalyzeSortDescending: Boolean;
    procedure FUpdateUI();
    procedure FSetConfig(inConfig: TConfig);
    procedure FSetData(Data: TDataConfig);
    procedure FReloadData();
    procedure FSaveSettings();
  public
    { Public declarations }
    procedure FDoUpdate();
    property Zones: TZoneConfig write FZones;
    property Data: TDataConfig write FSetData;
    property Config: TConfig write FSetConfig;
  end;

implementation

uses
  Math, UStrings, IDHttp;

{$R *.dfm}

// TDlgAnalyze

procedure TDlgAnalyze.FormCreate(Sender: TObject);
begin
  FInitialColumnCount := LvAnalyze.Columns.Count;

  // Get from config
//  FAnalyzeSortDescending := False;
//  FAnalyzeSortColumn := 0;

  CbxHideEnumerator.Clear();
  CbxHideEnumerator.Items.Add('<=');
  CbxHideEnumerator.Items.Add('>=');
  CbxHideEnumerator.Items.Add('==');
  CbxHideEnumerator.ItemIndex := 0;

  EditHideItemsValue.Text := '25';

  FUpdateUI();
end;

procedure TDlgAnalyze.FormDestroy(Sender: TObject);
begin
  FSaveSettings();
  FColumnNames.Free();
end;

procedure TDlgAnalyze.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := False;
  FSaveSettings();
// FConfig.AnalyzeScreenSortColumn
// FConfig.AnalyzeScreenSortDescending
  Self.Hide();
end;

procedure TDlgAnalyze.FSaveSettings();
begin
  FConfig.AnalyzeScreen_Top := Self.Top;
  FConfig.AnalyzeScreen_Left := Self.Left;
  FConfig.AnalyzeScreen_Width := Self.Width;
  FConfig.AnalyzeScreen_Height := Self.Height;

  FConfig.FilterAnalyzer := ChkHideAnalyzeItems.Checked;
  FConfig.FilterAnalyzerValue := StrToIntDef(EditHideItemsValue.Text, 25);
  FConfig.FilterAnalyzerIndex := CbxHideEnumerator.ItemIndex;
  FConfig.WriteValues(True);
end;

procedure TDlgAnalyze.FSetConfig(inConfig: TConfig);
var
  I: Integer;
  LC: TListColumn;
begin
  FConfig := inConfig;

  if FConfig.AnalyzeScreen_Top > 0 then
    Self.Top := FConfig.AnalyzeScreen_Top;
  if FConfig.AnalyzeScreen_Left > 0 then
    Self.Left := FConfig.AnalyzeScreen_Left;
  if FConfig.AnalyzeScreen_Width > 0 then
    Self.Width := FConfig.AnalyzeScreen_Width;
  if FConfig.AnalyzeScreen_Height > 0 then
    Self.Height := FConfig.AnalyzeScreen_Height;

  ChkHideAnalyzeItems.Checked := inConfig.FilterAnalyzer;
  EditHideItemsValue.Text := IntToStr(inConfig.FilterAnalyzerValue);
  CbxHideEnumerator.ItemIndex := inConfig.FilterAnalyzerIndex;

  FColumnNames := TStringList.Create();
  FColumnNames.CommaText := FConfig.AnalyzeCreatures;

  LvAnalyze.Columns.BeginUpdate;

  // Only remove the "extra" columns
  for I:=LvAnalyze.Columns.Count-1 downto 4 do
    LvAnalyze.Columns.Delete(I);

  // Create the columns
  if FConfig.BestHuntingColumns then begin
    LC := LvAnalyze.Columns.Add;
    LC.Caption := 'Best';
    LC.Width := 110;
    LC.Alignment := taRightJustify;
    LC := LvAnalyze.Columns.Add;
    LC.Caption := '2nd Best';
    LC.Width := 110;
    LC.Alignment := taRightJustify;
  end else begin
    for I:=0 to FColumnNames.Count-1 do begin
      LC := LvAnalyze.Columns.Add;
      LC.Caption := FColumnNames[i];
      LC.Width := 90;
      LC.Alignment := taRightJustify;
    end;
  end;

  LvAnalyze.Columns.EndUpdate;
end;

procedure TDlgAnalyze.FSetData(Data: TDataConfig);
begin
  FData := Data;
  FReloadData();
end;

procedure TDlgAnalyze.FReloadData();

  function FFCalcPercent(Kills, Total: Integer): String;
  begin
    Result := FormatFloat('0.00', (Kills/Total)*100);
  end;

  procedure FFListAddItem(Data: TDataList; Zone, SubZone, LevelRange: String);
  var
    Li: TListItem;
    I, TotalKills: Integer;
    Item: TDataRow;
    HighestKills, SecondHighestKills, TempKills: Integer;
    HighestKillsName, SecondHighestKillsName: String;
  begin
    TotalKills := Data.GetTotalKills(FConfig.IncludeHostData);

    if ChkHideAnalyzeItems.Checked and (StrToIntDef(EditHideItemsValue.Text, -99) <> -99) then begin
      if CbxHideEnumerator.ItemIndex = 0 then begin
        if TotalKills <= StrToInt(EditHideItemsValue.Text) then
          Exit;
      end else if CbxHideEnumerator.ItemIndex = 1 then begin
        if TotalKills >= StrToInt(EditHideItemsValue.Text) then
          Exit;
      end else begin
        if TotalKills = StrToInt(EditHideItemsValue.Text) then
          Exit;
      end;
    end;

    Li := LvAnalyze.Items.Add;
    Li.Caption := Zone;
    Li.SubItems.Add(SubZone);
    Li.SubItems.Add(LevelRange);
    Li.SubItems.Add(IntToStr(TotalKills));

    HighestKills := 0;
    SecondHighestKills := 0;

    for i:=0 to FColumnNames.Count-1 do begin
      Item := Data.GetItemByCreature(FColumnNames[I]);

      if FConfig.BestHuntingColumns then begin
        if (Item <> nil) and (TotalKills >= FConfig.AnalyzeMinimumKills) then begin
          if FConfig.IncludeHostData then
            TempKills := Item.HostKills+Item.LocalKills
          else
            TempKills := Item.LocalKills;

          if TempKills > HighestKills then begin
            SecondHighestKills := HighestKills;
            HighestKills := TempKills;
            SecondHighestKillsName := HighestKillsName;
            HighestKillsName := FColumnNames[I];
          end else if TempKills > SecondHighestKills then begin
            SecondHighestKills := TempKills;
            SecondHighestKillsName := FColumnNames[I];
          end;
        end;
      end else begin
        if Item <> nil then begin
          if TotalKills < FConfig.AnalyzeMinimumKills then
            Li.SubItems.Add('0')
          else begin
            if FConfig.IncludeHostData then
              Li.SubItems.Add(FFCalcPercent(Item.HostKills + Item.LocalKills, TotalKills))
            else
              Li.SubItems.Add(FFCalcPercent(Item.LocalKills, TotalKills));
          end;
        end else
          Li.SubItems.Add('0');
      end;
    end;

    if FConfig.BestHuntingColumns then begin
      Li.SubItems.Add(HighestKillsName + ' (' + FFCalcPercent(HighestKills, TotalKills) + ')');
      Li.SubItems.Add(SecondHighestKillsName + ' (' + FFCalcPercent(SecondHighestKills, TotalKills) + ')');
    end;

  end;

var
  ZoneData: TDataList;
  ZoneList: TObjectList;
  I: Integer;
begin
  ZoneList := TObjectList.Create();
  ZoneData := TDataList.Create();

  LvAnalyze.Clear;
  try
    FZones.GetZoneNames(ZoneList, True);

    for i:=0 to ZoneList.Count-1 do begin
      ZoneData.Clear();
      FData.GetZoneData(ZoneData, TZoneObj(ZoneList[i]).Name);

      if TZoneObj(ZoneList[i]).AmSubZone then begin
        if not SameText(TZoneObj(ZoneList[i]).Parent, StrBeerDragonRealms) or not FConfig.HideBeerRealm then
          FFListAddItem(ZoneData, TZoneObj(ZoneList[i]).Parent, TZoneObj(ZoneList[i]).Name, TZoneObj(ZoneList[i]).LevelRange)
      end else begin
        if not SameText(TZoneObj(ZoneList[i]).Name, StrBeerDragonRealms) or not FConfig.HideBeerRealm then
          FFListAddItem(ZoneData, TZoneObj(ZoneList[i]).Name, '', TZoneObj(ZoneList[i]).LevelRange);
      end;
    end;
  finally
    ZoneList.Free();
    ZoneData.Free();
  end;

  // Re-set the sorting
  LvAnalyze.SortType := stNone;
  LvAnalyze.SortType := stData;
end;

procedure TDlgAnalyze.BtnCancelClick(Sender: TObject);
begin
  Self.Hide();
end;

procedure TDlgAnalyze.BtnRefreshClick(Sender: TObject);
begin
  FReloadData();
end;

procedure TDlgAnalyze.ChkHideAnalyzeItemsClick(Sender: TObject);
begin
  FUpdateUI();
end;

procedure TDlgAnalyze.EditHideItemsValueChange(Sender: TObject);
begin
  FUpdateUI();
end;

procedure TDlgAnalyze.FDoUpdate();
begin
  FUpdateUI();
end;

procedure TDlgAnalyze.FUpdateUI();
begin
  CbxHideEnumerator.Enabled := ChkHideAnalyzeItems.Checked;
  EditHideItemsValue.Enabled := ChkHideAnalyzeItems.Checked;
  LblHideItemsTotalKills.Enabled := ChkHideAnalyzeItems.Checked;

  BtnRefresh.Enabled := not ChkHideAnalyzeItems.Checked or (StrToIntDef(EditHideItemsValue.Text, -99) <> -99);
end;

procedure TDlgAnalyze.LvAnalyzeAdvancedCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
  // Draw alternating row colors: White and Gray
  if Item.Index mod 2=0 then
    Sender.Canvas.Brush.Color := $F6F6F6
  else
    Sender.Canvas.Brush.Color := clWhite;
end;

procedure TDlgAnalyze.LvAnalyzeAdvancedCustomDrawSubItem( Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
var
  UseColor, Pos1: Integer;
  val: String;
begin
  if SubItem = 3 then begin
    if FConfig.ColorBelowMinimumKills and (StrToFloatDef(Item.SubItems[SubItem-1], 0) < FConfig.AnalyzeMinimumKills) then begin
      // Red
      if Item.Index mod 2=0 then
        Sender.Canvas.Brush.Color := $9C9CF6
      else
        Sender.Canvas.Brush.Color := $AAAAFF;
    end;
  end else if SubItem > 3 then begin
    // Protection for "during lauch" calls.
    if SubItem > Item.Subitems.Count then
      Exit;

    UseColor := 0;

    if FConfig.BestHuntingColumns then begin
      Pos1 := Pos('(', Item.SubItems[SubItem-1]);
      Val := Copy(Item.SubItems[SubItem-1], pos1+1,
           Length(Item.SubItems[SubItem-1])-pos1-1);
    end else
      Val := Item.SubItems[SubItem-1];

    if FConfig.UseAnalyzeHighest and FConfig.UseAnalyzeHigh and (FConfig.AnalyzeHighestPercent > FConfig.AnalyzeHighPercent) then begin
      if FConfig.UseAnalyzeHigh and (StrToFloatDef(Val, 0) >= FConfig.AnalyzeHighPercent) then
        UseColor := 2;
      if FConfig.UseAnalyzeHighest and (StrToFloatDef(Val, 0) >= FConfig.AnalyzeHighestPercent) then
        UseColor := 1;
    end else begin
      if FConfig.UseAnalyzeHighest and (StrToFloatDef(Val, 0) >= FConfig.AnalyzeHighestPercent) then
        UseColor := 1;
      if FConfig.UseAnalyzeHigh and (StrToFloatDef(Val, 0) >= FConfig.AnalyzeHighPercent) then
        UseColor := 2;
    end;

    case UseColor of
      0:  // White & Gray
      begin
        if Item.Index mod 2=0 then
          Sender.Canvas.Brush.Color := $F6F6F6
        else
          Sender.Canvas.Brush.Color := clWhite;
      end;
      1:  // Green
      begin
        if Item.Index mod 2=0 then
          Sender.Canvas.Brush.Color := $BBEEBB
        else
          Sender.Canvas.Brush.Color := $CCFFCC;
      end;
      2:  // Blue
      begin
        if Item.Index mod 2=0 then
          Sender.Canvas.Brush.Color := $EEBBBB
        else
          Sender.Canvas.Brush.Color := $FFCCCC;
      end;
    end;
  end;
end;

procedure TDlgAnalyze.LvAnalyzeChange(Sender: TObject; Item: TListItem; Change: TItemChange);
begin
  FUpdateUI();
end;

procedure TDlgAnalyze.LvAnalyzeColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  TListView(Sender).SortType := stNone;
  if Column.Index <> FConfig.AnalyzeScreenSortColumn then begin
    FConfig.AnalyzeScreenSortColumn := Column.Index;
    FConfig.AnalyzeScreenSortDescending := False;
  end else
    FConfig.AnalyzeScreenSortDescending := not FConfig.AnalyzeScreenSortDescending;
  TListView(Sender).SortType := stData;
end;

procedure TDlgAnalyze.LvAnalyzeCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
var
  val1, val2: Integer;
  val3, val4: String;
  pos1: Integer;
begin
  Compare := 0;
  if FConfig.AnalyzeScreenSortColumn = 0 then
    Compare := CompareText(Item1.Caption, Item2.Caption)
  else if FConfig.AnalyzeScreenSortColumn = 2 then begin
    // lvl
    val1 := StrToIntDef(Copy(Item1.SubItems[FConfig.AnalyzeScreenSortColumn-1], 0, 2), -1);
    if val1 = -1 then
      val1 := StrToIntDef(Copy(Item1.SubItems[FConfig.AnalyzeScreenSortColumn-1], 0, 1), -1);

    val2 := StrToIntDef(Copy(Item2.SubItems[FConfig.AnalyzeScreenSortColumn-1], 0, 2), -1);
    if val2 = -1 then
      val2 := StrToIntDef(Copy(Item2.SubItems[FConfig.AnalyzeScreenSortColumn-1], 0, 1), -1);

    if val1 < val2 then
      Compare := 1
    else if val1 > val2 then
      Compare := -1
    else
      Compare := 0;
  end else if (FConfig.AnalyzeScreenSortColumn <= 2) and (Item1.SubItems.Count >= FConfig.AnalyzeScreenSortColumn) then
    Compare := CompareText(Item1.SubItems[FConfig.AnalyzeScreenSortColumn-1], Item2.SubItems[FConfig.AnalyzeScreenSortColumn-1])
  else if (Item1.SubItems.Count >= FConfig.AnalyzeScreenSortColumn) then begin
    if not FConfig.BestHuntingColumns or not FConfig.ColorByCreature then begin
      if FConfig.BestHuntingColumns then begin
        pos1 := Pos('(', Item1.SubItems[FConfig.AnalyzeScreenSortColumn-1]);
        val3 := Copy(Item1.SubItems[FConfig.AnalyzeScreenSortColumn-1], pos1+1,
              Length(Item1.SubItems[FConfig.AnalyzeScreenSortColumn-1])-pos1-1);
        pos1 := Pos('(', Item2.SubItems[FConfig.AnalyzeScreenSortColumn-1]);
        val4 := Copy(Item2.SubItems[FConfig.AnalyzeScreenSortColumn-1], pos1+1,
              Length(Item2.SubItems[FConfig.AnalyzeScreenSortColumn-1])-pos1-1);
      end else begin
        val3 := Item1.SubItems[FConfig.AnalyzeScreenSortColumn-1];
        val4 := Item2.SubItems[FConfig.AnalyzeScreenSortColumn-1];
      end;

      if StrToFloatDef(val3, 0) < StrToFloatDef(val4, 0) then
        Compare := 1
      else if StrToFloatDef(val3, 0) > StrToFloatDef(val4, 0) then
        Compare := -1
      else
        Compare := 0;
    end else
      Compare := CompareText(Item1.SubItems[FConfig.AnalyzeScreenSortColumn-1], Item2.SubItems[FConfig.AnalyzeScreenSortColumn-1]);
  end;

  if FConfig.AnalyzeScreenSortDescending then
    Compare := -Compare;
end;

end.
