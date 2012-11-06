unit UDlgCubeProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TDlgCubeProgress = class(TForm)
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    LblCount: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetMaxValue(Max: Integer);
    procedure SetCurValue(Cur: Integer);
  end;

var
  DlgCubeProgress: TDlgCubeProgress;

implementation

{$R *.dfm}

procedure TDlgCubeProgress.FormCreate(Sender: TObject);
begin
  ProgressBar1.Min := 0;
end;

procedure TDlgCubeProgress.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//
end;

procedure TDlgCubeProgress.SetMaxValue(Max: Integer);
begin
  ProgressBar1.Max := Max;
  LblCount.Caption := '0/' + IntToStr(ProgressBar1.Max);
end;

procedure TDlgCubeProgress.SetCurValue(Cur: Integer);
begin
  LblCount.Caption := IntToStr(Cur) + '/' + IntToStr(ProgressBar1.Max);
  ProgressBar1.Position := Cur;
  LblCount.Invalidate;
  LblCount.Repaint;
  ProgressBar1.Invalidate;
  ProgressBar1.Repaint;
  Application.ProcessMessages;
end;

end.
