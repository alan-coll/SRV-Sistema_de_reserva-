unit UformFzReserva;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFpPrincipal, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls,
  Vcl.ExtCtrls,
  UdmReserva, Vcl.DBCtrls, Vcl.Mask, uBiblioteca, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient,
  IdSNMP, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP,  Datasnap.Provider, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdMessage, Vcl.WinXPickers, Vcl.ComCtrls,Vcl.Grids, Vcl.DBGrids;

type
  TFormReserva = class(TFormPrincipal)
    FDQryReservaNOME_SOLICITE: TStringField;
    FDQryReservaDATA_RESERVA: TDateField;
    FDQryReservaID_RESERVA: TIntegerField;
    FDQryReservaHORA_RESERVA: TTimeField;
    FDQryReservaMARCA_VEICULO: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBId_RSV: TDBEdit;
    DBNomeSolici: TDBEdit;
    FDQryReservaHORA_FIM_RESERVA: TTimeField;
    Label7: TLabel;
    FDQryReservaEMAIL: TStringField;
    Label8: TLabel;
    DBEdtEmail: TDBEdit;
    IdSMTP: TIdSMTP;
    IdMessage: TIdMessage;
    IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
    DataSetProvider1: TDataSetProvider;
    LblNecessario: TLabel;
    FDQryReservaNECESSARIOS: TStringField;
    DBEdtNecessarios: TDBEdit;
    FDQryReservaMOTIVO_RESERVA: TStringField;
    DBMotivo_Rsv: TDBEdit;
    DBComboBox1: TDBComboBox;
    TimePicker1: TTimePicker;
    TimePicker2: TTimePicker;
    DateTimePicker1: TDateTimePicker;
    procedure BtnGravarClick(Sender: TObject);
    procedure DBComboBox1Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormReserva: TFormReserva;

implementation

{$R *.dfm}



procedure TFormReserva.BtnGravarClick(Sender: TObject);
Var
  // Variaveis para o E-mail
  IdSMTP:                           TIdSMTP;
  IdMessage:                        TIdMessage;
  Lsocketssl:                       TIdSSLIOHandlerSocketOpenSSL;
  Motivo, Marca, Necessario, Email: string;
  Data, HoraInicio, HoraFim:        string;
  Date, Hora_Inicio, Hora_Fim:      TDateTime;

begin

  inherited;
  // Instaciando variaveis para o E-mail
  Motivo := DBMotivo_Rsv.Text;
  Marca := DBComboBox1.Text;
  //Data := cxDBDate_rsv.Text;
  Date:=DateTimePicker1.Date;
  Data:=DateToStr(Date);
  Hora_Inicio := TimePicker1.Time;
  HoraInicio:=TimeToStr(Hora_Inicio);
  Hora_fim := TimePicker2.Time;
  HoraFim:=TimeToStr(Hora_Fim);
  Necessario := DBEdtNecessarios.Text;
  Email := DBEdtEmail.Text;

  IdSMTP    :=     TIdSMTP.Create(Self);
  IdMessage :=     TIdMessage.Create(Self);
  Lsocketssl:=     TIdSSLIOHandlerSocketOpenSSL.Create(Self);

//parametros para segurança do enviar e-mail;
  with Lsocketssl do
  begin
    with SSLOptions do
    begin
      Mode := sslmClient;
      Method := sslvTLSv1_2;
    end;
    Host := 'smtp.gmail.com'; // SMTP.GMAIL.COM
    Port := 465; // 587 Tls   para outros 485
  end;
  // configurações do smtp
  with IdSMTP do
  begin
    IdSMTP.IOHandler := Lsocketssl;
    IdSMTP.Host := 'smtp.gmail.com';
    IdSMTP.Port := 465;
    IdSMTP.AuthType := satDefault;
    IdSMTP.Username := 'alan.nygga@gmail.com';
    IdSMTP.Password := 'rntgfrzfaryzqdfq';
    IdSMTP.UseTLS := utUseImplicitTLS;
  end;
  // configurações da mensagem
  with IdMessage do
  begin
    IdMessage.From.Address := Email;
    IdMessage.From.Name := DBEdtEmail.Text;
    IdMessage.ReplyTo.EMailAddresses := IdMessage.From.Address;
    IdMessage.Subject := Motivo;
    IdMessage.Body.Add('Motivo:   ' + Motivo);
    IdMessage.Body.Add('Necessarios: ' + Necessario);
    IdMessage.Body.Add('Data e Hora do Agendamento:  ' + Data + '  ' +
    HoraInicio + ' ' + 'a' + ' ' + HoraFim);
    IdMessage.Body.Add('Veiculo:  ' + Marca + ' ');
    IdMessage.Recipients.Add.Text := 'alan.nygga@gmail.com';
    IdMessage.Recipients.Add.Text := Email;
  end;
  // SMTP CONNECT
  try
    IdSMTP.Connect;
    IdSMTP.Send(IdMessage);
    IdSMTP.Authenticate;
    MessageDlg('Mensagem enviada com sucesso!', mtInformation, [mbOK], 0);
    Close;
//SMTP EXCEPTION CASO DER ERRO;
  except
    On E: Exception do
    begin
      MessageDlg('Erro ao enviar a mensagem: ' + E.Message, mtWarning,
        [mbOK], 0);
      Close;
    end;

  end;
//DESCONECTANDO E LIMPANDO E-MAIL DA MEMORIA.
  IdSMTP.Disconnect;
  FreeAndNil(IdMessage);
  FreeAndNil(IdSMTP);
  FreeAndNil(IdSSLIOHandlerSocketOpenSSL);
  Close;
end;



procedure TFormReserva.DBComboBox1Change(Sender: TObject);
VAR i:Integer;
Marca:string;
begin
  inherited;
   i:= DBComboBox1.ItemIndex;
   Marca:= DBComboBox1.Items.Strings[i];
end;

end.
