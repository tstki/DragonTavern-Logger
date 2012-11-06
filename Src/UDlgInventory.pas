unit UDlgInventory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ImgList, xmldom, XMLIntf, msxmldom, XMLDoc,
  ExtCtrls, StrUtils, TeCanvas, ToolWin, ActnMan, ActnCtrls, ActnMenus,
  Menus, ActnList, OleCtrls, SHDocVw, XPMan, mshtml, contnrs,
  UConfig, CheckLst;

type
  TInvItem = class(TObject)
    RecycleUrl: String;
    Name: String;
    Rarity: Integer;
    Value: Integer;
    Weight: Integer;
  end;

  TInvItemList = class(TObjectList)
    public
      procedure AddItem(RecycleUrl, Name: String; Rarity, Value, Weight: Integer);
  end;

  TDlgInventory = class(TForm)
    ImageList1: TImageList;
    XPManifest1: TXPManifest;
    ActionList1: TActionList;
    BtnOK: TButton;
    BtnCancel: TButton;
    LvInventory: TListView;
    LblCubeChargesCap: TLabel;
    LblSelectByWeight: TLabel;
    LblItemsSelected: TLabel;
    LblCubeCharges: TLabel;
    LblItemsSelectedCount: TLabel;
    BtnSelectWeight13: TButton;
    BtnSelectWeight12: TButton;
    BtnSelectWeight11: TButton;
    BtnUnselectAll: TButton;
    BtnSelectWeight10: TButton;
    LblChargesLeftWarning: TLabel;
    BtnSelectItemsCommon: TButton;
    BtnSelectWeight9: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LvInventoryChange(Sender: TObject; Item: TListItem; Change: TItemChange);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnSelectWeight9Click(Sender: TObject);
    procedure BtnSelectWeight10Click(Sender: TObject);
    procedure BtnSelectWeight11Click(Sender: TObject);
    procedure BtnSelectWeight12Click(Sender: TObject);
    procedure BtnSelectWeight13Click(Sender: TObject);
    procedure BtnUnselectAllClick(Sender: TObject);
    procedure BtnSelectItemsCommonClick(Sender: TObject);
    procedure LvInventoryCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure LvInventoryColumnClick(Sender: TObject; Column: TListColumn);
    procedure LvInventoryAdvancedCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
  private
    { Private declarations }
    FConfig: TConfig;
    FItemList: TInvItemList;
    FUrls: TSTringList;
    FCubeCurCharges: Integer;
    FCubeMaxCharges: Integer;
    procedure FUpdateUI();
    procedure FSetItemList(Items: TInvItemList);
    procedure FSelectByWeight(Weight: Integer);
    procedure FSetConfig(inConfig: TConfig);
    function GetSelItemCount(): Integer;
  public
    { Public declarations }
    procedure FDoUpdate();
    property ItemList: TInvItemList write FSetItemList;
    property Urls: TStringList write FUrls;
    property CubeCurCharges: Integer write FCubeCurCharges;
    property CubeMaxCharges: Integer write FCubeMaxCharges;
    property Config: TConfig write FSetConfig;
  end;

implementation

uses
  Math, UStrings, IDHttp;

{$R *.dfm}

// TInvItemList

procedure TInvItemList.AddItem(RecycleUrl, Name: string; Rarity: Integer; Value: Integer; Weight: Integer);
var
  Item: TInvItem;
begin
  Item := TInvItem.Create;
  Item.RecycleUrl := RecycleUrl;
  Item.Name := Name;
  Item.Rarity := Rarity;
  Item.Value := Value;
  Item.Weight := Weight;

  Add(Item);
end;

// TDlgInventory

procedure TDlgInventory.FormCreate(Sender: TObject);
begin
  FUpdateUI();
end;

procedure TDlgInventory.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FConfig.InventoryScreen_Top := Self.Top;
  FConfig.InventoryScreen_Left := Self.Left;
  FConfig.InventoryScreen_Width := Self.Width;
  FConfig.InventoryScreen_Height := Self.Height;
end;

procedure TDlgInventory.FDoUpdate();
begin
  FUpdateUI();
