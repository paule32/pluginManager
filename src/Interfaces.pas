// --------------------------------------------------
// File:   Interfaces.pas
// Author: Jens Kallup - paule32
//         (c) 2023 Jens Kallup - non-profit Software
// --------------------------------------------------
unit Interfaces;
interface

type
  IPluginCentral = interface
    ['{19790208-2023-0802-0002-CAFEBABE0000}']

    function GetDescription: String;
    function GetAuthor: String;
    function GetVersion: String;
  end;

implementation
end.
