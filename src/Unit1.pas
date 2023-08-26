unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    FRootModule: HMODULE;
  public
    procedure CallExternal;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.CallExternal;
var
  RegisterPlugin: function(var AResult: Variant; app: TApplication): Boolean;
  varResult: Variant;
begin
  FRootModule := LoadLibrary(PChar('ControlStandard.dll'));
  if FRootModule = 0 then
  begin
    ShowMessage('Error during plugin load.');
    exit;
  end;
  @RegisterPlugin := GetProcAddress(FRootModule, 'RegisterPlugin');
  if not(Assigned(RegisterPlugin)) then
  begin
    ShowMessage('Error could not be registered.');
    FreeLibrary(FRootModule);
    exit;
  end;

  varResult := 42;
  RegisterPlugin(varResult,Application);

  if varResult = 32 then
  ShowMessage('klatsch');
  FreeLibrary(FRootModule);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  CallExternal;
end;

end.
