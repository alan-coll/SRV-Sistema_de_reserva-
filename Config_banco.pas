unit Config_banco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uBiblioteca;

type
  TConfig_bd = class(TForm)
    lblcaminho: TLabel;
    EdtCaminhobanco: TEdit;
    BtnSalvar: TButton;
    Opnpastas: TOpenDialog;
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure configuracao;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Config_bd: TConfig_bd;

implementation

{$R *.dfm}
 //Chama a procedure de Configuração
procedure TConfig_bd.BtnSalvarClick(Sender: TObject);
begin
  configuracao;

end;
//Função para validar o caminho do botão....
procedure TConfig_bd.configuracao;
var
  vfilename: string;
begin
  if Opnpastas.Execute then
  begin
    EdtCaminhobanco.Text := Opnpastas.FileName;
    vfilename := ExtractFilePath(Application.ExeName) + 'Reserva_Veiculos.ini';
    SetValorIni(vfilename, 'Configuracao', 'Caminho_db', EdtCaminhobanco.Text);
    ShowMessage('Caminho configurado com Sucesso!!!');
    Application.Terminate;
    Self.Close;
  end;

end;
//Função ao terminar
procedure TConfig_bd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

end.
