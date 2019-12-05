unit uServerTEF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms,threading, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Timer1: TTimer;
    StaticText1: TStaticText;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Monitorar;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure CriarPastasSeNescessarioTEF;
    { Private declarations }
  public
    { Public declarations }
    Ocupado : boolean;
    contador : integer;
    EncerraApplicacao : boolean;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin

contador := 0;
Monitorar;

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
application.Minimize;
EncerraApplicacao := true;
application.ProcessMessages;
sleep(250);
Application.ProcessMessages;
action := cafree;
form1 := nil;
end;

procedure TForm1.CriarPastasSeNescessarioTEF;
var
Gerenciador : string;
begin
Gerenciador := ComboBox1.Text;
  if not DirectoryExists('c:\'+Gerenciador) then
    CreateDir('c:\'+Gerenciador);
  Application.ProcessMessages;
  if not DirectoryExists('c:\'+Gerenciador+'\req') then
    CreateDir('c:\'+Gerenciador+'\req');
  if not DirectoryExists('c:\'+Gerenciador+'\resp') then
    CreateDir('c:\'+Gerenciador+'\resp');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CriarPastasSeNescessarioTEF;
   ocupado := true;
memo1.Clear;
end;

procedure TForm1.Monitorar;
var
Req, Resp,Gerenciador : string;
li : TStringlist;
begin
Gerenciador := ComboBox1.Text;
CriarPastasSeNescessarioTEF;
contador := 0;
li := TStringlist.Create;
Resp := 'c:\'+Gerenciador+'\Resp\intpos';
 li.Clear;
 if edit1.Text = '' then edit1.Text := '0';

TTask.Run(procedure  begin
  Req := 'c:\'+Gerenciador+'\req\intpos';
   try
   while not FileExists(Req+'.001') do
    begin
    if EncerraApplicacao then break;

    sleep(250);
    contador := contador+1;
    StaticText1.Caption := inttostr(contador);
    application.ProcessMessages;
    end;

    li.LoadFromFile(Req+'.001');
    memo1.lines.Text := memo1.lines.Text+li.Text+#13;
    memo1.SelStart := length(memo1.Text)-1;
    li.SaveToFile(resp+'.sts');
    li.Insert(1,'030-000 = Server TEf Funcionando');
    li.Insert(2,'031-000 = Mensagem Cliente'); //028-000
     li.Insert(3,'009-000 = '+edit1.Text);
    //imprimir

     li.Insert(4,'028-000 = 3');
     li.Insert(5,'029-001 = linha 2');
     li.Insert(6,'029-002 = linha 3');
     li.Insert(7,'029-003 = linha 4');
     li.Insert(8,'012-000 = 01254');
     li.Insert(9,'010-000 = rede');
     li.Text := stringreplace(li.Text, '706-000 = 3','',[rfreplaceall]);
    label1.Caption := li.Text;
       li.SaveToFile(resp+'.001');
    DeleteFile(Req+'.001');
    monitorar;
   except
   on e:exception do memo1.Lines.Add(e.Message);
   end;
  end);
end;

end.