end;

procedure TDlgInventory.FSetConfig(inConfig: TConfig);
begin
  FConfig := inConfig;

  if FConfig.InventoryScreen_Top > 0 then
    Self.Top := FConfig.InventoryScreen_Top;
  if FConfig.InventoryScreen_Left > 0 then
    Self.Left := FConfig.InventoryScreen_Left;
  if FConfig.InventoryScreen_Width > 0 then
    Self.Width := FConfig.InventoryScreen_Width;
  if FConfig.InventoryScreen_Height > 0 then
    Self.Height := FConfig.InventoryScreen_Height;
end;

procedure TDlgInventory.BtnOKClick(Sender: TObject);
var
  I: Integer;
begin
  FUrls.Clear;
  for I := 0 to LvInventory.Items.Count-1 do begin
    if LvInventory.Items[I].Checked then
      FUrls.Add(LvInventory.Items[I].SubItems[4]);
  end;
end;

function TDlgInventory.GetSelItemCount(): Integer;
var
  I: Integer;
begin
  Result := 0;

  for I := 0 to LvInventory.Items.Count-1 do
    if LvInventory.Items[I].Checked then
      Inc(Result);
end;

procedure TDlgInventory.FUpdateUI();
var
  I, SelCount: Integer;
begin
  SelCount := GetSelItemCount();
  LblItemsSelectedCount.Caption := IntToStr(SelCount);
  LblCubeCharges.Caption := IntToStr(FCubeCurCharges) + '/' + IntToStr(FCubeMaxCharges);

  LblChargesLeftWarning.Visible := (SelCount > FCubeCurCharges) and (FCubeMaxCharges <> 0);

  // Hide certain buttons if you do not own a cube.
  LblCubeChargesCap.Visible := FCubeMaxCharges <> 0;
  LblCubeCharges.Visible := LblCubeChargesCap.Visible;
  BtnUnselectAll.Visible := LblCubeChargesCap.Visible;
  BtnSelectWeight13.Visible := LblCubeChargesCap.Visible;
  BtnSelectWeight12.Visible := LblCubeChargesCap.Visible;
  BtnSelectWeight11.Visible := LblCubeChargesCap.Visible;
  BtnSelectWeight10.Visible := LblCubeChargesCap.Visible;
  BtnSelectWeight9.Visible := LblCubeChargesCap.Visible;
  BtnSelectItemsCommon.Visible := LblCubeChargesCap.Visible;
  LblSelectByWeight.Visible := LblCubeChargesCap.Visible;

  // We don't need checkboxes if we can't send items into the cube.
  LvInventory.Checkboxes := LblCubeChargesCap.Visible;
  if not LblCubeChargesCap.Visible then begin
    BtnOK.Caption := 'OK';
    LblItemsSelected.Caption := 'Items carried:';
  end;

  BtnOK.Enabled := SelCount > 0;
end;

procedure TDlgInventory.LvInventoryAdvancedCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
  // Draw alternating row colors.
  if Item.Index mod 2=0 then
    Sender.Canvas.Brush.Color := $F6F6F6
  else
    Sender.Canvas.Brush.Color := clWhite;
end;

procedure TDlgInventory.LvInventoryChange(Sender: TObject; Item: TListItem; Change: TItemChange);
begin
  FUpdateUI();
end;

procedure TDlgInventory.FSetItemList(Items: TInvItemList);
var
  I: Integer;
  Item: TListItem;
  ValPerWeight: Extended;
begin
  FItemList := Items;

  for I := 0 to Items.Count - 1 do begin
    Item := LvInventory.Items.Add;
    // Name
    Item.Caption := TInvItem(Items[I]).Name;
    // Rarity
    case (TInvItem(Items[I]).Rarity) of
      1:
        Item.SubItems.Add('C');
      2:
        Item.SubItems.Add('R');
      3:
        Item.SubItems.Add('E');
      else
        Item.SubItems.Add('?');
    end;

    // Weight
    Item.SubItems.Add(IntToStr(TInvItem(Items[I]).Weight));
    // Value
    Item.SubItems.Add(IntToStr(TInvItem(Items[I]).Value));

    // Calc value
    ValPerWeight := IfThen(TInvItem(Items[I]).Value = 0, 1, TInvItem(Items[I]).Value) / TInvItem(Items[I]).Weight;
    Item.SubItems.Add(FormatFloat('0.00', ValPerWeight));

    // url(invisible)
    Item.SubItems.Add(TInvItem(Items[I]).RecycleUrl);
  end;

  // Re-set the sorting
  LvInventory.SortType := stNone;
  LvInventory.SortType := stData;
