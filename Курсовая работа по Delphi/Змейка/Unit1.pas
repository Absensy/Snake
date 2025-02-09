unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Imaging.GIFImg, Vcl.Mask, Vcl.MPlayer, MMSystem, ShellAPI;
type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Image2: TImage;
    Image1: TImage;
    Image3: TImage;
    BitBtn4: TBitBtn;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    MediaPlayer1: TMediaPlayer;
    N6: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SetVolume(Volume: Integer);
    procedure BitBtn4Click(Sender: TObject);
    procedure MediaPlayer1Notify(Sender: TObject);
    procedure N6Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit3, Unit2, Unit4, Unit5;


procedure TForm1.BitBtn1Click(Sender: TObject);
begin
   form1.Hide;
   form3.Show;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Form1.Hide;
  Form4.Show;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  MediaPlayer1.Close;
  close;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  Form1.Hide;
  Form5.Show;
end;

procedure TForm1.FormCreate(Sender: TObject);
var fontway, Music1:string;
begin
  fontway:=extractfilepath(application.ExeName);
  addfontresource(PChar(fontway + 'font\press-start-k.ttf'));
  Music1 := ExtractFilePath(Application.ExeName) + 'terrariya-den.mp3';
  MediaPlayer1.FileName := Music1;
  MediaPlayer1.AutoOpen := True;
  MediaPlayer1.Open;
  MediaPlayer1.Play;
  if MediaPlayer1.Mode = mpStopped then
  begin
    MediaPlayer1.Rewind;
    MediaPlayer1.Play;
  end;
end;



procedure TForm1.FormShow(Sender: TObject);

begin
try
  form2.ShowModal;
  form2.Destroy;
except
end;
end;

procedure TForm1.MediaPlayer1Notify(Sender: TObject);
begin
 // ������������ ������
  if MediaPlayer1.Mode = mpStopped then
  begin
    MediaPlayer1.Rewind;
    MediaPlayer1.Play;
  end;
  MediaPlayer1.Notify := True; // �������� ����������� �����
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
 ShowMessage('�����: ������� ��������');
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  ShowMessage('������: 1.0.0');
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  ShellExecute(0,PChar('Open'),PChar('Help.chm'),nil,nil,SW_SHOW);
end;

procedure TForm1.SetVolume(Volume: Integer);
var
  ConvertedVolume: DWORD;
begin
  if (Volume < Form4.ScrollBar1.Min) or (Volume > Form4.ScrollBar1.Max) then
    Exit;

  // ����������� �������� ��������� � �������� ��� waveOutSetVolume
  ConvertedVolume := Round((Volume / Form4.ScrollBar1.Max) * $FFFF);

  // ��������� ��������� ��� ����� ������� (������ � �������)
  ConvertedVolume := (ConvertedVolume shl 16) or ConvertedVolume;
  waveOutSetVolume(0, ConvertedVolume);
end;





end.

