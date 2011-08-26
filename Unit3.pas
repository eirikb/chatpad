unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TForm3 = class(TForm)
    ListBox1: TListBox;
    Memo1: TMemo;
    Label1: TLabel;
    Timer1: TTimer;
    Label2: TLabel;
    poster: TLabel;
    Label3: TLabel;
    postavdeg: TLabel;
    Label4: TLabel;
    tildeg: TLabel;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  sec: integer;
  min: integer;
  hour: integer;
  days: integer;

implementation

{$R *.DFM}

procedure TForm3.Timer1Timer(Sender: TObject);
begin
  if label1.caption <> 'Tid i kanal:' then
  begin
    sec := sec+1;
    if sec = 60 then
    begin
      min := min+1;
      sec := 0;
    end;
    if min = 60 then
    begin
      hour := hour+1;
      min := 0;
    end;
    if hour = 24 then
    begin
      days := days+1;
      hour := 0;
    end;
    label1.caption := 'Tid i kanal: '+IntToStr(days)+':'+IntToStr(hour)+':'+IntToStr(min)+':'+IntToStr(sec);
  end;
end;

end.
