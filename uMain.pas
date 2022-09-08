unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent,
  FMX.Edit;

type
  TForm8 = class(TForm)
    Layout1: TLayout;
    Image1: TImage;
    Button1: TButton;
    FHTTP: TNetHTTPClient;
    eText: TEdit;
    AIndicator: TAniIndicator;
    Rectangle1: TRectangle;
    procedure Button1Click(Sender: TObject);
    procedure FHTTPRequestCompleted(const Sender: TObject;
      const AResponse: IHTTPResponse);
  private
    { Private declarations }
  public
    { Public declarations }
    strm : TBytesStream;
  end;

var
  Form8: TForm8;

implementation

{$R *.fmx}

procedure TForm8.Button1Click(Sender: TObject);
begin
//Request to server API
AIndicator.Visible := true;
strm := TBytesStream.Create;
FHTTP.Get('https://api.qrserver.com/v1/create-qr-code/?size=150x150&data='+etext.Text,
strm);

end;

procedure TForm8.FHTTPRequestCompleted(const Sender: TObject;
  const AResponse: IHTTPResponse);
begin
  try
    image1.Bitmap.LoadFromStream(strm);
  finally
    AIndicator.Visible := false;
    strm.Free;
  end;

end;

end.
