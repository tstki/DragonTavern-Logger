unit UFrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ImgList, xmldom, XMLIntf, msxmldom, XMLDoc,
  ExtCtrls, StrUtils, TeCanvas, ToolWin, ActnMan, ActnCtrls, ActnMenus,
  Menus, ActnList, OleCtrls, SHDocVw, XPMan, mshtml, contnrs,
  UConfig, UDataConfig, UZoneConfig, UDlgInventory, UDlgAnalyze;

type
  TFrmDBrowser = class(TForm)
    WebBrowser1: TWebBrowser;
    PnlBrowserBar: TPanel;
    BtnResetGameSmartCPU: TButton;
    ImlFrmMain: TImageList;
    Button1: TButton;
    Button3: TButton;
    BtnGo: TButton;
    EditAddressBar: TEdit;
    StatusBar1: TStatusBar;
    XPManifest1: TXPManifest;
    ActionList1: TActionList;
    ActPrev: TAction;
    ActNext: TAction;
    ActRefresh: TAction;
    ActGoto: TAction;
    Splitter1: TSplitter;
    Panel2: TPanel;
    LblLanguage: TLabel;
    CbxShow: TComboBox;
    Label1: TLabel;
    BtnReturnToTavern: TButton;
    BtnCharacter: TButton;
    BtnAdvantages: TButton;
    BtnReturnToLocation: TButton;
    BtnShowInventory: TButton;
    BtnRankings: TButton;
    BtnCharacterList: TButton;
    BtnRecentEvents: TButton;
    BtnCompetitionGroups: TButton;
    BtnForums: TButton;
    BtnAccountSettings: TButton;
    BtnFaq: TButton;
    Panel3: TPanel;
    Panel4: TPanel;
    ActReturnToTavern: TAction;
    ActAdvantages: TAction;
    ActCharsheet: TAction;
    ActRecentHappenings: TAction;
    ActGoCharList: TAction;
    ActReturnToLocation: TAction;
    ActRankings: TAction;
    ActInventory: TAction;
    ActCompetitionGroups: TAction;
    ActGoForums: TAction;
    ActGoAccountSettings: TAction;
    ActGoFaq: TAction;
    ActStop: TAction;
    ActShowAbout: TAction;
    Label2: TLabel;
    LblCurZoneTitle: TLabel;
    BtnShowInventoryList: TButton;
    ActInventoryList: TAction;
    BtnPageSource: TButton;
    MainMenu1: TMainMenu;
    Help1: TMenuItem;
    About1: TMenuItem;
    Character1: TMenuItem;
    avern1: TMenuItem;
    CharacterList1: TMenuItem;
    Forums1: TMenuItem;
    AccountSettings1: TMenuItem;
    FAQ1: TMenuItem;
    ReturntoTavern1: TMenuItem;
    Advantages1: TMenuItem;
    CharacterSheet1: TMenuItem;
    RecentHappenings1: TMenuItem;
    ReturntoLocation1: TMenuItem;
    Rankings1: TMenuItem;
    Inventory1: TMenuItem;
    InventoryList1: TMenuItem;
    CompetitionGroups1: TMenuItem;
    ZoneData1: TMenuItem;
    Hotkey1: TMenuItem;
    LoginPage1: TMenuItem;
    ReferralSystem1: TMenuItem;
    ReplenishCredits1: TMenuItem;
    itles1: TMenuItem;
    PublicPage1: TMenuItem;
    Logout1: TMenuItem;
    ActShowHotKeys: TAction;
    Options1: TMenuItem;
    PageSource1: TMenuItem;
    Timer1: TTimer;
    ActGoLogin: TAction;
    ActGoReferral: TAction;
    ActGoReplenish: TAction;
    Logger1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    ActPageSource: TAction;
    ActExitApplication: TAction;
    ActOptions: TAction;
    ActPublicPage: TAction;
    ActTitles: TAction;
    ActDecreaseDifficulty: TAction;
    ActIncreaseDifficulty: TAction;
    ActGoLogout: TAction;
    Logout2: TMenuItem;
    N3: TMenuItem;
    DecreaseDifficulty1: TMenuItem;
    IncreaseDifficulty1: TMenuItem;
    ravel1: TMenuItem;
    N4: TMenuItem;
    ActExplore: TAction;
    Explore1: TMenuItem;
    ActNewsArchive: TAction;
    NewsArchive1: TMenuItem;
    LvActiveZoneData: TListView;
    LvDataView: TListView;
    BtnRefresh: TButton;
    ActRefreshDataView: TAction;
    ActAnalyze: TAction;
    BtnDataAnalyzer: TButton;
    ActExportData: TAction;
    Exportdata1: TMenuItem;
    BtnIncreaseDifficulty: TButton;
    BtnDecreaseDifficulty: TButton;
    LblSoulWarning: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WebBrowser1StatusTextChange(ASender: TObject; const Text: WideString);
    procedure WebBrowser1NavigateComplete2(ASender: TObject; const pDisp: IDispatch; var URL: OleVariant);
    procedure WebBrowser1DocumentComplete(ASender: TObject; const pDisp: IDispatch; var URL: OleVariant);
    procedure WebBrowser1PropertyChange(ASender: TObject; const szProperty: WideString);
    procedure EditAddressBarKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ActPrevExecute(Sender: TObject);
    procedure ActNextExecute(Sender: TObject);
    procedure ActRefreshExecute(Sender: TObject);
    procedure ActGotoExecute(Sender: TObject);
    procedure ActStopExecute(Sender: TObject);
    procedure ActShowAboutExecute(Sender: TObject);
    procedure ActGoCharListExecute(Sender: TObject);
    procedure ActGoForumsExecute(Sender: TObject);
    procedure ActGoAccountSettingsExecute(Sender: TObject);
    procedure ActGoFaqExecute(Sender: TObject);
    procedure ActReturnToTavernExecute(Sender: TObject);
    procedure ActAdvantagesExecute(Sender: TObject);
    procedure ActCharsheetExecute(Sender: TObject);
    procedure ActRecentHappeningsExecute(Sender: TObject);
    procedure ActReturnToLocationExecute(Sender: TObject);
    procedure ActRankingsExecute(Sender: TObject);
    procedure ActInventoryExecute(Sender: TObject);
    procedure ActCompetitionGroupsExecute(Sender: TObject);
    procedure CbxShowChange(Sender: TObject);
    procedure ActInventoryListExecute(Sender: TObject);
    procedure ActShowHotKeysExecute(Sender: TObject);
    procedure ActGoLoginExecute(Sender: TObject);
    procedure ActPageSourceExecute(Sender: TObject);
    procedure ActExitApplicationExecute(Sender: TObject);
    procedure ActOptionsExecute(Sender: TObject);
    procedure ActPublicPageExecute(Sender: TObject);
    procedure ActTitlesExecute(Sender: TObject);
    procedure ActGoReferralExecute(Sender: TObject);
    procedure ActGoReplenishExecute(Sender: TObject);
    procedure ActDecreaseDifficultyExecute(Sender: TObject);
    procedure ActIncreaseDifficultyExecute(Sender: TObject);
    procedure ActGoLogoutExecute(Sender: TObject);
    procedure ActExploreExecute(Sender: TObject);
    procedure ActNewsArchiveExecute(Sender: TObject);
    procedure ActRefreshDataViewExecute(Sender: TObject);
    procedure LvActiveZoneDataAdvancedCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure LvActiveZoneDataCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure LvActiveZoneDataColumnClick(Sender: TObject; Column: TListColumn);
    procedure LvDataViewColumnClick(Sender: TObject; Column: TListColumn);
    procedure LvDataViewCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure LvDataViewAdvancedCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure ActAnalyzeExecute(Sender: TObject);
    procedure ActExportDataExecute(Sender: TObject);
  private
    FConfig: TConfig;
    FDataConfig: TDataConfig;
    FZoneConfig: TZoneConfig;
    FZoneNames: TObjecTList;
    FCharName: String;
    FCurrentZone: String;
    FWantInventoryList: Boolean;
    FDlgAnalyze: TDlgAnalyze;
    FCurrentDataZone: String;
