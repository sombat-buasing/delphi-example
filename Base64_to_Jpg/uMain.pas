unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.NetEncoding,  JPEG, IdCoderMIME, hyieutils, iexBitmaps, hyiedefs,
  iesettings, iexLayers, iexRulers, iexToolbars, iexUserInteractions, ieview,
  imageenview, imageen, Vcl.Buttons, Vcl.ExtDlgs;

type
  TfrmMain = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    ImageEnView1: TImageEnView;
    BitBtn1: TBitBtn;
    OpenTextFileDialog1: TOpenTextFileDialog;
    Image1: TImage;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.BitBtn1Click(Sender: TObject);
begin
  if OpenTextFileDialog1.Execute then
  begin
    Memo1.lines.LoadFromFile(OpenTextFileDialog1.FileName);
  end;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
var
 Stream : TBytesStream;
begin
  Stream := TBytesStream.Create(TNetEncoding.Base64.DecodeStringToBytes(memo1.Text) );
  try
    Stream.Position := 0;
    ImageEnView1.IO.LoadFromStreamJpeg(Stream);
    Imageenview1.Fit;
  finally
    Stream.Free;
  end;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
var
 Stream : TBytesStream;
 Jpg : TJPEGImage;
 bb : TBytes;
begin
  Stream := TBytesStream.Create(TNetEncoding.Base64.DecodeStringToBytes(memo1.Text) );
  try
    Stream.Position := 0;

    Jpg := TJPEGImage.Create;
    try
      Jpg.LoadFromStream(stream);
//      image1.Picture.Assign( Jpg ) ;
      Image1.Picture.Bitmap.Assign(jpg) ;
    finally
      Jpg.free;
    end;

  finally
    Stream.Free;
  end;
end;

procedure TfrmMain.Button3Click(Sender: TObject);
begin
  Image1.Canvas.Font.Color := clBlue ;
  Image1.Canvas.Font.Size := 15 ;

  Image1.Canvas.TextOut(0,100,'TEXT OUT TEST');

end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  memo1.lines.clear;
end;

end.
