// -------------------------------------------------------------------
// File:    code.pas
// Author:  paule32 - Jens Kallup
// License: (c) 2023  non-profit Software
//          All Rights Reserved - only for private or education usage.
// -------------------------------------------------------------------
unit code;

interface

uses
  Dialogs, Interfaces;

type
  TControlsStandard = class(TInterfacedObject, IPluginCentral)
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

implementation

constructor TControlsStandard.Create;
begin
  inherited Create;
end;
destructor TControlsStandard.Destroy;
begin
  inherited Destroy;
end;

function TControlsStandard.GetVersion: String;
begin
ShowMessage('huhu');
  result := FFileVersion;
end;

function TControlsStandard.GetAuthor: String;
begin
  result := FFileAuthor;
end;

function TControlsStandard.GetDescription: String;
begin
  result := FFileDescription;
end;

end.
