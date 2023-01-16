unit uBiblioteca;

interface

uses
  System.SysUtils, IniFiles, vcl.Forms;

procedure SetValorIni(plocal, psessao, psubsessao, pvalor: string);
function GetvalorIni(plocal, psessao, psubsessao: string): string;

implementation

procedure SetValorIni(plocal, psessao, psubsessao, pvalor: string);

Var
  Varquivo: TiniFile;

begin
  Varquivo := TiniFile.create(plocal);

  Varquivo.WriteString(psessao, psubsessao, pvalor);
  Varquivo.Free;
end;

function GetvalorIni(plocal, psessao, psubsessao: string): string;
var
  Varquivo: TiniFile;
begin
  Varquivo := TiniFile.create(plocal);

  Result := Varquivo.ReadString(psessao, psubsessao, '');

  Varquivo.Free;

end;

end.
