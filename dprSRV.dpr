program dprSRV;

uses
  Vcl.Forms,
  UdmReserva in 'UdmReserva.pas' {DmReserva: TDataModule} ,
  uBiblioteca in 'uBiblioteca.pas',
  Config_banco in 'Config_banco.pas' {Config_bd} ,
  uConsultarReserva in 'uConsultarReserva.pas' {FConsultarReserva} ,
  uFpPrincipal in 'uFpPrincipal.pas' {FormPrincipal} ,
  uFmain in 'uFmain.pas' {FormMain} ,
  UformFzReserva in 'UformFzReserva.pas' {FormReserva};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskBar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TConfig_bd, Config_bd);
  Application.CreateForm(TDmReserva, DmReserva);
  Application.Run;

end.


