unit UDlgPageSource;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TDlgPageSource = class(TForm)
    Memo1: TMemo;
    BtnOK: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Memo1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetMemo(Memo: String);
  end;

implementation

{$R *.dfm}

procedure TDlgPageSource.FormCreate(Sender: TObject);
begin
//
end;

procedure TDlgPageSource.FormDestroy(Sender: TObject);
begin
//
end;

procedure TDlgPageSource.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Ord('A')) and (ssCtrl in Shift) then begin
    TMemo(Sender).SelectAll;
    Key := 0;
  end else if Key = Ord(#27) then begin
    ModalResult := mrClose;
  end;
end;

procedure TDlgPageSource.SetMemo(Memo: String);
begin
  Memo1.Lines.Add(Memo);
end;

end.