//    FZVSortDescending: Boolean;
//    FZVSortColumn: Integer;
//    FDVSortDescending: Boolean;
//    FDVSortColumn: Integer;
    { Private declarations }
    procedure FRunDataExtraction(var iall: IHTMLElement);
    procedure FUpdateUI();
    procedure FFillZonePulldown();
    procedure FShowZoneInfoByName(ZoneName, creatureType: String; DataView: TListView);
    procedure FShowDynamicZoneInfoByName(ZoneName: String; DataView: TListView);
    procedure FListViewAddItem(View: TListView; Data: TDataRow; New: Boolean);
    procedure FUpdateDataView();
    procedure FUpdateCurrentDataView(ZoneName, creatureType: String);
    function FGetRootHtmlElement(): IHTMLElement;
    function FGatherItems(var iall: IHTMLElement; InvItems: TInvItemList; var CubeCurCharges, CubeMaxCharges: Integer): Boolean;
    procedure FFocusBrowserFrame();
    procedure FCheckVersion();
  public
    { Public declarations }
  end;

var
  FrmDBrowser: TFrmDBrowser;

implementation

uses
  Math, UStrings, UDlgPageSource, UDlgAbout, UDlgHotKeys, UDlgPreferences, UDlgCubeProgress;

{$R *.dfm}


//-----------------------------------------------------------------------------
// Name: cnsSmartPos
// Author: Com-N-Sense
// Source: http://www.swissdelphicenter.ch/torry/showcode.php?id=2125
// Date:
// Purpose: Find a substring in a string starting from any position in the string.
// Params: SubStr - a substring for search.
//         S - the source string to search within
//         StartPos - the index position to start the search.
// Result: Integer - the position of the substring,
//                   zero - if the substring was not found
// Remarks: This is the original Delphi "Pos" function modified to support
//          the start pos parameter.
//-----------------------------------------------------------------------------
function SmartPosAsm(const substr: AnsiString; const s: AnsiString; StartPos: Cardinal) : Integer;
type
  StrRec = packed record
    allocSiz: Longint;
    refCnt: Longint;
    length: Longint;
  end;
const
  skew = sizeof(StrRec);
