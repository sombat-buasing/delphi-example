unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  StrUtils,
  Rest.JSON, System.JSON;

type
  TForm2 = class(TForm)
    LabeledEdit1: TLabeledEdit;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    FileOpenDialog1: TFileOpenDialog;
    Memo2: TMemo;
    btnHeader: TBitBtn;
    btnData: TBitBtn;
    Memo3: TMemo;
    Memo4: TMemo;
    btnJson: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure LabeledEdit1Change(Sender: TObject);
    procedure btnHeaderClick(Sender: TObject);
    procedure btnDataClick(Sender: TObject);
    procedure btnJsonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}



Function ReadText(Var cTxt : string ) : string ;
var
  cResult : string ;
  nPos : integer ;
begin
  cResult := '' ;
  if (Copy(cTxt,1,1) = '"') then begin
    nPos := Pos('",',cTxt) ;
    if (nPos <= 0) then begin
      if (RightStr(cTxt,1) = '"') then begin
        cTxt := Copy(cTxt,2,Length(cTxt)-2) ;
      end;

      cResult := cTxt ;
      cTxt := '' ;
    end else begin
      cResult := Copy(cTxt,2,nPos-2  ) ;
      cResult := StringReplace(cResult, '""', '"',
                          [rfReplaceAll, rfIgnoreCase]);
      cTxt := Copy(cTxt, nPos+2 ,length(cTxt)) ;
    end;

  end
  else
  begin
    if (pos(',',cTxt) <= 0) then begin
      cResult := cTxt ;
      cTxt := '' ;
    end else begin
      cResult := Copy(cTxt,1,pos(',',cTxt)-1) ;
      cTxt := Copy(cTxt,pos(',',cTxt)+1,length(cTxt)) ;
    end;
  end;

  result := cResult ;

end;


procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  if FileOpenDialog1.Execute then
    LabeledEdit1.Text := FileOpenDialog1.FileName ;
end;

procedure TForm2.btnJsonClick(Sender: TObject);
var
  aHead : TArray<String>;
  cHeader, txt, cText : string;
  n, i : integer;
  json : TJSONObject;
  jarr : TJSONArray;
begin
  n := 0;
  cHeader := Memo1.Lines.Strings[0];
  while (cHeader <> Emptystr) do
  begin
    SetLength(aHead, n + 1);
    aHead[n] := ReadText(cHeader);
    n := n + 1;
  end;

  Memo4.Clear;
  jarr := TJSONArray.create;

  i := 1 ;
  while ( i <= Memo1.lines.count - 1 )  do
  begin
    cText := Memo1.Lines.Strings[i] ;

    json := TJSONObject.create;

    n := 0;
    while n <= Length(aHead) - 1 do
    begin
      txt := ReadText( cText );

      json.AddPair(aHead[n], txt);

      n := n + 1;
    end;
    jarr.AddElement(json as TJSONObject);

    i := i + 1;
  end;

  memo4.lines.add( TJSON.Format(jArr) );

end;

procedure TForm2.btnDataClick(Sender: TObject);
var
  aHead : TArray<String>;
  cHeader, txt, cText : string;
  n, i : integer;
begin
  n := 0;
  cHeader := Memo1.Lines.Strings[0];
  while (cHeader <> Emptystr) do
  begin
    SetLength(aHead, n + 1);
    aHead[n] := ReadText(cHeader);
    n := n + 1;
  end;



  Memo3.Clear;
  i := 1 ;
  while ( i <= Memo1.lines.count - 1 )  do
  begin
    cText := Memo1.Lines.Strings[i] ;

    n := 0;
    while n <= Length(aHead) - 1 do
    begin
      txt := ReadText( cText );
      Memo3.lines.add( aHead[n] + ' = ' + txt );
      n := n + 1;
    end;
    Memo3.Lines.add('---------------' );

    i := i + 1;
  end;

end;

procedure TForm2.btnHeaderClick(Sender: TObject);
var
  cHeader, txt : string;
begin
  cHeader := Memo1.lines.Strings[0];

  Memo2.Lines.Clear;

  while Length(cHeader) > 0 do
  begin
    txt := ReadText(cHeader);
    Memo2.Lines.Add( txt ) ;
  end;

end;

procedure TForm2.LabeledEdit1Change(Sender: TObject);
begin
  memo1.lines.LoadFromFile( LabeledEdit1.Text );
end;

end.
