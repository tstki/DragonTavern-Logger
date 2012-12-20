unit UDlgPreferences;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UConfig, UDataConfig, ComCtrls;

type
  TDlgPreferences = class(TForm)
    BtnOK: TButton;
    BtnCancel: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    EditUsername: TEdit;
    EditPassword: TEdit;
    GroupBox5: TGroupBox;
    ChkLimitInvCubeCharges: TCheckBox;
    ChkShowMenuBar: TCheckBox;
    ChkShowDataBoxes: TCheckBox;
    ChkShowBrowserNavBar: TCheckBox;
    ChkHostLocalDataColumns: TCheckBox;
    Label3: TLabel;
    CbxButtonStyle: TComboBox;
    ChkLazyZoneview: TCheckBox;
    ChkDynamicDataview: TCheckBox;
    ChkDetectSoulStatus: TCheckBox;
    ChkUseAnalyzerGreenNumberPercent: TCheckBox;
    Label2: TLabel;
    ChkUseAnalyzerDarkGreenNumberPercent: TCheckBox;
    ChkHideBeerRealm: TCheckBox;
    ChkColorBelowMinimumKills: TCheckBox;
    ChkBestHuntingColumns: TCheckBox;
    ChkOrderByCreature: TCheckBox;
    EditMinimumKills: TEdit;
    EditAnalyzerDarkGreenNumberPercent: TEdit;
    EditAnalyzerGreenNumberPercent: TEdit;
    LblUseAnalyzerGreenNumberPercent: TLabel;
    LblUseAnalyzerDarkGreenNumberPercent: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    BtnMerge: TButton;
    RadioExportPercentages: TRadioButton;
    RadioExportValues: TRadioButton;
    ChkIncludeHostData: TCheckBox;
    Label8: TLabel;
    Label9: TLabel;
    ChkLogEventCreatures: TCheckBox;
    TabSheet5: TTabSheet;
    ChkImmortalSoulStealer: TCheckBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    EditForcedCharacterID: TEdit;
    Label13: TLabel;
    EditCubeDelay: TEdit;
    Label14: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnMergeClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure ItemChange(Sender: TObject);
    procedure ChkBestHuntingColumnsClick(Sender: TObject);
  private
    { Private declarations }
    FConfig: TConfig;
    FDataConfig: TDataConfig;
    procedure FUpdateUI();
  public
    { Public declarations }
    procedure SetConfig(Config: TConfig);
    procedure SetDataConfig(DataConfig: TDataConfig);
  end;

implementation

{$R *.dfm}

uses
  UStrings;

procedure TDlgPreferences.FormCreate(Sender: TObject);
begin
//Remove these later. Currently there is no option attached to them yet
  ChkShowMenuBar.Enabled := False;
  ChkShowDataBoxes.Enabled := False;
  Label3.Enabled := False;
  CbxButtonStyle.Enabled := False;

  PageControl1.ActivePage := TabSheet1;

  FUpdateUI();
end;

procedure TDlgPreferences.FormDestroy(Sender: TObject);
begin
//
end;

procedure TDlgPreferences.SetDataConfig(DataConfig: TDataConfig);
begin
  FDataConfig := DataConfig;
end;

procedure TDlgPreferences.FUpdateUI();
begin
  EditAnalyzerGreenNumberPercent.Enabled := ChkUseAnalyzerGreenNumberPercent.Checked;
  LblUseAnalyzerGreenNumberPercent.Enabled := ChkUseAnalyzerGreenNumberPercent.Checked;
  EditAnalyzerDarkGreenNumberPercent.Enabled := ChkUseAnalyzerDarkGreenNumberPercent.Checked;
  LblUseAnalyzerDarkGreenNumberPercent.Enabled := ChkUseAnalyzerDarkGreenNumberPercent.Checked;

  ChkOrderByCreature.Enabled := ChkBestHuntingColumns.Checked;

  BtnOK.Enabled := (not ChkUseAnalyzerGreenNumberPercent.Checked or (StrToIntDef(EditAnalyzerGreenNumberPercent.Text, -1) >= 0)) and
                   (not ChkUseAnalyzerDarkGreenNumberPercent.Checked  or (StrToIntDef(EditAnalyzerDarkGreenNumberPercent.Text, -1) >= 0)) and
                   (StrToIntDef(EditMinimumKills.Text, -1) >= 0) and
                   (StrToIntDef(EditCubeDelay.Text, -1) >= 200) and (StrToIntDef(EditCubeDelay.Text, -1) <= 5000);
end;