asm // Assembly
{ ->EAX     Pointer to substr               }
{   EDX     Pointer to string               }
{ <-EAX     Position of substr in s or 0    }
    TEST    EAX,EAX
    JE      @@noWork

    TEST    EDX,EDX
    JE      @@stringEmpty

    PUSH    EBX
    PUSH    ESI
    PUSH    EDI

    MOV     ESI,EAX                         { Point ESI to substr           }
    MOV     EDI,EDX                         { Point EDI to s                }

    MOV     EAX,ECX
    MOV     ECX,[EDI-skew].StrRec.length    { ECX = Length(s)               }
    ADD     EDI,EAX
    SUB     ECX,EAX

    PUSH    EDI                             { remember s position to calculate index        }

    MOV     EDX,[ESI-skew].StrRec.length    { EDX = Length(substr)          }

    DEC     EDX                             { EDX = Length(substr) - 1              }
    JS      @@fail                          { < 0 ? return 0                        }
    MOV     AL,[ESI]                        { AL = first char of substr             }
    INC     ESI                             { Point ESI to 2'nd char of substr      }

    SUB     ECX,EDX                         { #positions in s to look at    }
                                            { = Length(s) - Length(substr) + 1      }
    JLE     @@fail
@@loop:
    REPNE   SCASB
    JNE     @@fail
    MOV     EBX,ECX                         { save outer loop counter               }
    PUSH    ESI                             { save outer loop substr pointer        }
    PUSH    EDI                             { save outer loop s pointer             }

    MOV     ECX,EDX
    REPE    CMPSB
    POP     EDI                             { restore outer loop s pointer  }
    POP     ESI                             { restore outer loop substr pointer     }
    JE      @@found
    MOV     ECX,EBX                         { restore outer loop counter    }
    JMP     @@loop

@@fail:
    POP     EDX                             { get rid of saved s pointer    }
    XOR     EAX,EAX
    JMP     @@exit

@@stringEmpty:
    XOR     EAX,EAX
    JMP     @@noWork

@@found:
    POP     EDX                             { restore pointer to first char of s    }
    MOV     EAX,EDI                         { EDI points of char after match        }
    SUB     EAX,EDX                         { the difference is the correct index   }
@@exit:
    POP     EDI
    POP     ESI
    POP     EBX
@@noWork:
end; //SmartPosAsm

function cnsSmartPos(const substr: AnsiString; const s: AnsiString; StartPos: Cardinal) : Integer;
begin
  dec(StartPos);
  Result := SmartPosAsm(SubStr, S, StartPos);
  if Result > 0 then
    Result := Result + StartPos;
end; //cnsSmartPos

//

procedure TFrmDBrowser.FormCreate(Sender: TObject);
  procedure FFLoadScreenDimensions();
  begin
    if FConfig.MainScreen_Top > 0 then
      Self.Top := FConfig.MainScreen_Top;
    if FConfig.MainScreen_Left > 0 then
      Self.Left := FConfig.MainScreen_Left;
    if FConfig.MainScreen_Width > 0 then
      Self.Width := FConfig.MainScreen_Width;
    if FConfig.MainScreen_Height > 0 then
      Self.Height := FConfig.MainScreen_Height;
  end;

begin
  FConfig := TConfig.Create();
  FConfig.ReadValues();

  // Init locals
  FCharName := '';
  FWantInventoryList := False;
  FCurrentDataZone := FConfig.LastDataZone;

  FUpdateUI();

  // Configuration
  FDataConfig := TDataConfig.Create();
  FDataConfig.Initialize();
  FZoneConfig := TZoneConfig.Create();
  FZoneConfig.Initialize();
  FFLoadScreenDimensions();

  FCheckVersion();

  FZoneNames := TObjectList.Create;
  FZoneConfig.GetZoneObjects(FZoneNames, True);

  LvDataView.Clear;
  FFillZonePulldown();
  FUpdateDataView();

  WebBrowser1.Navigate(cRefUrl);

  BtnDataAnalyzer.Caption := '';
  CbxShow.Perform(CB_SETDROPPEDWIDTH, 215, 0);

  FUpdateUI();
  FFocusBrowserFrame();
end;

procedure TFrmDBrowser.FCheckVersion();
begin
  if CompareText(FConfig.LastStartedVersion, StrVersion) <> 0 then begin
    FConfig.LastStartedVersion := StrVersion;

    // Show changelog dialog if preference is active to do so
  end;
end;

procedure TFrmDBrowser.FormClose(Sender: TObject; var Action: TCloseAction);
  procedure FFSaveScreen();
  begin
    FConfig.MainScreen_Top := Top;
    FConfig.MainScreen_Left := Left;
    FConfig.MainScreen_Width := Width;
    FConfig.MainScreen_Height := Height;
  end;

begin
  FFSaveScreen();

  FConfig.LastDataZone := FCurrentDataZone;

  FConfig.WriteValues(False);
  FConfig.Free();
  FDataConfig.Cleanup();
  FDataConfig.Free();
  FZoneConfig.Cleanup();
  FZoneConfig.Free();
//  FZoneNames : Should free its sub objects
  FZoneNames.Free();
  FDlgAnalyze.Free();
end;

procedure TFrmDBrowser.FFillZonePulldown();
var
  I: Integer;
begin
  CbxShow.Clear();
  CbxShow.AddItem(cNoneStr, nil);

  if FConfig.DynamicDataview then begin
    CbxShow.AddItem(cRecentStr, nil);

    for I := 0 to FZoneNames.Count - 1 do begin
      if not TZoneObj(FZoneNames[I]).AmSubZone then
        CbxShow.AddItem(' ' + TZoneObj(FZoneNames[I]).Name + ' ' + TZoneObj(FZoneNames[I]).LevelRange, FZoneNames[I]);
    end;
  end else begin
    for I := 0 to FZoneNames.Count - 1 do begin
      if TZoneObj(FZoneNames[I]).AmSubZone then
        CbxShow.AddItem(' - ' + TZoneObj(FZoneNames[I]).Name + ' ' + TZoneObj(FZoneNames[I]).LevelRange, FZoneNames[I])
      else
        CbxShow.AddItem(' ' + TZoneObj(FZoneNames[I]).Name + ' ' + TZoneObj(FZoneNames[I]).LevelRange, FZoneNames[I]);
    end;
  end;

  CbxShow.ItemIndex := FConfig.DataViewItemIndex;
end;

function TFrmDBrowser.FGetRootHtmlElement(): IHTMLElement;
begin
  Result := (WebBrowser1.Document AS IHTMLDocument2).body;

  while Result.parentElement <> nil do
  begin
    Result := Result.parentElement;
  end;
end;

procedure TFrmDBrowser.WebBrowser1DocumentComplete(ASender: TObject; const pDisp: IDispatch; var URL: OleVariant);
  procedure FFSetUsernamePassword(const document: IHTMLDocument2; username, password: String);
  var
    forms: IHTMLElementCollection;
    form: IHTMLFormElement;
    idx, idx2: integer;
    field: IHTMLElement;
    itemSet: Integer;

  begin
    forms := document.Forms as IHTMLElementCollection;
    itemSet := 0;

    for idx := 0 to -1 + forms.length do begin
      form := forms.item(idx,0) as IHTMLFormElement;

      for idx2 := 0 to -1 + form.length do begin
        field := form.item(idx2, '') as IHTMLElement;

        if field = nil then
          Continue;

        if field.tagName = 'INPUT' then begin
          if field.id = 'login-username' then begin
            (field as IHTMLInputElement).value := username;
            inc(itemSet);
          end else if field.id = 'login-password' then begin
            (field as IHTMLInputElement).value := password;
            inc(itemSet);
          end;

          // Just 2 fields we need to find.
          if itemSet >= 2 then
            Exit;
        end;
      end;
    end;
  end;

var
  iall: IHTMLElement;
begin
  // Close character session if we return to the main page, or got logged out due to idle time.
  if (CompareText(URL, 'http://www.dragontavern.com/') = 0) or
     (CompareText(URL, 'http://www.dragontavern.com/characters/') = 0) or
     (CompareText(URL, 'http://forums.dragontavern.com/') = 0) or
     (CompareText(URL, 'http://www.dragontavern.com/faq/') = 0) or
     AnsiContainsStr(URL, 'http://www.dragontavern.com/account/') then
    FCharName := '';

  // Don't show certain script results. Ugly.
  if not AnsiContainsStr(URL, 'addthis.com') and
     not AnsiContainsStr(URL, 'facebook.com') and
     not AnsiContainsStr(URL, 'javascript:false') and
     not AnsiContainsStr(URL, 'about:blank') and
     not AnsiContainsStr(URL, 'googleads.g.doubleclick') and
     not AnsiContainsStr(URL, 'static.ak.fbcdn.net') then
    EditAddressBar.Text := URL;

  if FWantInventoryList then begin
    FWantInventoryList := False;
    ActInventoryListExecute(ASender);
    Exit;
  end;

  if AnsiContainsStr(URL, 'http://www.dragontavern.com/' ) then begin
    if AnsiContainsStr(URL, 'http://www.dragontavern.com/char/' ) then begin
      iall := FGetRootHtmlElement();
      try
        FRunDataExtraction(iall);
      except
        // hm something bad occurred in the pos handling
      end;
    end else if AnsiContainsStr(URL, 'http://www.dragontavern.com/characters/') then begin
      LblCurZoneTitle.Caption := 'Character selection';
      LvActiveZoneData.Clear;
    end else begin

      if(CompareText(URL, 'http://www.dragontavern.com/') = 0) or
        (CompareText(URL, cRefUrl) = 0) then begin

        if (FConfig.UserName <> '') or (FConfig.Password <> '') then
          FFSetUsernamePassword(WebBrowser1.Document AS IHTMLDocument2, FConfig.UserName, FConfig.Password);
      end;

      if not FConfig.LazyZoneview then begin
        LblCurZoneTitle.Caption := '...';
        LvActiveZoneData.Clear;
      end;
    end;
  end;

  FUpdateUI();
end;

procedure TFrmDBrowser.FRunDataExtraction(var iall: IHTMLElement);
var
  p1, p2, intSize : Integer;
//  subZone: Boolean;
  tmpstr, zoneName, zoneRange, creatureType : String;
begin
  zoneName := '';
  zoneRange := '';
  creatureType := '';

  p1 := Pos(PChar(cExploreStr), iall.outerHTML);
  if p1 <> 0 then begin

    p2 := Pos(PChar('</SPAN></DIV>'), iall.outerHTML);
    if p2 <> 0 then begin
      tmpstr := Copy(iall.outerHTML, p1+Length(cExploreStr), p2-p1-Length(cExploreStr));
      p1 := Pos(PChar('/">'), tmpstr);
      FCharName := Copy(tmpstr, 1, p1-1);

      p2 := Pos(PChar('</A><SPAN>'), tmpstr);
      zoneName := Copy(tmpstr, p1+Length(PChar('/">')), p2-p1-Length(PChar('/">')));

      // See if we found a creature. (We don't care about traps, nothing, and dead corpses recovered)
      p1 := Pos(PChar('<H4>Level '), iall.outerHTML);
      if p1 <> 0 then begin

        p2 := Pos(PChar('</H4>'), iall.outerHTML);
        if p2 <> 0 then begin
          tmpstr := Copy(iall.outerHTML, p1+Length(PChar('<H4>Level ')), p2-p1-Length(PChar('<H4>Level ')));

          if StrToIntDef(Copy(tmpstr,1,3),-1) <> -1 then
            intSize := 3
          else if StrToIntDef(Copy(tmpstr,1,2),-1) <> -1 then
            intSize := 2
          else if StrToIntDef(Copy(tmpstr,1,1),-1) <> -1 then
            intSize := 1
          else
            intSize := 0;

          if intSize > 0 then begin

            // Check if this is a double XP (festivus) monster, and whether we want to log these
            p1 := Pos(PChar('<SPAN class=gold>Double XP'), iall.outerHTML);
            if (p1 = 0) or FConfig.LogEventCreatures then begin
              creatureType := Copy(tmpstr, 1+intSize+1, Length(tmpstr)-intSize-1);

              // Check for boss type
              p1 := Pos(PChar(' <SPAN class='), creatureType);
              if p1 <> 0 then
                creatureType := Copy(creatureType, 1, p1-1);

              FDataConfig.AddValue(zoneName, creatureType);

              // See if the user is immortal, and just harvested a soul
              if FConfig.DetectSoulStatus then begin
                p1 := Pos(PChar(cSoulAdded), iall.outerHTML);
                if p1 <> 0 then begin
                  p2 := Pos(PChar(cSoulBursting), iall.outerHTML);
                  if p2 <> 0 then begin
                    LblSoulWarning.Visible := True;
                    // Blur focus so we don't accidently keep pressing 'E'
                    LvActiveZoneData.SetFocus;
                  end else
                    LblSoulWarning.Visible := False;
                end;
              end
            end;
          end;
        end;
      end;
    end;
  end;

  FUpdateCurrentDataView(zoneName, creatureType);
  FUpdateUI();
end;

function TFrmDBrowser.FGatherItems(var iall: IHTMLElement; InvItems: TInvItemList; var CubeCurCharges, CubeMaxCharges: Integer): Boolean;
var
  p1, p2, p3, p4, RarityVal: Integer;
  tmpstr, itemName, itemRarity, itemWeight, itemValue, itemRecycleURL : String;
begin
  //http://www.dragontavern.com/char/aeonus/inventory/
  // make sure we're on the inventory page?

  p1 := Pos(PChar(cInventoryStr), iall.outerHTML);
  if p1 <> 0 then begin
    p2 := Pos(PChar('Total Value:'), iall.outerHTML);
    if p2 <> 0 then begin
      // Inventory block found
      tmpstr := Copy(iall.outerHTML, p1+Length(cInventoryStr), p2-p1-Length(cInventoryStr));

      repeat
        itemName := '';
        itemRarity := '';
        itemValue := '';
        itemRecycleURL := '';

        // Find the item Name
        p1 := Pos(PChar(cInvItemNameStart), tmpstr);
        p2 := Pos(PChar(cBoldEnd), tmpstr);
        if (p1 <> 0) and (p2 <> 0) then begin
          itemName := Copy(tmpstr, p1+Length(cInvItemNameStart), p2-p1-Length(cInvItemNameStart));

          // Find the Rarity
          p1 := Pos(PChar(cInvLootTypeStart), tmpstr);
          p2 := Pos(PChar(cInvLootTypeEnd), tmpstr);
          if (p1 <> 0) and (p2 <> 0) then begin
            itemRarity := Copy(tmpstr, p1+Length(cInvLootTypeStart), p2-p1-Length(cInvLootTypeStart));

            tmpstr := Copy(tmpstr, p2+Length(cInvLootTypeEnd), Length(tmpstr)-p2-Length(cInvLootTypeEnd));

            // Find the Gold Value
            p1 := Pos(PChar(cInvLootValueStart), tmpstr);
            p2 := Pos(PChar(cInvLootValueEnd), tmpstr);
            if (p1 <> 0) and (p2 <> 0) then begin
              itemValue := Copy(tmpstr, p1+Length(cInvLootValueStart), p2-p1-Length(cInvLootValueStart));

              tmpstr := Copy(tmpstr, p2+Length(cInvLootValueEnd), Length(tmpstr)-p2-Length(cInvLootValueEnd));

              // Find the item Weight
              p1 := Pos(PChar(cInvLootWeightStart), tmpstr);
              p2 := Pos(PChar(cSpanEnd), tmpstr);
              if (p1 <> 0) and (p2 <> 0) then begin
                itemWeight := Copy(tmpstr, p1+Length(cInvLootWeightStart), p2-p1-Length(cInvLootWeightStart));

                // Find the cube recycle url
                p3 := cnsSmartPos(AnsiString(cInvRecycleStart), AnsiString(tmpstr), 0);
                p4 := cnsSmartPos(AnsiString('"'), AnsiString(tmpstr), p3+Length(cInvRecycleStart));
                if (p3 <> 0) and (p4 <> 0) then begin
                  itemRecycleURL := Copy(tmpstr, p3+Length(cInvRecycleStart), p4-p3-Length(cInvRecycleStart));
                end;

                if itemRarity = 'com>[C' then
                  RarityVal := 1
                else if itemRarity = 'rar>[R' then
                  RarityVal := 2
                else if itemRarity = 'exo>[E' then
                  RarityVal := 3
                else
                  RarityVal := 0;

                itemValue := AnsiReplaceStr(itemValue, ',', '');

                InvItems.AddItem(itemRecycleURL, itemName, RarityVal, StrToIntDef(itemValue, 1), StrtoIntDef(itemWeight, 1));
              end;
            end; // Gold value
          end; // Rarity
        end; // Item name
      until itemName = '';
    end;
  end;

  // Determine Loot transmutation cube values

  CubeCurCharges := 0;
  CubeMaxCharges := 0;

  // Lets see if the user has a cube.
  p1 := Pos(PChar(cCubeStartStr), iall.outerHTML);
  if p1 <> 0 then begin
    p2 := Pos(PChar(cCubeEndStr), iall.outerHTML);
    if p2 <> 0 then begin
      tmpstr := Copy(iall.outerHTML, p1+Length(cCubeStartStr), p2-p1-Length(cCubeStartStr));
      //'</SPAN> has <SPAN style="COLOR: white">40</SPAN> charges (out of <SPAN class=white>40</SPAN>) '

      p1 := cnsSmartPos(AnsiString('">'), AnsiString(tmpstr), 0);
      if p1 <> 0 then begin
        p2 := cnsSmartPos(AnsiString('</SPAN>'), AnsiString(tmpstr), p1);
        if p2 <> 0 then begin
          // Current charges left, found!
          CubeCurCharges := StrToIntDef(Copy(tmpstr, p1+2, p2-p1-2), 0);

          p1 := cnsSmartPos(AnsiString('white>'), AnsiString(tmpstr), p2);
          if p1 <> 0 then begin
            p1 := cnsSmartPos(AnsiString('>'), AnsiString(tmpstr), p1);
            if p1 <> 0 then begin
              p2 := cnsSmartPos(AnsiString('<'), AnsiString(tmpstr), p1);
              // Max charges found as well!
              if p2 <> 0 then
                CubeMaxCharges := StrToIntDef(Copy(tmpstr, p1+1, p2-p1-1), 0);
            end;
          end;
        end;
      end;
    end;
  end;

  Result := InvItems.Count > 0;
end;

procedure TFrmDBrowser.WebBrowser1NavigateComplete2(ASender: TObject; const pDisp: IDispatch; var URL: OleVariant);
begin
//  if AnsiStartsStr('http', URL) then
//    EditAddressBar.Text := URL;

//  MemoMessages.SetTextBuf();
//  WebBrowser1.GetTextBuf();
end;

procedure TFrmDBrowser.WebBrowser1PropertyChange(ASender: TObject; const szProperty: WideString);
begin
//
end;

procedure TFrmDBrowser.WebBrowser1StatusTextChange(ASender: TObject; const Text: WideString);
begin
  StatusBar1.Panels[0].Text := Text;
end;

procedure TFrmDBrowser.ActGotoExecute(Sender: TObject);
begin
  WebBrowser1.Navigate(EditAddressBar.Text);
end;

procedure TFrmDBrowser.ActNextExecute(Sender: TObject);
begin
  WebBrowser1.GoForward;
end;

procedure TFrmDBrowser.ActOptionsExecute(Sender: TObject);
var
  DlgPreferences: TDlgPreferences;
begin
  DlgPreferences := TDlgPreferences.Create(Self);
  try
    DlgPreferences.SetConfig(FConfig);
    DlgPreferences.SetDataConfig(FDataConfig);
    DlgPreferences.ShowModal();
  finally
    DlgPreferences.Free();
    FFocusBrowserFrame();
  end;

  FUpdateUI();
  FFillZonePulldown();
  FUpdateDataView();
end;

procedure TFrmDBrowser.ActPageSourceExecute(Sender: TObject);
var
  DlgPageSource: TDlgPageSource;
begin
  DlgPageSource := TDlgPageSource.Create(Self);
  try
    DlgPageSource.SetMemo(FGetRootHtmlElement().outerHTML);
    DlgPageSource.ShowModal();
  finally
    DlgPageSource.Free();
    FFocusBrowserFrame();
  end;
end;

procedure TFrmDBrowser.ActPrevExecute(Sender: TObject);
begin
  WebBrowser1.GoBack;
end;

procedure TFrmDBrowser.ActRefreshDataViewExecute(Sender: TObject);
begin
  FUpdateDataView();
end;

procedure TFrmDBrowser.ActRefreshExecute(Sender: TObject);
begin
  WebBrowser1.Refresh;
end;

procedure TFrmDBrowser.ActStopExecute(Sender: TObject);
begin
  WebBrowser1.Stop;
end;

procedure TFrmDBrowser.ActExitApplicationExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close();
end;

procedure TFrmDBrowser.FFocusBrowserFrame();
begin
  // Set focus to the inner document of the HTML window
  if WebBrowser1.Document <> nil then
    IHTMLWindow2(IHTMLDocument2(WebBrowser1.Document).ParentWindow).focus
end;

procedure TFrmDBrowser.ActInventoryListExecute(Sender: TObject);
var
  Dlg: TDlgInventory;
  InvItems: TInvItemList;
  iall: IHTMLElement;
  Urls: TStringList;
  I, CubeCurCharges, CubeMaxCharges: Integer;
  CubeProgress: TDlgCubeProgress;
begin
  if CompareText( WebBrowser1.LocationURL, 'http://www.dragontavern.com/char/' + FCharName + '/inventory/') <> 0 then begin
    FWantInventoryList := True;
    ActInventoryExecute(Sender);
    Exit;
  end;

  // Open inventory list
  InvItems := TInvItemList.Create();
  Urls := TStringList.Create();

  try
    iall := FGetRootHtmlElement();
    if(FGatherItems(iall, InvItems, CubeCurCharges, CubeMaxCharges)) then begin
      Dlg := TDlgInventory.Create(self);
      try
        Dlg.Config := FConfig;
        Dlg.ItemList := InvItems;
        Dlg.Urls := Urls;
        Dlg.CubeCurCharges := CubeCurCharges;
        Dlg.CubeMaxCharges := CubeMaxCharges;
        Dlg.FDoUpdate();
        Dlg.ShowModal();
      finally
        Dlg.Free();
        FFocusBrowserFrame();
      end;

      // Can't cube if we have no charges
      if CubeMaxCharges > 0 then begin
        CubeProgress := nil;
        if Urls.Count > 2 then
          CubeProgress := TDlgCubeProgress.Create(Self);

        try
          if CubeProgress <> nil then begin
            CubeProgress.SetMaxValue(Urls.Count);
            CubeProgress.SetCurValue(0);
            CubeProgress.Show();
          end;

          // Time to recycle those items
          for I := 0 to Urls.Count-1 do begin
            webbrowser1.Navigate('http://www.dragontavern.com' + Urls[I]);
            if I < Urls.Count-1 then begin
              if CubeProgress <> nil then
                CubeProgress.SetCurValue(I+1);
              Application.ProcessMessages;
              Sleep(500); //Make this a preference
            end;
          end;
        finally
          if CubeProgress <> nil then
            CubeProgress.Free;
        end;
      end;
    end;
  finally
    InvItems.Free();
    Urls.Free();
  end;
end;

procedure TFrmDBrowser.ActAnalyzeExecute(Sender: TObject);
begin
  if FDlgAnalyze = nil then begin
    FDlgAnalyze := TDlgAnalyze.Create(Self);
    FDlgAnalyze.Config := FConfig;
  end;

  FDlgAnalyze.Zones := FZoneConfig;
  FDlgAnalyze.Data := FDataConfig;
  FDlgAnalyze.Show();
end;

procedure TFrmDBrowser.ActTitlesExecute(Sender: TObject);
begin
  WebBrowser1.Navigate('http://www.dragontavern.com/char/' + FCharName + '/titles/');
  FFocusBrowserFrame();
end;

procedure TFrmDBrowser.ActPublicPageExecute(Sender: TObject);
begin
  WebBrowser1.Navigate('http://www.dragontavern.com/champions/' + FCharName + '/');
  FFocusBrowserFrame();
end;

procedure TFrmDBrowser.ActAdvantagesExecute(Sender: TObject);
begin
  WebBrowser1.Navigate('http://www.dragontavern.com/char/' + FCharName + '/spend/');
  FFocusBrowserFrame();
end;

procedure TFrmDBrowser.ActCharsheetExecute(Sender: TObject);
begin
  WebBrowser1.Navigate('http://www.dragontavern.com/char/' + FCharName + '/characterSheet/');
  FFocusBrowserFrame();
end;

procedure TFrmDBrowser.ActCompetitionGroupsExecute(Sender: TObject);
begin
  WebBrowser1.Navigate('http://www.dragontavern.com/char/' + FCharName + '/competitionGroups/');
  FFocusBrowserFrame();
end;

procedure TFrmDBrowser.ActInventoryExecute(Sender: TObject);
begin
  WebBrowser1.Navigate('http://www.dragontavern.com/char/' + FCharName + '/inventory/');
  FFocusBrowserFrame();
end;

procedure TFrmDBrowser.ActIncreaseDifficultyExecute(Sender: TObject);
begin
  WebBrowser1.Navigate('http://www.dragontavern.com/char/' + FCharName + '/level-up.htm');
  FFocusBrowserFrame();
end;

procedure TFrmDBrowser.ActDecreaseDifficultyExecute(Sender: TObject);
begin
  WebBrowser1.Navigate('http://www.dragontavern.com/char/' + FCharName + '/level-down.htm');
  FFocusBrowserFrame();
end;

procedure TFrmDBrowser.ActRankingsExecute(Sender: TObject);
begin
  WebBrowser1.Navigate('http://www.dragontavern.com/char/' + FCharName + '/rankings/');
  FFocusBrowserFrame();
end;

procedure TFrmDBrowser.ActRecentHappeningsExecute(Sender: TObject);
begin
  WebBrowser1.Navigate('http://www.dragontavern.com/char/' + FCharName + '/events/');
  FFocusBrowserFrame();
end;

procedure TFrmDBrowser.ActReturnToLocationExecute(Sender: TObject);
begin
  WebBrowser1.Navigate('http://www.dragontavern.com/char/' + FCharName + '/');
  FFocusBrowserFrame();
end;

procedure TFrmDBrowser.ActReturnToTavernExecute(Sender: TObject);
begin
  WebBrowser1.Navigate('http://www.dragontavern.com/char/' + FCharName + '/tavern/');
  FFocusBrowserFrame();
end;

procedure TFrmDBrowser.ActExploreExecute(Sender: TObject);
begin
  WebBrowser1.Navigate('http://www.dragontavern.com/char/' + FCharName + '/explore/');
  FFocusBrowserFrame();
end;

procedure TFrmDBrowser.ActGoLoginExecute(Sender: TObject);
begin
  WebBrowser1.Navigate('http://www.dragontavern.com/');
  FFocusBrowserFrame();
end;

procedure TFrmDBrowser.ActGoLogoutExecute(Sender: TObject);
begin
  WebBrowser1.Navigate('http://www.dragontavern.com/logout/');
  FFocusBrowserFrame();
end;

procedure TFrmDBrowser.ActGoReferralExecute(Sender: TObject);
begin
  WebBrowser1.Navigate('http://www.dragontavern.com/account/promote/');
  FFocusBrowserFrame();
end;

procedure TFrmDBrowser.ActGoReplenishExecute(Sender: TObject);
begin
  WebBrowser1.Navigate('http://www.dragontavern.com/shop/order/');
  FFocusBrowserFrame();
end;

procedure TFrmDBrowser.ActGoAccountSettingsExecute(Sender: TObject);
begin
  WebBrowser1.Navigate('http://www.dragontavern.com/account/');
  FFocusBrowserFrame();
end;

procedure TFrmDBrowser.ActGoCharListExecute(Sender: TObject);
begin
  WebBrowser1.Navigate('http://www.dragontavern.com/characters/');
  FFocusBrowserFrame();
end;

procedure TFrmDBrowser.ActGoFaqExecute(Sender: TObject);
begin
  WebBrowser1.Navigate('http://www.dragontavern.com/faq/');
  FFocusBrowserFrame();
end;

procedure TFrmDBrowser.ActNewsArchiveExecute(Sender: TObject);
begin
  WebBrowser1.Navigate('http://www.dragontavern.com/archives/');
  FFocusBrowserFrame();
end;

procedure TFrmDBrowser.ActGoForumsExecute(Sender: TObject);
begin
  WebBrowser1.Navigate('http://forums.dragontavern.com/');
  FFocusBrowserFrame();
end;

procedure TFrmDBrowser.ActShowAboutExecute(Sender: TObject);
var
  DlgAbout: TDlgAbout;
begin
  DlgAbout := TDlgAbout.Create(Self);
  try
    DlgAbout.ShowModal();
  finally
    DlgAbout.Free();
    FFocusBrowserFrame();
  end;
end;

procedure TFrmDBrowser.ActShowHotKeysExecute(Sender: TObject);
var
  DlgHotKeys: TDlgHotKeys;
begin
  DlgHotKeys := TDlgHotKeys.Create(Self);
  try
    DlgHotKeys.ShowModal();
  finally
    DlgHotKeys.Free();
    FFocusBrowserFrame();
  end;
end;

procedure TFrmDBrowser.ActExportDataExecute(Sender: TObject);

  function FFCalcPercent(Kills, Total: Integer): String;
  begin
    if FConfig.ExportPercentages then
      Result := FormatFloat('0.00', (Kills/Total)*100)
    else
      Result := IntToStr(Kills);
  end;

  function FFGetRowString(const ColumnNames: TStringList; Data: TDataList; Zone, SubZone, LevelRange: String): String;
  var
    I, TotalKills: Integer;
    Item: TDataRow;
  begin
    TotalKills := Data.GetTotalKills(FConfig.IncludeHostData);

    Result := Zone + ';' + SubZone + ';' + LevelRange + ';' + IntToStr(TotalKills) + ';';

    for i:=0 to ColumnNames.Count-1 do begin
      Item := Data.GetItemByCreature(ColumnNames[I]);

      if Item <> nil then begin
        if FConfig.IncludeHostData then
          Result := Result + FFCalcPercent(Item.HostKills + Item.LocalKills, TotalKills) + ';'
        else
          Result := Result + FFCalcPercent(Item.LocalKills, TotalKills) + ';';
      end else
        Result := Result + '0;'
    end;
  end;

  procedure FFGetData(var DataStrings: TStringList);
  var
    ZoneData: TDataList;
    ZoneList: TObjectList;
    ColumnNames: TStringList;
    I: Integer;
    HeaderText: String;
  begin
    ZoneList := TObjectList.Create();
    ZoneData := TDataList.Create();
    ColumnNames := TStringList.Create();
    try
      FZoneConfig.GetZoneObjects(ZoneList, True);
      ColumnNames.CommaText := FConfig.AnalyzeCreatures;

      HeaderText := 'Zone;Sub Zone;Levels;Total kills;';
      for i:=0 to ColumnNames.Count-1 do
        HeaderText := HeaderText + ColumnNames[i] + ';';
      DataStrings.Append(HeaderText);

      for i:=0 to ZoneList.Count-1 do begin
        ZoneData.Clear();
        FDataConfig.GetZoneData(ZoneData, TZoneObj(ZoneList[i]).Name);

        if TZoneObj(ZoneList[i]).AmSubZone then
          DataStrings.Append(FFGetRowString(ColumnNames, ZoneData, TZoneObj(ZoneList[i]).Parent, TZoneObj(ZoneList[i]).Name, TZoneObj(ZoneList[i]).LevelRange))
        else
          DataStrings.Append(FFGetRowString(ColumnNames, ZoneData, TZoneObj(ZoneList[i]).Name, '', TZoneObj(ZoneList[i]).LevelRange));
      end;
    finally
      ZoneList.Free();
      ZoneData.Free();
      ColumnNames.Free();
    end;
  end;

var
  myFile: TextFile;
  saveDialog: TSaveDialog;
  DataStrings: TStringList;
  I: Integer;
begin
  saveDialog := TSaveDialog.Create(self);
  try
    saveDialog.Title := strExportToFile;
    saveDialog.InitialDir := GetCurrentDir;
    saveDialog.Filter := 'CSV File|*.csv';
    saveDialog.DefaultExt := strExportCsvExt;
    saveDialog.FilterIndex := 1;

    if saveDialog.Execute then begin
      AssignFile(myFile, saveDialog.FileName);
      DataStrings := TStringList.Create();
      try
        ReWrite(myFile);
        FFGetData(DataStrings);

        for i:=0 to DataStrings.count-1 do begin
          Write(myFile, DataStrings[i]);
          WriteLn(myFile);
        end;
        ShowMessage('Export complete, ' + IntToStr(DataStrings.count) + ' lines exported.');
      finally
        CloseFile(myFile);
        DataStrings.Free();
      end;
    end;

  finally
    saveDialog.Free;
  end;

end;

procedure TFrmDBrowser.CbxShowChange(Sender: TObject);
begin
  FUpdateDataView();
  FConfig.DataViewItemIndex := CbxShow.ItemIndex;
end;

procedure TFrmDBrowser.FUpdateCurrentDataView(ZoneName, creatureType: String);
var
  ParentZone: String;
begin
  if ZoneName <> '' then begin
    LblCurZoneTitle.Caption := ZoneName;
    FShowZoneInfoByName(ZoneName, creatureType, LvActiveZoneData);
    FCurrentZone := ZoneName;
  end else if not FConfig.LazyZoneview then begin
    LblCurZoneTitle.Caption := strUnknown;
    LvActiveZoneData.Clear;
    LvActiveZoneData.AddItem(strNoData, nil);
    FCurrentZone := '';
  end;

  if FConfig.DynamicDataview and (CbxShow.ItemIndex = 1) and not SameText(cTavernZoneName, ZoneName) then begin
    if ZoneName = '' then
      LvDataView.Clear
    else if (FCurrentDataZone <> ZoneName) then begin
      // Find the "parent zone"
      ParentZone := FZoneConfig.GetParentZone(ZoneName);
      // We could remember the parent zone for better load times.
      FShowDynamicZoneInfoByName(ParentZone, LvDataView);
    end;
    FCurrentDataZone := ZoneName;
  end;
end;

procedure TFrmDBrowser.FUpdateDataView();
var
  ZoneName, ParentZone: String;
  idx: Integer;
begin
  idx := CbxShow.Items.IndexOf(CbxShow.Text);
  // Ensure we don't crash later.
  if idx < 0 then begin
    CbxShow.ItemIndex := 0;
    idx := 0;
  end;

  if idx = 0 then
    LvDataView.Clear
  else begin
    if FConfig.DynamicDataview then begin
      // Show sub zone data
      if idx = 1 then begin
        ZoneName := FCurrentDataZone;
        if ZoneName = '' then
          ZoneName := LblCurZoneTitle.Caption;
        ParentZone := FZoneConfig.GetParentZone(ZoneName);
      end else
        ParentZone := TZoneObj(CbxShow.Items.Objects[CbxShow.Items.IndexOf(CbxShow.Text)]).Name;
      FShowDynamicZoneInfoByName(ParentZone, LvDataView);
    end else begin
      ZoneName := TZoneObj(CbxShow.Items.Objects[CbxShow.Items.IndexOf(CbxShow.Text)]).Name;
      FShowZoneInfoByName(ZoneName, '', LvDataView);
    end;
  end;
end;

procedure TFrmDBrowser.FListViewAddItem(View: TListView; Data: TDataRow; New: Boolean);
var
  Li: TListItem;
begin
  Li := View.Items.Add;
  LI.Caption := Data.CreatureName;
  LI.SubItems.Add(IntToStr(Data.HostKills));
  LI.SubItems.Add(IntToStr(Data.LocalKills));
  if FConfig.IncludeHostData then
    LI.SubItems.Add(IntToStr(Data.HostKills+Data.LocalKills))
  else
    LI.SubItems.Add(IntToStr(Data.LocalKills));
  Li.SubItems.Add(IfThen(New, '1', '0'));
end;

procedure TFrmDBrowser.FShowDynamicZoneInfoByName(ZoneName: String; DataView: TListView);
  function FFCalcPercent(Kills, Total: Integer): String;
  begin
    Result := FormatFloat('0.00', (Kills/Total)*100);
  end;

  procedure FFAddZone(var ZoneData: TDataList; Caption, ZoneName: String);
  var
    I, TempKills, HighestKills, SecondHighestKills: Integer;
    HighestKillsName, SecondHighestKillsName: String;
    Li: TListItem;
  begin
    FDataConfig.GetZoneData(ZoneData, ZoneName);

    if ZoneData.Count > 0 then begin
      Li := DataView.Items.Add;
      Li.Caption := Caption;

      HighestKills := 0;
      SecondHighestKills := 0;
      HighestKillsName := '';
      SecondHighestKillsName := '';

      for I:=0 to ZoneData.Count-1 do begin
        if FConfig.IncludeHostData then
          TempKills := TDataRow(ZoneData[I]).HostKills+TDataRow(ZoneData[I]).LocalKills
        else
          TempKills := TDataRow(ZoneData[I]).LocalKills;

        if TempKills > HighestKills then begin
          SecondHighestKills := HighestKills;
          HighestKills := TempKills;
          SecondHighestKillsName := HighestKillsName;
          HighestKillsName := TDataRow(ZoneData[I]).CreatureName;
        end else if TempKills > SecondHighestKills then begin
          SecondHighestKills := TempKills;
          SecondHighestKillsName := TDataRow(ZoneData[I]).CreatureName;
        end;
      end;

      Li.SubItems.Add(HighestKillsName);
      Li.SubItems.Add(SecondHighestKillsName);
    end;

    ZoneData.Clear;
  end;

var
  SubZones: TObjectList;
  ZoneData: TDataList;
  I: Integer;
begin
  DataView.Clear;
  SubZones := TObjecTList.Create();
  ZoneData := TDataList.Create();

  try
    FZoneConfig.GetSubZoneObjects(SubZones, ZoneName);
    FFAddZone(ZoneData, ZoneName, ZoneName);
    for I:=0 to SubZones.Count-1 do
      FFAddZone(ZoneData, TZoneObj(SubZones[i]).Name + ' (' + TZoneObj(SubZones[i]).LevelRange + ')', TZoneObj(SubZones[i]).Name);
  finally
    SubZones.Free();
    ZoneData.Free();
  end;
end;

procedure TFrmDBrowser.FShowZoneInfoByName(ZoneName, creatureType: String; DataView: TListView);
  procedure FAddFakeInfo(Name: String; Count: Integer);
  var
    TmpDataRow: TDataRow;
  begin
    TmpDataRow := TDataRow.Create(Name, 0, Count);
    try
      FListViewAddItem(DataView, TmpDataRow, False);
    finally
      TmpDataRow.Free;
    end;
  end;
var
  ZoneData: TDataList;
  I: Integer;
begin
  DataView.Clear;

  ZoneData := TDataList.Create();
  FDataConfig.GetZoneData(ZoneData, ZoneName);

  try
    // Data for this zone
    for I := 0 to ZoneData.Count-1 do
      FListViewAddItem(DataView, TDataRow(ZoneData[i]), (creatureType <> '') and AnsiStartsStr(creatureType, TDataRow(ZoneData[i]).CreatureName));

    // Just for fun :)
    if ZoneName = cTavernZoneName then begin
      FAddFakeInfo(cCreatureWench, 1);
      FAddFakeInfo(FCharName, 1);
      Randomize();
      FAddFakeInfo(cCreatureRandom, Random(70) + 2);
    end else if ZoneData.Count = 0 then // Show "no data"
      DataView.AddItem(cNoDataStr, nil);

    DataView.SortType := stNone;
    DataView.SortType := stData;
  finally
    ZoneData.Free();
  end;
end;

procedure TFrmDBrowser.EditAddressBarKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
    WebBrowser1.Navigate(EditAddressBar.Text);
end;

procedure TFrmDBrowser.FUpdateUI();
var
  Enabled: Boolean;
begin
  Enabled := FCharName <> '';

  ActCharsheet.Enabled := Enabled;
  ActAdvantages.Enabled := Enabled;
  ActRecentHappenings.Enabled := Enabled;
  ActReturnToLocation.Enabled := Enabled;
  ActRankings.Enabled := Enabled;
  ActInventory.Enabled := Enabled;
  ActInventoryList.Enabled := Enabled;
  ActCompetitionGroups.Enabled := Enabled;
  ActTitles.Enabled := Enabled;
  ActPublicPage.Enabled := Enabled;

  ActIncreaseDifficulty.Enabled := Enabled and (FCurrentZone <> '') and (FCurrentZone <> cTavernZoneName);
  ActDecreaseDifficulty.Enabled := Enabled and (FCurrentZone <> '') and (FCurrentZone <> cTavernZoneName);
  ActExplore.Enabled := Enabled and (FCurrentZone <> '') and (FCurrentZone <> cTavernZoneName);
  ActReturnToTavern.Enabled := Enabled and (FCurrentZone <> cTavernZoneName);

  LvActiveZoneData.Columns.Items[0].Width := IfThen(FConfig.HostLocalDataColumns, 110, 206);
  LvActiveZoneData.Columns.Items[1].Width := IfThen(FConfig.HostLocalDataColumns, 48, 0);
  LvActiveZoneData.Columns.Items[2].Width := IfThen(FConfig.HostLocalDataColumns, 48, 0);
  if FConfig.DynamicDataview then begin
    LvDataView.Columns.Items[0].Width := 120;
    LvDataView.Columns.Items[1].Width := 68;
    LvDataView.Columns.Items[2].Width := 68;
    LvDataView.Columns.Items[3].Width := 0;
    LvDataView.Columns.Items[1].Caption := 'Best';
    LvDataView.Columns.Items[2].Caption := '2nd Best';
  end else begin
    LvDataView.Columns.Items[0].Width := IfThen(FConfig.HostLocalDataColumns, 110, 206);
    LvDataView.Columns.Items[1].Width := IfThen(FConfig.HostLocalDataColumns, 48, 0);
    LvDataView.Columns.Items[2].Width := IfThen(FConfig.HostLocalDataColumns, 48, 0);
    if FConfig.HostLocalDataColumns then
      LvDataView.Columns.Items[3].Width := 50;
    LvDataView.Columns.Items[1].Caption := 'Host';
    if FConfig.HostLocalDataColumns then
      LvDataView.Columns.Items[2].Caption := 'Local'
    else
      LvDataView.Columns.Items[2].Caption := 'Total';
  end;

  PnlBrowserBar.Height := IfThen(FConfig.ShowBrowserNavBar, 34, 0);
end;

procedure TFrmDBrowser.LvActiveZoneDataAdvancedCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
  // Draw the line with "new creature found" as bold style.
  if (Item.SubItems.Count > 2) and (StrToIntDef(Item.SubItems[3], 0) = 1) then
    Sender.Canvas.Font.Style := Sender.Canvas.Font.Style + [fsBold];

  // Draw alternating row colors.
  if Item.Index mod 2 = 0 then
    Sender.Canvas.Brush.Color := $F6F6F6
  else
    Sender.Canvas.Brush.Color := clWhite;
end;

procedure TFrmDBrowser.LvDataViewAdvancedCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
  if (Item.Index = 0) and (FConfig.DynamicDataview) then
    Sender.Canvas.Font.Style := Sender.Canvas.Font.Style + [fsBold];

  // Draw alternating row colors.
  if Item.Index mod 2 = 0 then
    Sender.Canvas.Brush.Color := $F6F6F6
  else
    Sender.Canvas.Brush.Color := clWhite;
end;

procedure TFrmDBrowser.LvActiveZoneDataColumnClick(Sender: TObject; Column: TListColumn);
begin
  TListView(Sender).SortType := stNone;
  if Column.Index <> FConfig.ZoneViewSortColumn then begin
    FConfig.ZoneViewSortColumn := Column.Index;
    FConfig.ZoneViewSortDescending := False;
  end else
    FConfig.ZoneViewSortDescending := not FConfig.ZoneViewSortDescending;
  TListView(Sender).SortType := stData;
end;

procedure TFrmDBrowser.LvActiveZoneDataCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  Compare := 0;
  if FConfig.ZoneViewSortColumn = 0 then
    Compare := CompareText(Item1.Caption, Item2.Caption)
  else if (FConfig.ZoneViewSortColumn <> 0) and (Item1.SubItems.Count >= FConfig.ZoneViewSortColumn) then begin
    if StrToIntDef(Item1.SubItems[FConfig.ZoneViewSortColumn-1], 0) < StrToIntDef(Item2.SubItems[FConfig.ZoneViewSortColumn-1], 0) then
      Compare := 1
    else if StrToIntDef(Item1.SubItems[FConfig.ZoneViewSortColumn-1], 0) > StrToIntDef(Item2.SubItems[FConfig.ZoneViewSortColumn-1], 0) then
      Compare := -1
    else
      Compare := 0;
  end;

  if FConfig.ZoneViewSortDescending then Compare := -Compare;
end;

procedure TFrmDBrowser.LvDataViewColumnClick(Sender: TObject; Column: TListColumn);
begin
  TListView(Sender).SortType := stNone;
  if Column.Index <> FConfig.DataViewSortColumn then begin
    FConfig.DataViewSortColumn := Column.Index;
    FConfig.DataViewSortDescending := False;
  end else
    FConfig.DataViewSortDescending := not FConfig.DataViewSortDescending;
  TListView(Sender).SortType := stData;
end;

procedure TFrmDBrowser.LvDataViewCompare(Sender: TObject; Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  Compare := 0;
  if FConfig.DataViewSortColumn = 0 then
    Compare := CompareText(Item1.Caption, Item2.Caption)
  else if (FConfig.DataViewSortColumn <> 0) and (Item1.SubItems.Count >= FConfig.DataViewSortColumn) then begin
    if StrToIntDef(Item1.SubItems[FConfig.DataViewSortColumn-1], 0) < StrToIntDef(Item2.SubItems[FConfig.DataViewSortColumn-1], 0) then
      Compare := 1
    else if StrToIntDef(Item1.SubItems[FConfig.DataViewSortColumn-1], 0) > StrToIntDef(Item2.SubItems[FConfig.DataViewSortColumn-1], 0) then
      Compare := -1
    else
      Compare := 0;
  end;

  if FConfig.DataViewSortDescending then Compare := -Compare;
end;

end.
