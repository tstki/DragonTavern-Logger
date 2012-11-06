unit UDlgTitles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ImgList, xmldom, XMLIntf, msxmldom, XMLDoc,
  ExtCtrls, StrUtils, TeCanvas, ToolWin, ActnMan, ActnCtrls, ActnMenus,
  Menus, ActnList, OleCtrls, SHDocVw, XPMan, mshtml, contnrs,
  UConfig, CheckLst;

const
  ttKnownOwned = 0;
  ttKnownNotOwned = 1;
  ttUnknownOwned = 2;

type
  TTitleItem = class(TObject)
    UseUrl: String;
    Name: String;
    TitleType: String;
    Description: String;
    EarnedStatus: Integer;
  end;

  TTitleList = class(TObjectList)
    public
      procedure AddItem(UseUrl, Name, TitleType, Description: string);
  end;

  TDlgTitles = class(TForm)
    ImageList1: TImageList;
    XPManifest1: TXPManifest;
    ActionList1: TActionList;
    BtnOK: TButton;
    BtnCancel: TButton;
    LvInventory: TListView;
    LblTitlesCap: TLabel;
    LblTitlesEarnedCount: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LvInventoryChange(Sender: TObject; Item: TListItem; Change: TItemChange);
    procedure BtnOKClick(Sender: TObject);
    procedure LvInventoryCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure LvInventoryColumnClick(Sender: TObject; Column: TListColumn);
    procedure LvInventoryAdvancedCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
  private
    { Private declarations }
    FConfig: TConfig;
    FItemList: TTitleList;
    FUrls: TSTringList;
    procedure FUpdateUI();
    procedure FSetItemList(Items: TTitleList);
    procedure FSetConfig(inConfig: TConfig);
  public
    { Public declarations }
    procedure FDoUpdate();
    property ItemList: TTitleList write FSetItemList;
    property Urls: TStringList write FUrls;
    property Config: TConfig write FSetConfig;
  end;

implementation

uses
  Math, UStrings, IDHttp;

{$R *.dfm}

// TInvItemList

procedure TTitleList.AddItem(UseUrl, Name, TitleType, Description: string );
var
  Item: TTitleItem;
begin
  Item := TTitleItem.Create;
  Item.UseUrl := UseUrl;
  Item.Name := Name;
  Item.TitleType := TitleType;
  Item.Description := Description;

  Add(Item);
end;

// TDlgTitles

procedure TDlgTitles.FormCreate(Sender: TObject);
begin
  FUpdateUI();
end;

procedure TDlgTitles.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FConfig.InventoryScreen_Top := Self.Top;
  FConfig.InventoryScreen_Left := Self.Left;
  FConfig.InventoryScreen_Width := Self.Width;
  FConfig.InventoryScreen_Height := Self.Height;
end;

procedure TDlgTitles.FDoUpdate();
begin
  FUpdateUI();
end;

procedure TDlgTitles.FSetConfig(inConfig: TConfig);
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

procedure TDlgTitles.BtnOKClick(Sender: TObject);
var
  I: Integer;
begin
  FUrls.Clear;
  for I := 0 to LvInventory.Items.Count-1 do begin
    if LvInventory.Items[I].Checked then
      FUrls.Add(LvInventory.Items[I].SubItems[4]);
  end;
end;

procedure TDlgTitles.FUpdateUI();
var
  I, SelCount: Integer;
begin
  SelCount := 0;

  for I := 0 to LvInventory.Items.Count-1 do
    if LvInventory.Items[I].Checked then
      Inc(SelCount);

  LblTitlesEarnedCount.Caption := ''; // number of green titles //IntToStr(SelCount);

  // We don't need checkboxes if we can't send items into the cube.
  BtnOK.Enabled := SelCount > 0;
end;

procedure TDlgTitles.LvInventoryAdvancedCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
  // Draw alternating row colors.
  if Item.Index mod 2=0 then
    Sender.Canvas.Brush.Color := $F6F6F6
  else
    Sender.Canvas.Brush.Color := clWhite;
end;

procedure TDlgTitles.LvInventoryChange(Sender: TObject; Item: TListItem; Change: TItemChange);
begin
  FUpdateUI();
end;

procedure TDlgTitles.FSetItemList(Items: TTitleList);
var
  I: Integer;
  Item: TListItem;
begin
  FItemList := Items;
{
  for I := 0 to Items.Count - 1 do begin
    Item := LvInventory.Items.Add;
    // Name
    Item.Caption := TTitleItem(Items[I]).Name;
    // Rarity
    case (TTitleItem(Items[I]).Rarity) of
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
    Item.SubItems.Add(IntToStr(TTitleItem(Items[I]).Weight));
    // Value
    Item.SubItems.Add(IntToStr(TTitleItem(Items[I]).Value));

    // Calc value
    ValPerWeight := IfThen(TTitleItem(Items[I]).Value = 0, 1, TTitleItem(Items[I]).Value) / TTitleItem(Items[I]).Weight;
    Item.SubItems.Add(FormatFloat('0.00', ValPerWeight));

    // url(invisible)
    Item.SubItems.Add(TTitleItem(Items[I]).RecycleUrl);
  end;
}
  // Re-set the sorting
  LvInventory.SortType := stNone;
  LvInventory.SortType := stData;
end;

procedure TDlgTitles.LvInventoryColumnClick(Sender: TObject;
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

procedure TDlgTitles.LvInventoryCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
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
