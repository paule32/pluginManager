// -------------------------------------------------------------------
// File:    code.pas
// Author:  paule32 - Jens Kallup
// License: (c) 2023  non-profit Software
//          All Rights Reserved - only for private or education usage.
// -------------------------------------------------------------------
unit code;

interface

uses
  Forms, SysUtils, Dialogs;

type
  TPluginInterface = class(TObject)
  private
    FFileVersion    : String;
    FFileAuthor     : String;
    FFileDescription: String;

    function GetVersion: String;
    function GetAuthor: String;
    function GetDescription: String;
  public
    constructor Create;
    destructor Destroy; override;
  public
    property Description: String read FFileDescription;
    property Author: String read FFileAuthor;
    property Version: String read FFileVersion;
  end;

function RegisterPlugin(app: TApplication): WideString; stdcall; export;

implementation

constructor TPluginInterface.Create;
begin
  inherited Create;
  FFileVersion := 'testfile';
end;
destructor TPluginInterface.Destroy;
begin
  inherited Destroy;
end;

function TPluginInterface.GetVersion: String;
begin
  result := FFileVersion;
end;

function TPluginInterface.GetAuthor: String;
begin
  result := FFileAuthor;
end;

function TPluginInterface.GetDescription: String;
begin
  result := FFileDescription;
end;

function RegisterPlugin(app: TApplication): WideString; stdcall; export;
var
  C: TPluginInterface;
begin
  ShowMessage(app.ExeName);
  C := TPluginInterface.Create;
  ShowMessage(C.GetVersion);
  FreeAndNil(C);
  result := WideString('lolo');
end;

end.
