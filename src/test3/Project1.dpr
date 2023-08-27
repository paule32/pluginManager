library Project1;

uses
  ComServ,
  Project1_TLB in 'Project1_TLB.pas',
  Unit1 in 'Unit1.pas' {AutoTest: CoClass};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
