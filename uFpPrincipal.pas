unit uFpPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, UdmReserva,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient,
  IdSNMP, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP;

type
  TFormPrincipal = class(TForm)
    Pn1: TPanel;
    BtnNovo: TButton;
    BtnGravar: TButton;
    FDQryReserva: TFDQuery;
    FDUpReserva: TFDUpdateSQL;
    FDTransaction: TFDTransaction;
    DsReserva: TDataSource;
    BtnCancel: TButton;
    FDQryPesquisa: TFDQuery;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses UformFzReserva;
//Função novo vai gerar um novo id para o banco e habilitar os edtis
procedure TFormPrincipal.BtnNovoClick(Sender: TObject);

begin
  if not(FDQryReserva.State in [dsEdit, dsInsert]) then
  begin
    FDQryReserva.Open();
    FDQryReserva.Append;
    FDQryReserva.Insert;
  end;

end;

// Função Gravar no banco
procedure TFormPrincipal.BtnGravarClick(Sender: TObject);
var
hora,hora_fim,data:string;
marca: string;
begin
marca:=FormReserva.DBEdtMarca_veiculo.Text;

data:=FormReserva.cxDBDate_rsv.Text;
hora:=FormReserva.cxDBTimeRsv.Text;
hora:=TimeToStr(Time);
hora_fim:=FormReserva.cxDBTimeFimRsv.Text;
hora_fim:=TimeToStr(Time);
//  FDQryPesquisa parametros para consultar no banco .........
    FDQryPesquisa.Close;
    FDQryPesquisa.SQL.Add('select * from reserva_veiculo');
    FDQryPesquisa.SQL.Add('where');
    FDQryPesquisa.SQL.Add('Marca_Veiculo=    :pmarca or');
    FDQryPesquisa.SQL.Add('Data_Reserva=     :pdate or');
    FDQryPesquisa.SQL.Add('Hora_reserva=     :phora or');
    FDQryPesquisa.SQL.Add('hora_fim_reserva= :phorafim');

    FDQryPesquisa.ParamByName('pmarca').AsString:=(marca);
    FDQryPesquisa.ParamByName('pdate').AsDate:=StrToDate(data);
    FDQryPesquisa.ParamByName('phora').AsTime:=StrToTime(hora);
    FDQryPesquisa.ParamByName('phorafim').AsTime:=StrToTime(hora_fim);
    FDQryPesquisa.Open();
//Condição verdadeira para caso os valores retornem maior que 0
  if FDQryPesquisa.RecordCount >0 then
    begin
     MessageDlg('Agendamento Encontrado!!',mtConfirmation,[mbOK],0);

    FDTransaction.RollbackRetaining;
    FDQryReserva.SQL.Clear;
    FDQryReserva.Close;
    abort;
    FDQryReserva.Open();

    end

//Condição Falsa para caso os valores não retornem maior que 0
    else
    if FDQryReserva.State in [dsEdit, dsInsert] then
    begin
      FDTransaction.StartTransaction;
      FDQryReserva.Post;
      FDTransaction.CommitRetaining;
      ShowMessage('Agendamento realizado Com Sucesso!');
      FDTransaction.Free;
    end;

  end;



//Função cancelar e Roolback
procedure TFormPrincipal.BtnCancelClick(Sender: TObject);
begin
  try
  if FDQryReserva.State in [dsEdit, dsInsert] then
  begin
    ShowMessage('Agendamento Cancelado!');
    FDQryReserva.Cancel;
    FDTransaction.RollbackRetaining;
  end;

  finally
  FDQryReserva.SQL.Clear;
  Close;

  end;



end;


end.
