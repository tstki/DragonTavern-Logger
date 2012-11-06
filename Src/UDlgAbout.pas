unit UDlgAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, pngimage;

type
  TDlgAbout = class(TForm)
    BtnOK: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    LblVersionNum: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  UStrings;

{$R *.dfm}

procedure TDlgAbout.FormCreate(Sender: TObject);
begin
  LblVersionNum.Caption := StrVersion;
end;

procedure TDlgAbout.FormDestroy(Sender: TObject);
begin
//
end;

end.
