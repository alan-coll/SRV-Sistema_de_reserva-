unit uFmain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, UformFzReserva, uBiblioteca,
  uFpPrincipal;

const
 Versão='Reserva manager SRV'#1#0#0#0'Alan Silva'#1#0'V1.0 16/01/2023';
 //1.Melhoria, Colocado um comboBox para a lista de veiculos.v1.1;
type
  TFormMain = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    ReservarVeiculos1: TMenuItem;
    Consultar1: TMenuItem;
    procedure ReservarVeiculos1Click(Sender: TObject);
    procedure Consultar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses uConsultarReserva;

procedure TFormMain.Consultar1Click(Sender: TObject);
begin
  //
  TRY
    FConsultarReserva := TFConsultarReserva.Create(Application);
    FConsultarReserva.Show;

  FINALLY
    //

  END;

end;

procedure TFormMain.ReservarVeiculos1Click(Sender: TObject);
begin
  // colocando para chamar tela de cadastro
  FormReserva := TFormReserva.Create(Application);
  FormReserva.Show;

end;

end.
