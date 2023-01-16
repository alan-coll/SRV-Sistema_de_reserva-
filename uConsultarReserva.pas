unit uConsultarReserva;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  Data.DB, FireDAC.Comp.DataSet, Vcl.WinXPickers, Vcl.StdCtrls, Vcl.ComCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBasic, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray,
  dxSkinOffice2019White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringtime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.Grids, Vcl.DBGrids, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, dxCore, cxDateUtils;

type
  TFConsultarReserva = class(TForm)
    PnConsultar: TPanel;
    lblConsultaReserva: TLabel;
    DBGrid1: TDBGrid;
    DsConsulta: TDataSource;
    FDQryConsulta: TFDQuery;
    FdTransactConsulta: TFDTransaction;
    FDQryConsultaNOME_SOLICITE: TStringField;
    FDQryConsultaMOTIVO_RESERVA: TStringField;
    FDQryConsultaID_RESERVA: TIntegerField;
    FDQryConsultaHORA_RESERVA: TTimeField;
    FDQryConsultaMARCA_VEICULO: TStringField;
    FDQryConsultaHORA_FIM_RESERVA: TTimeField;
    FDQryConsultaEMAIL: TStringField;
    FDQryConsultaDATA_RESERVA: TDateField;
    FDQryConsultaNECESSARIOS: TStringField;
    LblMarca: TLabel;
    Label1: TLabel;
    Edit1: TEdit;
    BtnSair: TButton;
    DateTimePicker1: TDateTimePicker;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);

  private
    { Private declarations }

  public

    { Public declarations }
  end;

var
  FConsultarReserva: TFConsultarReserva;

implementation

{$R *.dfm}

uses UdmReserva, uBiblioteca;

//função ao sair
procedure TFConsultarReserva.BtnSairClick(Sender: TObject);
begin
  FDQryConsulta.SQL.Clear;
  FDQryConsulta.Close;
  Close;
end;
//validando o filtro da Data no banco
procedure TFConsultarReserva.DateTimePicker1Change(Sender: TObject);
begin
  FDQryConsulta.Filter := 'Data_reserva >=' +
    QuotedStr(DateToStr(DateTimePicker1.Date)) + 'and Data_reserva <=' +
    QuotedStr(DateToStr(DateTimePicker1.Date));
  FDQryConsulta.Filtered := True;

end;
//Valindando a Marca que vai no edit
procedure TFConsultarReserva.Edit1Change(Sender: TObject);
begin
  FDQryConsulta.Filtered := False;
  FDQryConsulta.Filter := 'Marca_veiculo like' +
    QuotedStr('%' + Edit1.Text + '%');
  FDQryConsulta.Filtered := True;

end;
//função ao fechar o form......
procedure TFConsultarReserva.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  FDQryConsulta.Close;
end;
//função para abrir o sql e ir trazendo os dados conforme é digitado;
procedure TFConsultarReserva.FormShow(Sender: TObject);
begin
  FDQryConsulta.Open();
end;

end.
