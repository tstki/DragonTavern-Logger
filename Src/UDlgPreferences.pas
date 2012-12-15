unit UDlgPreferences;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UConfig, UDataConfig;

type
  TDlgPreferences = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    BtnOK: TButton;
    BtnCancel: TButton;
    GroupBox2: TGroupBox;
    ChkShowBrowserNavBar: TCheckBox;
    ChkIncludeHostData: TCheckBox;
    BtnMerge: TButton;
    ChkShowMenuBar: TCheckBox;
    ChkShowDataBoxes: TCheckBox;
    Label3: TLabel;
    CbxButtonStyle: TComboBox;
    ChkHostLocalDataColumns: TCheckBox;
    GroupBox3: TGroupBox;
    ChkUseAnalyzerGreenNumberPercent: TCheckBox;
    Label2: TLabel;
    EditMinimumKills: TEdit;
    LblUseAnalyzerGreenNumberPercent: TLabel;
    EditAnalyzerGreenNumberPercent: TEdit;
    Label5: TLabel;
    ChkUseAnalyzerDarkGreenNumberPercent: TCheckBox;
    EditAnalyzerDarkGreenNumberPercent: TEdit;
    LblUseAnalyzerDarkGreenNumberPercent: TLabel;
    ChkColorBelowMinimumKills: TCheckBox;
    ChkLazyZoneview: TCheckBox;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    EditUsername: TEdit;
    Label7: TLabel;
    EditPassword: TEdit;
    Label4: TLabel;
    RadioExportPercentages: TRadioButton;
    RadioExportValues: TRadioButton;
    Label8: TLabel;
    ChkLogEventCreatures: TCheckBox;
    Label9: TLabel;
    GroupBox5: TGroupBox;
    ChkLimitInvCubeCharges: TCheckBox;
    ChkHideBeerRealm: TCheckBox;
    ChkBestHuntingColumns: TCheckBox;
    ChkOrderByCreature: TCheckBox;
    ChkDynamicDataview: TCheckBox;
    ChkDetectSoulStatus: TCheckBox;
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
                   (StrToIntDef(EditMinimumKills.Text, -1) >= 0);
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
