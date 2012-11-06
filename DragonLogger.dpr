program DragonLogger;

uses
  Forms,
  UFrmMain in 'Src\UFrmMain.pas' {FrmDBrowser},
  UDlgInventory in 'Src\UDlgInventory.pas' {DlgInventory},
  UStrings in 'Src\UStrings.pas',
  UConfig in 'Src\UConfig.pas',
  UDataConfig in 'Src\UDataConfig.pas',
  UZoneConfig in 'Src\UZoneConfig.pas',
  UDlgPageSource in 'Src\UDlgPageSource.pas' {DlgPageSource},
  UDlgAbout in 'Src\UDlgAbout.pas' {DlgAbout},
  UDlgHotKeys in 'Src\UDlgHotKeys.pas' {DlgHotkeys},
  UDlgPreferences in 'Src\UDlgPreferences.pas' {DlgPreferences},
  UDlgAnalyze in 'Src\UDlgAnalyze.pas' {Form1},
  UDlgCubeProgress in 'Src\UDlgCubeProgress.pas' {DlgCubeProgress};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmDBrowser, FrmDBrowser);
  Application.CreateForm(TDlgCubeProgress, DlgCubeProgress);
  Application.Run;
end.