end;

procedure TDlgInventory.FSelectByWeight(Weight: Integer);
var
  I: Integer;
  InitialCountZero: Boolean;
  SelCount: Integer;
begin
  SelCount := GetSelItemCount();
  InitialCountZero := SelCount = 0;

  // Select all items by a specified weight
  for I := 0 to LvInventory.Items.Count-1 do begin
    if StrToIntDef(LvInventory.Items[I].SubItems[1], 0) >= Weight then begin
      if not FConfig.LimitInvCubeCharges or not InitialCountZero or (SelCount < FCubeCurCharges) then begin
        LvInventory.Items[I].Checked := True;
        Inc(SelCount);
      end;
    end;
  end;
end;

procedure TDlgInventory.BtnUnselectAllClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to LvInventory.Items.Count-1 do
    LvInventory.Items[I].Checked := False;
end;

procedure TDlgInventory.BtnSelectWeight13Click(Sender: TObject);
begin
  FSelectByWeight(13);
end;

procedure TDlgInventory.BtnSelectWeight12Click(Sender: TObject);
begin
  FSelectByWeight(12);
end;

procedure TDlgInventory.BtnSelectWeight11Click(Sender: TObject);
begin
  FSelectByWeight(11);
end;

procedure TDlgInventory.BtnSelectWeight10Click(Sender: TObject);
begin
  FSelectByWeight(10);
end;

procedure TDlgInventory.BtnSelectWeight9Click(Sender: TObject);
begin
  FSelectByWeight(9);
end;

procedure TDlgInventory.BtnSelectItemsCommonClick(Sender: TObject);
var
  I: Integer;
begin
  // Select all items by a specified weight
  for I := 0 to LvInventory.Items.Count-1 do begin
    if LvInventory.Items[I].SubItems[0] = 'C' then
      LvInventory.Items[I].Checked := True;
  end;
end;

procedure TDlgInventory.LvInventoryColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  TListView(Sender).SortType := stNone;
  if Column.Index <> FConfig.InventoryScreenSortColumn then begin
    FConfig.InventoryScreenSortColumn := Column.Index;
    FConfig.InventoryScreenSortDescending := False;
  end else
    FConfig.InventoryScreenSortDescending := not FConfig.InventoryScreenSortDescending;
  TListView(Sender).SortType := stData;
end;

procedure TDlgInventory.LvInventoryCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  Compare := 0;
  if FConfig.InventoryScreenSortColumn = 0 then
    Compare := CompareText(Item1.Caption, Item2.Caption)
  else if (FConfig.InventoryScreenSortColumn = 1) and (Item1.SubItems.Count >= FConfig.InventoryScreenSortColumn) then
    Compare := CompareText(Item1.SubItems[FConfig.InventoryScreenSortColumn-1], Item2.SubItems[FConfig.InventoryScreenSortColumn-1])
  else if (Item1.SubItems.Count >= FConfig.InventoryScreenSortColumn) then begin
    if StrToFloatDef(Item1.SubItems[FConfig.InventoryScreenSortColumn-1],0) < StrToFloatDef(Item2.SubItems[FConfig.InventoryScreenSortColumn-1],0) then
      Compare := 1
    else if StrToFloatDef(Item1.SubItems[FConfig.InventoryScreenSortColumn-1],0) > StrToFloatDef(Item2.SubItems[FConfig.InventoryScreenSortColumn-1],0) then
      Compare := -1
    else
      Compare := 0;
  end;

  if FConfig.InventoryScreenSortDescending then Compare := -Compare;
end;

end.
