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
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  Project1_TLB;

procedure TForm1.Button1Click(Sender: TObject);
var
  MyObject: IAutoTest;
begin
  MyObject := CoAutoTest.Create;
  MyObject.testFunktion;
end;

end.
