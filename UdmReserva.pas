unit UdmReserva;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.Comp.Client, Data.DB, Config_banco, uBiblioteca, Vcl.Forms;

type
  TDmReserva = class(TDataModule)
    FDConect: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure CarregaBD;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmReserva: TDmReserva;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
//Função para carregar as configurações do banco
procedure TDmReserva.CarregaBD;
begin
  try
    FDConect.Params.Database := GetvalorIni(ExtractFilePath(Application.ExeName)
      + 'Reserva_Veiculos.ini', 'Configuracao', 'Caminho_db');
    FDConect.Connected := True;
  except
    Config_bd.showmodal;

  end;
end;
//função para mostraras configurações no data module.
procedure TDmReserva.DataModuleCreate(Sender: TObject);
begin
  CarregaBD;
end;

end.
