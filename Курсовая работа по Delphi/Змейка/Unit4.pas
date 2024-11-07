unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons, MMSystem, ShellAPI;

type
  TForm4 = class(TForm)
    Image1: TImage;
    BitBtn1: TBitBtn;
    ScrollBar1: TScrollBar;
    CheckBox1: TCheckBox;
    Image5: TImage;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Panel1: TPanel;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    Edit1: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N6: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure CreateParams(var Params: TCreateParams) ; override;
    procedure N6Click(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}
uses Unit1;

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
  Form4.Hide;
  Form1.Show;
end;

procedure TForm4.CheckBox1Click(Sender: TObject);
begin
 if CheckBox1.Checked = True then Form1.MediaPlayer1.Pause
 else
 if CheckBox1.Checked = False then  Form1.MediaPlayer1.Play;

end;

procedure TForm4.N2Click(Sender: TObject);
begin
    close;
end;

procedure TForm4.N4Click(Sender: TObject);
begin
    ShowMessage('�����: �������� �������');
end;

procedure TForm4.N5Click(Sender: TObject);
begin
    ShowMessage('������: 1.0.0 ');
end;

procedure TForm4.N6Click(Sender: TObject);
begin
  ShellExecute(0,PChar('Open'),PChar('Help.chm'),nil,nil,SW_SHOW);
end;

procedure TForm4.ScrollBar1Change(Sender: TObject);
begin
  Form1.SetVolume(ScrollBar1.Position);
end;

procedure TForm4.CreateParams(var Params: TCreateParams) ;// ��������� ��� ���� ����� ����� � ������ ����� �� ��������
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := 0;
end;



end.
