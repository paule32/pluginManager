unit Project1_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 2023-08-27 02:05:26 from Type Library described below.

// ************************************************************************  //
// Type Lib: E:\Program Files (x86)\Borland\Delphi7\Projects\COMservices\test3\Project1.tlb (1)
// LIBID: {A8A04593-6838-4CF0-AA45-CE47C99044E7}
// LCID: 0
// Helpfile: 
// HelpString: Project1 Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  Project1MajorVersion = 1;
  Project1MinorVersion = 0;

  LIBID_Project1: TGUID = '{A8A04593-6838-4CF0-AA45-CE47C99044E7}';

  IID_IAutoTest: TGUID = '{B50379F0-0E6F-40E1-A2B8-3A2287601914}';
  CLASS_AutoTest: TGUID = '{5DCF11FE-46DC-4AB4-A94F-50C040330FA4}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IAutoTest = interface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  AutoTest = IAutoTest;


// *********************************************************************//
// Interface: IAutoTest
// Flags:     (256) OleAutomation
// GUID:      {B50379F0-0E6F-40E1-A2B8-3A2287601914}
// *********************************************************************//
  IAutoTest = interface(IUnknown)
    ['{B50379F0-0E6F-40E1-A2B8-3A2287601914}']
    function testFunktion: HResult; stdcall;
  end;

// *********************************************************************//
// The Class CoAutoTest provides a Create and CreateRemote method to          
// create instances of the default interface IAutoTest exposed by              
// the CoClass AutoTest. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAutoTest = class
    class function Create: IAutoTest;
    class function CreateRemote(const MachineName: string): IAutoTest;
  end;

implementation

uses ComObj;

class function CoAutoTest.Create: IAutoTest;
begin
  Result := CreateComObject(CLASS_AutoTest) as IAutoTest;
end;

class function CoAutoTest.CreateRemote(const MachineName: string): IAutoTest;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AutoTest) as IAutoTest;
end;

end.
