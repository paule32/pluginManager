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
    HM: HMODULE;
  public
    procedure LoadPlugin(FileName: String);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.LoadPlugin(FileName: String);
var
  RegisterPlugin: function(app: TApplication): Boolean; stdcall;
  varResult: Variant;
begin
  HM := LoadLibrary(PChar(FileName));
  try
    try
      if HM = 0 then
      raise Exception.Create('Error: during plugin load.');

      @RegisterPlugin := GetProcAddress(HM, 'RegisterPlugin');
      if not(Assigned(RegisterPlugin)) then
      raise Exception.Create('Error: could not be registered.');

      if not(RegisterPlugin(Application)) then
      raise Exception.Create('Error: plugin not for this Application.');
    except
      on E: Exception do
      begin
        ShowMessage('Error:' +
        #10 + 'ClassName: '  + E.ClassName +
        #10 + 'Message  : '  + E.Message);
      end;
    end;
  finally
    FreeLibrary(HM);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  LoadPlugin('ControlStandard.dll');
end;

end.
