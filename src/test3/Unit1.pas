unit Unit1;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, ActiveX, Classes, ComObj, Project1_TLB, StdVcl, Dialogs;

type
  TAutoTest = class(TTypedComObject, IAutoTest)
  protected
    function testFunktion: HResult; stdcall;
    {Declare IAutoTest methods here}
  end;

implementation

uses ComServ;

function TAutoTest.testFunktion: HResult;
begin
  ShowMessage('huhu');
end;

initialization
  TTypedComObjectFactory.Create(ComServer, TAutoTest, Class_AutoTest,
    ciMultiInstance, tmApartment);
end.
