unit Project1_TLB;

{$TYPEDADDRESS OFF}
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses
  Windows, ActiveX, Classes, Graphics, StdVCL, Variants;

const
  LIBID_Project1: TGUID = '{A8A04593-6838-4CF0-AA45-CE47C99044E7}';
  IID_IAutoTest : TGUID = '{B50379F0-0E6F-40E1-A2B8-3A2287601914}';
  CLASS_AutoTest: TGUID = '{5DCF11FE-46DC-4AB4-A94F-50C040330FA4}';

type
  IAutoTest = interface;
  AutoTest  = IAutoTest;

  IAutoTest = interface(IUnknown)
    ['{B50379F0-0E6F-40E1-A2B8-3A2287601914}']
    function testFunktion: HResult; stdcall;
  end;

  CoAutoTest = class
    class function Create: IAutoTest;
    class function CreateRemote(const MachineName: string): IAutoTest;
  end;

implementation

uses ComObj;

class function CoAutoTest.Create: IAutoTest; begin Result := CreateComObject(CLASS_AutoTest) as IAutoTest; end;
class function CoAutoTest.CreateRemote(const MachineName: string): IAutoTest;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AutoTest) as IAutoTest;
end;

end.