procedure TDlgPreferences.SetConfig(Config: TConfig);
begin
  FConfig := Config;

  CbxButtonStyle.Clear;
  CbxButtonStyle.AddItem(strIconAndText, nil);
  CbxButtonStyle.AddItem(strIconOnly, nil);
  CbxButtonStyle.AddItem(strTextOnly, nil);
  CbxButtonStyle.ItemIndex := FConfig.ButtonStyle;

  ChkShowMenuBar.Checked := FConfig.ShowMenuBar;
  ChkShowDataBoxes.Checked := FConfig.ShowDataBoxes;
  ChkShowBrowserNavBar.Checked := FConfig.ShowBrowserNavBar;
  ChkHostLocalDataColumns.Checked := FConfig.HostLocalDataColumns;
  ChkIncludeHostData.Checked := FConfig.IncludeHostData;
  ChkColorBelowMinimumKills.Checked := FConfig.ColorBelowMinimumKills;
  ChkLazyZoneview.Checked := FConfig.LazyZoneview;
  ChkLogEventCreatures.Checked := FConfig.LogEventCreatures;

  EditUsername.Text := FConfig.UserName;
  EditPassword.Text := FConfig.Password;

  ChkUseAnalyzerDarkGreenNumberPercent.Checked := FConfig.UseAnalyzeHighest;
  ChkUseAnalyzerGreenNumberPercent.Checked := FConfig.UseAnalyzeHigh;
  EditAnalyzerDarkGreenNumberPercent.Text := IntTostr(FConfig.AnalyzeHighestPercent);
  EditAnalyzerGreenNumberPercent.Text := Inttostr(FConfig.AnalyzeHighPercent);
  EditMinimumKills.Text := Inttostr(FConfig.AnalyzeMinimumKills);
  if FConfig.ExportPercentages then
    RadioExportPercentages.Checked := True
  else
    RadioExportValues.Checked := True;
  ChkLimitInvCubeCharges.Checked := FConfig.LimitInvCubeCharges;
  ChkHideBeerRealm.Checked := FConfig.HideBeerRealm;
  ChkBestHuntingColumns.Checked := FConfig.BestHuntingColumns;
  ChkOrderByCreature.Checked := FConfig.OrderByCreature;
  ChkDynamicDataview.Checked := FConfig.DynamicDataview;
  ChkDetectSoulStatus.Checked := FConfig.DetectSoulStatus;
  ChkImmortalSoulStealer.Checked := FConfig.ImmortalSoulStealer;
  EditForcedCharacterID.Text := FConfig.ForcedCharacterID;
  EditCubeDelay.Text := IntToStr(FConfig.CubeDelay);

  FUpdateUI();
end;

procedure TDlgPreferences.BtnOKClick(Sender: TObject);
begin
  // Save Settings
  FConfig.ShowMenuBar := ChkShowMenuBar.Checked;
  FConfig.ShowDataBoxes := ChkShowDataBoxes.Checked;
  FConfig.ShowBrowserNavBar := ChkShowBrowserNavBar.Checked;
  FConfig.ButtonStyle := CbxButtonStyle.ItemIndex;
  FConfig.HostLocalDataColumns := ChkHostLocalDataColumns.Checked;
  FConfig.IncludeHostData := ChkIncludeHostData.Checked;
  FConfig.ColorBelowMinimumKills := ChkColorBelowMinimumKills.Checked;
  FConfig.LazyZoneview := ChkLazyZoneview.Checked;
  FConfig.ExportPercentages := RadioExportPercentages.Checked;
  FConfig.LogEventCreatures := ChkLogEventCreatures.Checked;

  FConfig.UserName := EditUsername.Text;
  FConfig.Password := EditPassword.Text;

  FConfig.AnalyzeMinimumKills := StrToInt(EditMinimumKills.Text);
  FConfig.UseAnalyzeHighest := ChkUseAnalyzerDarkGreenNumberPercent.Checked;
  FConfig.UseAnalyzeHigh := ChkUseAnalyzerGreenNumberPercent.Checked;
  if FConfig.UseAnalyzeHighest then
    FConfig.AnalyzeHighestPercent := StrToInt(EditAnalyzerDarkGreenNumberPercent.Text);
  if FConfig.UseAnalyzeHigh then
    FConfig.AnalyzeHighPercent := StrToInt(EditAnalyzerGreenNumberPercent.Text);
  FConfig.LimitInvCubeCharges := ChkLimitInvCubeCharges.Checked;
  FConfig.HideBeerRealm :=  ChkHideBeerRealm.Checked;
  FConfig.BestHuntingColumns :=  ChkBestHuntingColumns.Checked;
  FConfig.OrderByCreature :=  ChkOrderByCreature.Checked;
  FConfig.DynamicDataview := ChkDynamicDataview.Checked;
  FConfig.DetectSoulStatus := ChkDetectSoulStatus.Checked;
  FConfig.ImmortalSoulStealer := ChkImmortalSoulStealer.Checked;
  FConfig.ForcedCharacterID := EditForcedCharacterID.Text;
  FConfig.CubeDelay := StrToInt(EditCubeDelay.Text);

  FConfig.WriteValues(False);
end;

procedure TDlgPreferences.ChkBestHuntingColumnsClick(Sender: TObject);
begin
  FUpdateUI();
end;

procedure TDlgPreferences.ItemChange( Sender: TObject);
begin
  FUpdateUI();
end;

procedure TDlgPreferences.BtnMergeClick(Sender: TObject);
begin
  if (MessageDlg(strMergeWarning, mtWarning, mbOKCancel, 0) = mrOK) and
     (MessageDlg(StrNoUndo, mtWarning, mbOKCancel, 0) = mrOK) then
    FDataConfig.DoMerge();
end;

end.
